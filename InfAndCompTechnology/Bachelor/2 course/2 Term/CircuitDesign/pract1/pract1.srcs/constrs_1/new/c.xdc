create_clock -period 10.000 -name clk_100 -waveform {0 5} -add [get_ports clk]
set_property PACKAGE_PIN E3 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
