`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:20:53 10/05/2021 
// Design Name: 
// Module Name:    cla8_adder 
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
module cla8_adder(
    input [7:0] a,
    input [7:0] b,
    input cin,
    output [7:0] sum,
    output cout
    );
	 
	wire p0,p1,p2,p3,p4,p5,p6,p7,p8,g0,g1,g2,g3,g4,g5,g6,g7,g8,c1,c2,c3,c4,c5,c6,c7,c8;
    assign p0=(a[0]^b[0]),
    p1=(a[1]^b[1]),
    p2=(a[2]^b[2]),
    p3=(a[3]^b[3]),
    
    p4=(a[4]^b[4]),
    p5=(a[5]^b[5]),
    p6=(a[6]^b[6]),
    p7=(a[7]^b[7])
    ;
    assign g0=(a[0]&b[0]),
    g1=(a[1]&b[1]),
    g2=(a[2]&b[2]),
    g3=(a[3]&b[3]),
    
    g4=(a[4]&b[4]),
    g5=(a[5]&b[5]),
    g6=(a[6]&b[6]),
    g7=(a[7]&b[7])
    ;
    assign c0=cin,
    c1=g0|(p0&cin),
    c2=g1|(p1&g0)|(p1&p0&cin),
    c3=g2|(p2&g1)|(p2&p1&g0)|(p2&p1&p0&cin),
    c4=g3|(p3&g2)|(p3&p2&g1)|(p3&p2&p1&g0)|(p3&p2&p1&p0&cin),
    
    c5=g4|(p4&g3)|(p4&p3&g2)|(p4&p3&p2&g1)|(p4&p3&p2&p1&g0)|(p4&p3&p2&p1&p0&cin),
    c6=g5|(p5&g4)|(p5&p4&g3)|(p5&p4&p3&g2)|(p5&p4&p3&p2&g1)|(p5&p4&p3&p2&p1&g0)|(p5&p4&p3&p2&p1&p0&cin),
    c7=g6|(p6&g5)|(p6&p5&g4)|(p6&p5&p4&g3)|(p6&p5&p4&p3&g2)|(p6&p5&p4&p3&p2&g1)|(p6&p5&p4&p3&p2&p1&p0&cin),
    c8=g7|(p7&g6)|(p7&p6&g5)|(p7&p6&p5&g4)|(p7&p6&p5&p4&g3)|(p7&p6&p5&p4&p3&g2)|(p7&p6&p5&p4&p3&p2&g1)|(p7&p6&p5&p4&p3&p2&p1&p0&cin);

    
    assign sum[0]=p0^c0,
    sum[1]=p1^c1,
    sum[2]=p2^c2,
    sum[3]=p3^c3,
    
    sum[4]=p4^c4,
    sum[5]=p5^c5,
    sum[6]=p6^c6,
    sum[7]=p7^c7
    ;
    assign cout=c8;


endmodule
