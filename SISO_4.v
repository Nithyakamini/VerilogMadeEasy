`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/17/2025 01:37:06 PM
// Design Name: 
// Module Name: SISO_4
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

module SISO_4(
 input in,
 input clk,
 input reset,
 output out
 );

 wire x1,x2,x3;
 D_3 d1(in, clk, reset, x1);
 D_3 d2(x1, clk, reset, x2);
 D_3 d3(x2, clk, reset, x3);
 D_3 d4(x3, clk, reset, out);
endmodule
