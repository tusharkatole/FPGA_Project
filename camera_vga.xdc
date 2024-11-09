

set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]

## Clock signal
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -period 10.000 -name sys_clk_pin -waveform {0.000 5.000} -add [get_ports clk]



##VGA Connector
set_property PACKAGE_PIN G19 [get_ports {vga_red[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_red[0]}]
set_property PACKAGE_PIN H19 [get_ports {vga_red[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_red[1]}]
set_property PACKAGE_PIN J19 [get_ports {vga_red[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_red[2]}]
set_property PACKAGE_PIN N19 [get_ports {vga_red[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_red[3]}]

set_property PACKAGE_PIN J17 [get_ports {vga_green[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_green[0]}]
set_property PACKAGE_PIN H17 [get_ports {vga_green[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_green[1]}]
set_property PACKAGE_PIN G17 [get_ports {vga_green[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_green[2]}]
set_property PACKAGE_PIN D17 [get_ports {vga_green[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_green[3]}]

set_property PACKAGE_PIN N18 [get_ports {vga_blue[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_blue[0]}]
set_property PACKAGE_PIN L18 [get_ports {vga_blue[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_blue[1]}]
set_property PACKAGE_PIN K18 [get_ports {vga_blue[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_blue[2]}]
set_property PACKAGE_PIN J18 [get_ports {vga_blue[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_blue[3]}]

set_property PACKAGE_PIN P19 [get_ports vga_hsync]
set_property IOSTANDARD LVCMOS33 [get_ports vga_hsync]
set_property PACKAGE_PIN R19 [get_ports vga_vsync]
set_property IOSTANDARD LVCMOS33 [get_ports vga_vsync]


## LEDs
# Display control state
#  LED 1~6
set_property PACKAGE_PIN U16 [get_ports {control_state[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {control_state[0]}]
set_property PACKAGE_PIN E19 [get_ports {control_state[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {control_state[1]}]
set_property PACKAGE_PIN U19 [get_ports {control_state[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {control_state[2]}]
set_property PACKAGE_PIN V19 [get_ports {control_state[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {control_state[3]}]
set_property PACKAGE_PIN W18 [get_ports {control_state[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {control_state[4]}]
set_property PACKAGE_PIN U15 [get_ports {control_state[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {control_state[5]}]


	
# LED 16
 set_property PACKAGE_PIN L1 [get_ports {ready_display}]					
 	set_property IOSTANDARD LVCMOS33 [get_ports {ready_display}]





set_property PACKAGE_PIN T1 [get_ports {testmode}]
	set_property IOSTANDARD LVCMOS33 [get_ports {testmode}]
set_property PACKAGE_PIN R2 [get_ports {reset}]
	set_property IOSTANDARD LVCMOS33 [get_ports {reset}]



set_property PACKAGE_PIN A14 [get_ports {ov7670_pwdn}]
set_property IOSTANDARD LVCMOS33 [get_ports {ov7670_pwdn}]
#Sch name = JB2
set_property PACKAGE_PIN A16 [get_ports {D_data[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {D_data[0]}]
#Sch name = JB3
set_property PACKAGE_PIN B15 [get_ports {D_data[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {D_data[2]}]
#Sch name = JB4
set_property PACKAGE_PIN B16 [get_ports {D_data[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {D_data[4]}]
#Sch name = JB7
set_property PACKAGE_PIN A15 [get_ports {ov7670_reset}]
set_property IOSTANDARD LVCMOS33 [get_ports {ov7670_reset}]
#Sch name = JB8
set_property PACKAGE_PIN A17 [get_ports {D_data[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {D_data[1]}]
#Sch name = JB9
set_property PACKAGE_PIN C15 [get_ports {D_data[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {D_data[3]}]
#Sch name = JB10
set_property PACKAGE_PIN C16 [get_ports {D_data[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {D_data[5]}]

##Pmod Header JC
#Sch name = JC1
set_property PACKAGE_PIN K17 [get_ports {D_data[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {D_data[6]}]
#Sch name = JC2
set_property PACKAGE_PIN M18 [get_ports {ov7670_xclk}]
set_property IOSTANDARD LVCMOS33 [get_ports {ov7670_xclk}]
#Sch name = JC3
set_property PACKAGE_PIN N17 [get_ports {href}]
set_property IOSTANDARD LVCMOS33 [get_ports {href}]
#Sch name = JC4
set_property PACKAGE_PIN P18 [get_ports {siod_to_ov7670}]
set_property IOSTANDARD LVCMOS33 [get_ports {siod_to_ov7670}]
#Sch name = JC7
set_property PACKAGE_PIN L17 [get_ports {D_data[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {D_data[7]}]

#Sch name = JC8
set_property PACKAGE_PIN M19 [get_ports {pclk}]
set_property IOSTANDARD LVCMOS33 [get_ports {pclk}]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets {pclk_IBUF}]


#Sch name = JC9
set_property PACKAGE_PIN P17 [get_ports {vsync}]
set_property IOSTANDARD LVCMOS33 [get_ports {vsync}]
#Sch name = JC10
set_property PACKAGE_PIN R18 [get_ports {sioc_to_ov7670}]
set_property IOSTANDARD LVCMOS33 [get_ports {sioc_to_ov7670}]





set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]

set_property BITSTREAM.CONFIG.CONFIGRATE 33 [current_design]
set_property CONFIG_MODE SPIx4 [current_design]
