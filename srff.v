module srff(
input S,
input R,
input clk,
input reset,
output reg Q,
output reg Q_bar
);
always @(posedge clk or posedge reset)
begin
if (reset) begin
Q<=1'b0;Q_bar<=1'b1;
end else begin
if(S&&~R) begin
Q<=1'b1;Q_bar<=1'b0;
end else if (~S&&R) begin
Q<=1'b0;Q_bar<=1'b1;
end else if (S&&R) begin
Q<=1'bx;Q_bar<=1'bx;
end
end
end
endmodule