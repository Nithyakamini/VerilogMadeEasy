`timescale 1ns / 1ps

module D_flipflop (
    input clk,    // Clock input
    input rst,    // Active-high Reset input
    input D,      // Data input
    output reg Q  // Output
);
    always @(posedge clk or posedge rst) begin
        if (rst)
            Q <= 0;  // Reset to 0
        else
            Q <= D;  // Store D value on clock edge
    end
endmodule

module ripple (
    input clk,     // Clock input
    input rst,     // Active-high Reset input
    output wire [3:0] q  // 4-bit Counter Output
);
    wire Q0, Q1, Q2, Q3;

    // First D Flip-Flop (Clock Driven Directly)
    D_flipflop FF0 (clk, rst, ~Q0, Q0);
    
    // The next flip-flops use the negedge of the previous Q
    D_flipflop FF1 (~Q0, rst, ~Q1, Q1);
    D_flipflop FF2 (~Q1, rst, ~Q2, Q2);
    D_flipflop FF3 (~Q2, rst, ~Q3, Q3);

    assign q = {Q3, Q2, Q1, Q0};  // Output as 4-bit bus
endmodule