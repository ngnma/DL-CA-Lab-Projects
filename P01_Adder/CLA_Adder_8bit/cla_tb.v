`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:45:34 10/05/2021
// Design Name:   cla8_adder
// Module Name:   E:/Uni/AZDL/CLA_Adder_8bit/cla_tb.v
// Project Name:  CLA_Adder_8bit
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: cla8_adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module cla_tb;

	// Inputs
	reg [7:0] a;
	reg [7:0] b;
	reg cin;

	// Outputs
	wire [7:0] sum;
	wire cout;

	// Instantiate the Unit Under Test (UUT)
	cla8_adder uut (
		.a(a), 
		.b(b), 
		.cin(cin), 
		.sum(sum), 
		.cout(cout)
	);

	initial begin
		// Initialize Inputs
		a=8'b11110000;
		b=8'b00001111;
		cin = 0;
		#50
		a=8'b11110000;
		b=8'b00001111;
		cin = 1'b1;
		#50;
      a=9;
		b=7;
		cin = 1'b1;
	end
      
endmodule

