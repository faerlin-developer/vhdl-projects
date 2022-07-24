# Clock
set_property PACKAGE_PIN W5 [get_ports clock]							
set_property IOSTANDARD LVCMOS33 [get_ports clock]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clock]

# SW3-SW0
set_property PACKAGE_PIN W17 [get_ports {switch[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {switch[3]}]

set_property PACKAGE_PIN W16 [get_ports {switch[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {switch[2]}]

set_property PACKAGE_PIN V16 [get_ports {switch[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {switch[1]}]

set_property PACKAGE_PIN V17 [get_ports {switch[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {switch[0]}]

# Buttons
set_property PACKAGE_PIN U18 [get_ports btnC]						
set_property IOSTANDARD LVCMOS33 [get_ports btnC]

set_property PACKAGE_PIN W19 [get_ports btnL]						
set_property IOSTANDARD LVCMOS33 [get_ports btnL]

set_property PACKAGE_PIN T17 [get_ports btnR]						
set_property IOSTANDARD LVCMOS33 [get_ports btnR]

set_property PACKAGE_PIN U17 [get_ports btnD]						
set_property IOSTANDARD LVCMOS33 [get_ports btnD]

# 7 segment display

# 7 segments
set_property PACKAGE_PIN W7 [get_ports {seg[0]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {seg[0]}]

set_property PACKAGE_PIN W6 [get_ports {seg[1]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {seg[1]}]

set_property PACKAGE_PIN U8 [get_ports {seg[2]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {seg[2]}]

set_property PACKAGE_PIN V8 [get_ports {seg[3]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {seg[3]}]

set_property PACKAGE_PIN U5 [get_ports {seg[4]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {seg[4]}]

set_property PACKAGE_PIN V5 [get_ports {seg[5]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {seg[5]}]

set_property PACKAGE_PIN U7 [get_ports {seg[6]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {seg[6]}]

# Decimal Point
set_property PACKAGE_PIN V7 [get_ports dp]							
set_property IOSTANDARD LVCMOS33 [get_ports dp]

# Digit Position
set_property PACKAGE_PIN U2 [get_ports {an[0]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {an[0]}]

set_property PACKAGE_PIN U4 [get_ports {an[1]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {an[1]}]

set_property PACKAGE_PIN V4 [get_ports {an[2]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {an[2]}]

set_property PACKAGE_PIN W4 [get_ports {an[3]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {an[3]}]

create_clock -name clk_virt -period 10
set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]