 module mealy (
 input in,
 input clk,
 input rst,
 output reg out
 );
 parameter a = 2'b00, b = 2'b01, c = 2'b10, d = 2'b11;
 reg [1:0] state, next_state;
 always @(posedge clk or posedge rst) begin
 if (rst)
 state <= a;
 else
 state <= next_state;
 end
 always @(*) begin
 case (state)
 a: begin
 if (in) begin
 next_state = b;
out = 0;
 end else begin
 next_state = a;
 out = 0;
 end
 end
 b: begin
 if (in) begin
 next_state = b;
 out = 0;
 end else begin
 next_state = c;
 out = 0;
 end
 end
 c: begin
 if (in) begin
 next_state = b;
 out = 0;
 end else begin
 next_state = d;
 out = 0;
 end
 end
 d: begin
 if (in) begin
 next_state = b;
 out = 1;
 end else begin
 next_state = a;
 out = 0;
 end
 end
 endcase
 end
 endmodule
 module mealy_tb();
 reg clk, in, rst;
 wire out;
 mealy uut (in,clk,rst,out);
 initial begin
 clk = 0;
 forever #5 clk = ~clk;
 end
 initial begin
 rst = 1; in = 0; #10;
 rst = 0; in = 1; #10;
 in = 1; #10;
 in = 0; #10;
 in = 0; #10;
 in = 1; #10;
 in = 0; #10;
 in = 0; #10;
 in = 1; #10;
 $stop;
end
endmodule