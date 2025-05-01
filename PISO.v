`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/17/2025 02:16:07 PM
// Design Name: 
// Module Name: PISO
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


module PISO (
    input clk,            // Clock signal
    input rst_n,          // Active-low reset
    input load,           // Load signal to load parallel input
    input [3:0] data_in,  // Parallel data input (4 bits)
    output serial_out     // Serial data output
);

    reg [3:0] shift_reg;   // Shift register to hold the parallel data
    wire d0, d1, d2, d3;   // D flip-flop outputs

    // Instantiate 4 D flip-flops for the shift register
    DFF dff0 (.clk(clk), .rst_n(rst_n), .d(data_in[0]), .q(d0));
    DFF dff1 (.clk(clk), .rst_n(rst_n), .d(data_in[1]), .q(d1));
    DFF dff2 (.clk(clk), .rst_n(rst_n), .d(data_in[2]), .q(d2));
    DFF dff3 (.clk(clk), .rst_n(rst_n), .d(data_in[3]), .q(d3));

    // Shift the values in the shift register on each clock cycle
    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            shift_reg <= 4'b0;  // Reset shift register
        end
        else if (load) begin
            shift_reg <= data_in;  // Load the parallel input
        end
        else begin
            // Shift the data by moving the values left
            shift_reg <= {shift_reg[2:0], shift_reg[3]};
        end
    end

    // Assign the serial output from the MSB of the shift register
    assign serial_out = shift_reg[3];
    
endmodule

// D Flip-Flop module definition
module DFF (
    input clk,            // Clock signal
    input rst_n,          // Active-low reset
    input d,              // Data input
    output reg q          // Data output
);
    always @(posedge clk or negedge rst_n) begin
        if (~rst_n)
            q <= 0;        // Reset output to 0
        else
            q <= d;        // Transfer data to output on clock edge
    end
endmodule

