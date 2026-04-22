set_property SRC_FILE_INFO {cfile:d:/Development/School/computer_arch/cpu_project/nexys-a7/nexys-a7.gen/sources_1/ip/clk_64_mhz/clk_64_mhz.xdc rfile:../../../nexys-a7.gen/sources_1/ip/clk_64_mhz/clk_64_mhz.xdc id:1 order:EARLY scoped_inst:inst} [current_design]
current_instance inst
set_property src_info {type:SCOPED_XDC file:1 line:54 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_in1]] 0.100
