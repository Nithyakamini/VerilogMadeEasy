`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.04.2025 17:59:56
// Design Name: 
// Module Name: tff
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


module tff(
    input t,clk,reset,
    output reg q,qbar
    );
    always @(posedge clk or posedge reset)
    begin
    if (reset == 1)
    begin
    q = 1'b0;
    qbar = 1'b1;
    end
    else if (t == 1)
    begin
    q = ~q;
    qbar = ~qbar;
    end
    else
    begin
    q = q;
    qbar = qbar;
    end
    end
endmodule
