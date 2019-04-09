if [file exists "work"] {vdel -all}
vlib work

#VHDL DUT
vcom -f design.f

vopt kafa_tb -o kafa_tb_optimized  +acc +cover=sbfec+kafa(rtl).
vsim kafa_tb_optimized -coverage
set NoQuitOnFinish 1
onbreak {resume}
log /* -r
run -all
quit
