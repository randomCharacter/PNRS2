if [file exists "work"] {vdel -all}
vlib work

#VHDL DUT
vcom -f design.f

vopt kafa_tb -o kafa_tb_optimized  +acc +cover=sbfec+kafa(rtl).
#vopt kafa_tb -o kafa_tb_optimized
vsim kafa_tb_optimized
set NoQuitOnFinish 1
onbreak {resume}
log /* -r
run -all
quit
