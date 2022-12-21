transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Thomas/Desktop/HDL-Final/HDL-Final/Counter_Main {C:/Users/Thomas/Desktop/HDL-Final/HDL-Final/Counter_Main/Counter_Main.v}
vlog -vlog01compat -work work +incdir+C:/Users/Thomas/Desktop/HDL-Final/HDL-Final/Counter_Main {C:/Users/Thomas/Desktop/HDL-Final/HDL-Final/Counter_Main/ComplexCounter_4Bit.v}

vlog -vlog01compat -work work +incdir+C:/Users/Thomas/Desktop/HDL-Final/HDL-Final/Counter_Main {C:/Users/Thomas/Desktop/HDL-Final/HDL-Final/Counter_Main/tb_Counter_Main.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  tb_Counter_Main

add wave *
view structure
view signals
run -all
