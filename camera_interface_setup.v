`timescale 1ns/1ns

module camera_interface_setup
# (parameter INPUT_CLK_FREQ = 25000000)
(
input wire clk,
input wire reset,
input wire SCCB_ready_signal,
input wire [15:0] rom_out,
input wire start,
output wire [7:0] rom_select,
output wire done,
output wire [7:0] sccb_sub_address,
output wire [7:0] sccb_set_data,
output wire sccb_start_sign
);

reg [2:0] OV7670_SETUP_FSM_state = 0;
reg [2:0] FSM_return_state = 0;
reg [31:0] timer = 0;
reg [7:0] rom_select_reg;
reg done_reg;
reg [7:0] sccb_sub_address_reg;
reg [7:0] sccb_set_data_reg;
reg sccb_start_sign_reg;

assign done = done_reg;
assign rom_select = rom_select_reg;
assign sccb_sub_address = sccb_sub_address_reg;
assign sccb_set_data = sccb_set_data_reg;
assign sccb_start_sign = sccb_start_sign_reg;

localparam FSM_IDLE = 0;
localparam FSM_SEND = 1;
localparam FSM_DONE = 2;
localparam FSM_TIMER = 3;

always @(posedge clk or negedge reset) begin
    if (!reset) begin
        rom_select_reg <= 0;
        done_reg <= 0;
        sccb_sub_address_reg <= 0;
        sccb_set_data_reg <= 0;
        sccb_start_sign_reg <= 0;
    end
    else begin
        case (OV7670_SETUP_FSM_state) 

            FSM_IDLE: begin
                OV7670_SETUP_FSM_state <= #1 start ? FSM_SEND : FSM_IDLE;
                rom_select_reg <= #1 0;
                done_reg <= start ? 0 : done_reg;
            end

            FSM_SEND: begin
                case (rom_out)

                    16'hFFFF: begin
                        OV7670_SETUP_FSM_state <= #1 FSM_DONE;    
                        sccb_start_sign_reg <= #1 0;                
                    end

                    16'hFFF0:  begin
                        timer <= #1 (INPUT_CLK_FREQ / 100);
                        OV7670_SETUP_FSM_state <= #1 FSM_TIMER;
                        FSM_return_state <= #1 FSM_SEND;
                        rom_select_reg <= #1 rom_select_reg + 1;                        
                    end

                    default: begin
                        if (SCCB_ready_signal) begin
                            OV7670_SETUP_FSM_state <= #1 FSM_TIMER;
                            FSM_return_state <= #1 FSM_SEND;
                            timer <= 0;
                            rom_select_reg <= #1 rom_select_reg + 1;
                            sccb_sub_address_reg <= #1 rom_out[15:8];
                            sccb_set_data_reg <= #1 rom_out[7:0];
                            sccb_start_sign_reg <= #1 1;
                        end
                    end
                endcase
            end

            FSM_DONE: begin
                OV7670_SETUP_FSM_state <= #1 FSM_IDLE;
                done_reg <= #1 1;
                sccb_start_sign_reg <= #1 0;
            end

            FSM_TIMER: begin
                OV7670_SETUP_FSM_state <= #1 (timer == 0) ? FSM_return_state : FSM_TIMER;
                timer <= #1 (timer == 0) ? 0 : timer - 1;
                sccb_start_sign_reg <= #1 0;
            end
        endcase
    end
end

endmodule
