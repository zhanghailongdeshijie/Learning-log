transcript on
if ![file isdirectory verilog_libs] {
	file mkdir verilog_libs
}

vlib verilog_libs/altera_ver
vmap altera_ver ./verilog_libs/altera_ver
vlog -vlog01compat -work altera_ver {f:/altera/13.0sp1/quartus/eda/sim_lib/altera_primitives.v}

vlib verilog_libs/lpm_ver
vmap lpm_ver ./verilog_libs/lpm_ver
vlog -vlog01compat -work lpm_ver {f:/altera/13.0sp1/quartus/eda/sim_lib/220model.v}

vlib verilog_libs/sgate_ver
vmap sgate_ver ./verilog_libs/sgate_ver
vlog -vlog01compat -work sgate_ver {f:/altera/13.0sp1/quartus/eda/sim_lib/sgate.v}

vlib verilog_libs/altera_mf_ver
vmap altera_mf_ver ./verilog_libs/altera_mf_ver
vlog -vlog01compat -work altera_mf_ver {f:/altera/13.0sp1/quartus/eda/sim_lib/altera_mf.v}

vlib verilog_libs/altera_lnsim_ver
vmap altera_lnsim_ver ./verilog_libs/altera_lnsim_ver
vlog -sv -work altera_lnsim_ver {f:/altera/13.0sp1/quartus/eda/sim_lib/altera_lnsim.sv}

vlib verilog_libs/cycloneive_ver
vmap cycloneive_ver ./verilog_libs/cycloneive_ver
vlog -vlog01compat -work cycloneive_ver {f:/altera/13.0sp1/quartus/eda/sim_lib/cycloneive_atoms.v}

if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/11485/Desktop/Learning\ log/FPGA/pll/rti {C:/Users/11485/Desktop/Learning log/FPGA/pll/rti/pll.v}
vlog -vlog01compat -work work +incdir+C:/Users/11485/Desktop/Learning\ log/FPGA/pll/quartus_prj/ipcore_dir {C:/Users/11485/Desktop/Learning log/FPGA/pll/quartus_prj/ipcore_dir/pll_ip.v}
vlog -vlog01compat -work work +incdir+C:/Users/11485/Desktop/Learning\ log/FPGA/pll/quartus_prj/db {C:/Users/11485/Desktop/Learning log/FPGA/pll/quartus_prj/db/pll_ip_altpll.v}

vlog -vlog01compat -work work +incdir+C:/Users/11485/Desktop/Learning\ log/FPGA/pll/quartus_prj/../sim {C:/Users/11485/Desktop/Learning log/FPGA/pll/quartus_prj/../sim/tb_pll.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  pll

add wave *
view structure
view signals
run 100 ms
