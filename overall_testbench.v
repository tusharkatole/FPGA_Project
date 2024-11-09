`timescale 1ns/1ns

module overall_testbench;
reg clk;
reg test_pclk;
reg reset;
reg testmode;
reg vsync = 0;
reg href = 0;
reg [7:0] D_data;
wire [5:0] control_state; 
wire [3:0] vga_red, vga_green, vga_blue;
wire vga_hsync, vga_vsync;
wire sioc_to_ov7670, siod_to_ov7670;
wire ov7670_xclk;
wire ov7670_pwdn, ov7670_reset;
wire ready_display;

reg [31:0] count = 0;

camera_vga_display_top camera_vga_display_top(
    .clk(clk),
    .reset(reset),
    .pclk(test_pclk),
    .vsync(vsync),
    .href(href),
    .D_data(D_data),
    .testmode(testmode),
    .control_state(control_state),
    .vga_red(vga_red),
    .vga_green(vga_green),
    .vga_blue(vga_blue),
    .vga_hsync(vga_hsync),
    .vga_vsync(vga_vsync),
    .sioc_to_ov7670(sioc_to_ov7670),
    .siod_to_ov7670(siod_to_ov7670),
    .ov7670_xclk(ov7670_xclk),
    .ov7670_pwdn(ov7670_pwdn),
    .ov7670_reset(ov7670_reset),
    .ready_display(ready_display)  
);

localparam clk_period = 10;

always 
begin
    #(clk_period / 2) clk = ~clk;
end

localparam clk_period_25MHz = 40;

always 
begin
    #(clk_period_25MHz / 2) test_pclk = ~test_pclk;
end

initial begin    
    testmode = 0;
    clk = 1;
    test_pclk = 1;
    reset = 1;
    count = 320*240;    
    D_data = {8{1'b0}};
end

initial begin
    #120
    reset = 0;
    #120
    reset = 1;
    #500;
    vsync = 1;
    #80;
    vsync <= 0;
    #120;
    href = 1;
    D_data = 8'b1100_1010;
end

endmodule
