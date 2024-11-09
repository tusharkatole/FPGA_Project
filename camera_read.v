`timescale 1ns/1ns

module camera_read(
    input wire pclk,
    input wire reset,
    input wire vsync,
    input wire href,
    input wire [7:0] D_data,
    output wire [11:0] save_data,
    output wire [16:0] save_address,
    output wire write_enable
    );

    reg [16:0] save_address_reg;
    reg [18:0] save_address_next;
    reg [11:0] save_data_reg;
    reg [1:0] write_enable_check;
    reg write_enable_reg;
    reg [15:0] d_latch;

    assign save_data = save_data_reg;
    assign save_address = save_address_reg;
    assign write_enable = write_enable_reg;

    always @(posedge pclk or negedge reset) 
    begin
        if (!reset) begin        
            save_address_reg <= #1 {17{1'b0}};
            save_address_next <= #1 {19{1'b0}};
            write_enable_check <= #1 2'b00;
            d_latch <= #1 {16{1'b0}};
            write_enable_check <= #1 2'b00;
            save_data_reg <= #1 {12{1'b0}};
            write_enable_reg <= #1 0;
        end
        else begin
            if (vsync == 1) begin
                save_address_reg <= #1 {17{1'b0}};
                save_address_next <= #1 {19{1'b0}};
                write_enable_check <= #1 2'b00;
                d_latch <= #1 {16{1'b0}};
            end
            else begin
                save_data_reg <= #1 {d_latch[15:12], d_latch[10:7], d_latch[4:1]};
                save_address_reg <= #1 save_address_next[16:0];  
                write_enable_reg <= #1 write_enable_check[1];
                write_enable_check <= #1 {write_enable_check[0], (href && !write_enable_check[0])};
                d_latch <= #1 {d_latch[7:0], D_data};

                if (write_enable_check[1] == 1) begin
                    save_address_next <= #1 save_address_next + 1;
                end
            end 
        end
    end
endmodule
