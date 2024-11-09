`timescale 1ns/1ns

module camera_vga_display_top(
input wire clk,
input wire reset,
input wire pclk,
input wire vsync,
input wire href,
input wire [7:0] D_data,
input wire testmode,
output wire [5:0] control_state,
output wire [3:0] vga_red,
output wire [3:0] vga_green,
output wire [3:0] vga_blue,
output wire vga_hsync,
output wire vga_vsync,
output wire sioc_to_ov7670,
output wire siod_to_ov7670,
output wire ov7670_xclk,
output wire ov7670_pwdn,
output wire ov7670_reset,
output wire ready_display
);

wire locked;
wire ov7670_setup_done;
wire start_ov7670_hw_setup;
wire clk_100mhz;
wire clk_50mhz;
wire clk_25mhz;
wire wea;
wire [11:0] RGB_444_data;
wire [11:0] doutb;
wire [16:0] read_address;
wire [16:0] save_address;

assign ov7670_xclk = clk_25mhz;

control_flow_FSM control_flow_FSM(
    .clk(clk_25mhz),
    .reset(reset),
    .locked(locked), 
    .ov7670_setup_done(ov7670_setup_done),
    .start_capture(start_capture),
    .start_ov7670_hw_setup(start_ov7670_hw_setup),
    .control_state(control_state),
    .ready_display(ready_display),
    .testmode(testmode)
);

vga_controller vga_controller(
  .sys_clk(clk),
  .clk25(clk_25mhz),
  .reset(reset),
  .ram_output_data(doutb),
  .ready_display(ready_display),
  .read_RAM_address(read_address),
  .vga_red(vga_red),  
  .vga_green(vga_green),
  .vga_blue(vga_blue),
  .vga_hsync(vga_hsync),
  .vga_vsync(vga_vsync),
  .testmode(testmode)
);

camera_read camera_read(
  .pclk(pclk),
  .reset(reset),
  .vsync(vsync),
  .href(href),
  .D_data(D_data),
  .save_data(RGB_444_data),
  .save_address(save_address),
  .write_enable(wea)
);

camera_interface_top #(
    .INPUT_CLK_FREQ(25000000) 
) ov7670_setup_module_top (
.clk(clk_25mhz),
.reset(reset),
.start(start_ov7670_hw_setup),
.sioc_to_ov7670(sioc_to_ov7670),
.siod_to_ov7670(siod_to_ov7670),
.done(ov7670_setup_done),
.ov7670_pwdn(ov7670_pwdn),
.ov7670_reset(ov7670_reset)
);

clock_PLL_100_50_25MHz clock_PLL_100_50_25MHz(
  .clk_out1(clk_100mhz),
  .clk_out2(clk_50mhz),
  .clk_out3(clk_25mhz),
  .clk_in1(clk)
  );

buffer_RAM_12x131072 buffer_RAM_12x131072 (
  .clka(clk_50mhz),
  .wea(wea),
  .addra(save_address),
  .dina(RGB_444_data),
  .clkb(clk_50mhz),
  .addrb(read_address),
  .doutb(doutb)
);

ila_0 myila (
	.clk(clk_50mhz),
	.probe0(D_data)
);

endmodule
