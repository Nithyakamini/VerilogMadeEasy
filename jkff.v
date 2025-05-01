module jkflip(
input j,
input k,
input clock,
output reg q,
output qbar
);
// Continuous assignment for qbar
assign qbar = ~q;
always @(posedge clock) begin
if (j == 0 && k == 0) begin
// No change
q <= q;
end else if (j == 1 && k == 0) begin
// Set
q <= 1'b1;
end else if (j == 0 && k == 1) begin
// Reset
q <= 1'b0;
end else if (j == 1 && k == 1) begin
// Toggle
q <= ~q;
end
end
endmodule