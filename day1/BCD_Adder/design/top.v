`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.06.2026 17:36:38
// Design Name: 
// Module Name: BCD_adder_using_ripplecarryadder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module BCD_adder_using_ripplecarryadder(input [3:0]A_BCD,[3:0]B_BCD,cin_BCD,output [3:0]S_BCD,cout_BCD);
wire [3:0]w;
wire w5,w6,w7,w8;
ripplecarryadder RC1(A_BCD,B_BCD,cin_BCD,w,w7);
and(w5,w4,w[3]);
and(w6,w4,w[2]);
or(w8,w5,w6,w7);
ripplecarryadder RC2(w,{1'b0,w8,w8,1'b0},1'b0,S_BCD,cout_BCD);

endmodule

