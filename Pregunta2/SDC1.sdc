create_clock -name clk -period 100.0 [get_ports clk]
set_clock_uncertainty -setup -from [get_clocks clk] -to [get_clocks clk] 0.5
set_input_delay -clock clk 2.0 [get_ports data_in]
set_output_delay -clock clk 2.0 [get_ports data_out]