if [file exists "work"] {vdel -all}
vlib work

# Comment out either the SystemVerilog or VHDL DUT.
# There can be only one!

#VHDL DUT
vcom -f design.f

# SystemVerilog DUT
#vlog ../misc/tinyalu.sv

vopt adder_tb -o adder_tb_optimized  +acc +cover=sbfec+adder(rtl).
vsim adder_tb_optimized -coverage
set NoQuitOnFinish 1
onbreak {resume}
log /* -r
run -all
quit
