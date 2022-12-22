transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Jhury/Desktop/SCHOOL\ STUFF/CpE\ -\ 3rd\ Year/HDL/FINAL\ PROJ/HDL-Final/Mode_Select {C:/Users/Jhury/Desktop/SCHOOL STUFF/CpE - 3rd Year/HDL/FINAL PROJ/HDL-Final/Mode_Select/Mode_Select.v}

vlog -vlog01compat -work work +incdir+C:/Users/Jhury/Desktop/SCHOOL\ STUFF/CpE\ -\ 3rd\ Year/HDL/FINAL\ PROJ/HDL-Final/Mode_Select {C:/Users/Jhury/Desktop/SCHOOL STUFF/CpE - 3rd Year/HDL/FINAL PROJ/HDL-Final/Mode_Select/tb_Mode_Select.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  tb_Mode_Select

add wave *
view structure
view signals
run -all
