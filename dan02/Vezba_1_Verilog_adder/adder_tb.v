`timescale 1ns / 1ps

module adder_tb;

	// Inputs
	reg [7:0] A_in;
	reg [7:0] B_in;
	reg Sel_in;

	// Outputs
	wire [8:0] Rez_out;

	// Instantiate the Unit Under Test (UUT)
	adder uut (
		.A_in(A_in), 
		.B_in(B_in), 
		.Sel_in(Sel_in), 
		.Rez_out(Rez_out)
	);

	initial begin
		// Initialize Inputs
		A_in = 0;
		B_in = 0;
		Sel_in = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

