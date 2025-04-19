module BCD_to_XS3(
    input [3:0] bcd,
    output reg [3:0] xs3
);
    always @(*) begin
        xs3 = bcd + 4'b0011;  // Simple BCD to XS3 shift
    end
endmodule

module ripple_adder(
    input [3:0] A,
    input [3:0] B,
    input Cin,
    output [4:0] Sum // 5-bit to capture overflow
);
    assign Sum = A + B + Cin;
endmodule

module correction_logic(
    input [4:0] sum,         // Raw sum from ripple adder
    input mode,              // 0 for add, 1 for subtract
    input swap_flag,         // Flag to indicate if A < B (swap occurred)
    output reg [3:0] corrected_sum,
    output reg carry_out
);
    always @(*) begin
        if (mode == 0) begin
            // ADDITION Mode
            if (sum[4] == 1 || sum[3:0] > 4'd9) begin
                corrected_sum = sum[3:0] + 4'b0011;
                carry_out = 1;  // set carry when correction happens
            end else begin
                corrected_sum = sum[3:0] - 4'b0011;
                carry_out = 0;
            end
        end else begin
            // SUBTRACTION Mode
            if (sum[4] == 1) begin
            corrected_sum = sum[3:0] + 4'b0011;
            end else begin
                corrected_sum = sum[3:0] - 4'b0011; 
            end
            // Set carry if swap_flag is 1 (only if A < B in subtraction)
            if (swap_flag == 1) begin
                carry_out = 1;
            end else begin
                carry_out = 0;
            end
        end
    end
endmodule

module bcd_xs3_adder_subtractor(
    input [3:0] A,
    input [3:0] B,
    input M,  // 0 for ADD, 1 for SUB
    output [3:0] Result,
    output CarryOut
);
    wire [3:0] xs3_A, xs3_B;
    wire [4:0] sum_raw;
    wire swap_flag;

    // Convert both inputs to XS3
    BCD_to_XS3 convertA (.bcd(A), .xs3(xs3_A));
    BCD_to_XS3 convertB (.bcd(B), .xs3(xs3_B));

    // Check for swap in subtraction mode
    assign swap_flag = (M == 1 && A < B);
    wire [3:0] A_sub = swap_flag ? xs3_B : xs3_A;
    wire [3:0] B_sub = swap_flag ? xs3_A : xs3_B;

    // 2's complement for subtraction, else normal addition
    ripple_adder adder_unit (
        .A(A_sub),
        .B(M ? ~B_sub : B_sub),
        .Cin(M),
        .Sum(sum_raw)
    );

    // Correction logic
    correction_logic correct_unit (
        .sum(sum_raw),
        .mode(M),
        .swap_flag(swap_flag),   // Pass swap_flag to the correction logic
        .corrected_sum(Result),
        .carry_out(CarryOut)
    );
endmodule