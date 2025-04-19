 module CLAD #(parameter N=8)(
 input [N-1:0] A,
 input [N-1:0] B,
 output [N-1:0] sum,
 output cout
 );
 wire [N:0] C; // Carry wires
 wire [N-1:0] G; // Generate bits
 wire [N-1:0] P; // Propagate bits
 assign C[0] = 1'b0; // Initial carry-in is 0
 genvar j;
 generate
 for (j = 0; j < N; j = j + 1) begin: CLA_BLOCK
 assign G[j] = A[j] & B[j]; // Generate: G = A.B
 assign P[j] = A[j] ^ B[j]; // Propagate: P = A ? B
 assign sum[j] = P[j] ^ C[j]; // Sum: S = P ? C
 assign C[j+1] = G[j] | (P[j] & C[j]); // Carry Propagation
 end
 endgenerate
 assign cout = C[N]; // Final Carry-Out
 endmodule