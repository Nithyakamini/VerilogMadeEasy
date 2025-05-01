`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.04.2025 21:19:50
// Design Name: 
// Module Name: alu_8bit
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


module alu_8bit (
    input  [7:0] A,
    input  [7:0] B,
    input  [2:0] sel,
    output reg [7:0] result
);

always @(*) begin
    case (sel)
        3'b000: result = A + B;            // Addition
        3'b001: result = A - B;            // Subtraction
        3'b010: result = A * B;            // Multiplication
        3'b011: result = A & B;            // AND
        3'b100: result = A | B;            // OR
        3'b101: result = ~A;               // NOT (on A only)
        3'b110: result = A << 1;           // Logical Shift Left
        3'b111: result = A >> 1;           // Logical Shift Right
        default: result = 8'b00000000;
    endcase
end

endmodule

