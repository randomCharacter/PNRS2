`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////


module semafor_tb;

	// Inputs
	reg clk=1'b0;
	reg reset_n=1'b1;
	reg [1:0] Sel_in;

	// Outputs
	wire [2:0] RGB_A;
	wire [2:0] RGB_B;

	// Instantiate the Unit Under Test (UUT)
	semafor uut (
		.clk(clk), 
		.reset_n(reset_n), 
		.Sel_in(Sel_in), 
		.RGB_A(RGB_A), 
		.RGB_B(RGB_B)
	);

	initial begin
		// Initialize Inputs
		reset_n = 0;
		Sel_in = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
  always #10 clk = ~clk;		
		
endmodule

