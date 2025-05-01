`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.04.2025 22:21:14
// Design Name: 
// Module Name: univ
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


`timescale 1ns / 1ps

module univ(
    input clk,
    input sr,        // Serial Right input
    input sl,        // Serial Left input
    input clear,
    input rst,
    input [2:0] set, // 3-bit control for more shift modes
    input [3:0] pl,  // Parallel load data
    output reg [3:0] out
);

always @(posedge clk or posedge rst) begin
    if (rst)
        out <= 4'b0000;
    else if (clear)
        out <= 4'b0000;
    else begin
        case (set)
            3'b000: out <= out;                          // Hold
            3'b001: out <= {out[2:0], sl};               // Logical Shift Left
            3'b010: out <= {sr, out[3:1]};               // Logical Shift Right
            3'b011: out <= {out[3], out[3:1]};           // Arithmetic Shift Right (sign extend)
            3'b100: out <= pl;                           // Parallel Load
            default: out <= out;                         // Reserved
        endcase
    end
end

endmodule

