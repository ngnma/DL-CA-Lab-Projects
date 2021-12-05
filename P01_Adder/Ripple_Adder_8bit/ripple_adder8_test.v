`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:07:03 10/04/2021
// Design Name:   ripple_adder8
// Module Name:   C:/Users/negin/Xilinx Projects/project_1/ripple_adder8_test.v
// Project Name:  project_1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ripple_adder8
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ripple_adder8_test;

	// Inputs
	reg [7:0] a;
	reg [7:0] b;
	reg cin;

	// Outputs
	wire [7:0] sum;
	wire cout;

	// Instantiate the Unit Under Test (UUT)
	ripple_adder8 uut (
		.a(a), 
		.b(b), 
		.cin(cin), 
		.sum(sum), 
		.cout(cout)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		cin = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		a=8'b11110000; b=8'b00001111; cin=1'b0;
		
		#50
      a=8'b11110000; b=8'b00001111; cin=1'b1;
		
		#50;
		a=8'b00011001; b=8'b00001011; cin=1'b1;
		
		// Add stimulus here

	end
      
endmodule

