`timescale 1ns/1ns

module camera_interface_top
#(
    parameter INPUT_CLK_FREQ = 25000000
)
(
input wire clk,
input wire reset,
input wire start,
output wire sioc_to_ov7670,
output wire siod_to_ov7670,
output wire done,
output wire ov7670_pwdn,
output wire ov7670_reset
);

wire [15:0] rom_out;
wire [7:0] rom_select;
wire [7:0] sccb_sub_address;
wire [7:0] sccb_set_data;
wire sccb_start_sign;
wire SCCB_ready_signal;
wire sioc;
wire siod;

assign sioc_to_ov7670 = sioc;
assign siod_to_ov7670 = siod;
assign ov7670_pwdn = 1'b0;
assign ov7670_reset = 1'b1;

camera_interface_setup #(.INPUT_CLK_FREQ(INPUT_CLK_FREQ)) camera_interface_setup(
    .clk(clk),
    .reset(reset),
    .SCCB_ready_signal(SCCB_ready_signal),
    .rom_out(rom_out),
    .start(start),    
    .rom_select(rom_select),
    .done(done),
    .sccb_sub_address(sccb_sub_address),
    .sccb_set_data(sccb_set_data),
    .sccb_start_sign(sccb_start_sign)
);

camera_interface_rom camera_interface_rom(
    .clk(clk),
    .rom_select(rom_select),
    .rom_out(rom_out)
);

sccb_protocol #(
    .INPUT_CLK_FREQ(INPUT_CLK_FREQ)
) sccb_protocol(
    .clk(clk),
    .reset(reset),
    .start(sccb_start_sign),
    .sub_address(sccb_sub_address),
    .set_data(sccb_set_data),
    .ready(SCCB_ready_signal),
    .SIOC(sioc),
    .SIOD(siod)
);

endmodule
