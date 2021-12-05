`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:24:33 10/04/2021 
// Design Name: 
// Module Name:    ripple_adder8 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ripple_adder8(
    input [7:0] a,
    input [7:0] b,
    input cin,
    output [7:0] sum,
    output cout
    );
	 
	 wire c1,c2,c3,c4,c5,c6,c7;
	 
	 full_adder FA1 (a[0] , b[0] , cin , sum[0] , c1);
	 full_adder FA2 (a[1] , b[1] , c1 , sum[1] , c2);
	 full_adder FA3 (a[2] , b[2] , c2 , sum[2] , c3);
	 full_adder FA4 (a[3] , b[3] , c3 , sum[3] , c4);
	 full_adder FA5 (a[4] , b[4] , c4 , sum[4] , c5);
	 full_adder FA6 (a[5] , b[5] , c5 , sum[5] , c6);
	 full_adder FA7 (a[6] , b[6] , c6 , sum[6] , c7);
	 full_adder FA8 (a[7] , b[7] , c7 , sum[7] , cout);


endmodule
