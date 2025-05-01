`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/17/2025 01:47:58 PM
// Design Name: 
// Module Name: SIPO_4
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

module SIPO_4(
 input in,
 input clk,
 input reset,
 output [3:0] out
 );

 D_2 d1(in, clk, reset, out[0]);
 D_2 d2(out[0], clk, reset, out[1]);
 D_2 d3(out[1], clk, reset, out[2]);
 D_2 d4(out[2], clk, reset, out[3]);
endmodule
module D_2(
 input D,
 input clk,
 input reset,
 output reg Q
 );

 always @(posedge clk or negedge reset)
 begin
 if(~reset)
 Q<=1'b0;
 else
 Q<=D;
 end
endmodule