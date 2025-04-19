 module moore(
 input in,clk,rst,
 output reg out
 );
 parameter a=3'b000,b=3'b001,c=3'b010,d=3'b011,e=3'b100;
 reg[2:0]state;
 reg[2:0]next_state;
 always @(posedge clk or negedge rst) begin
 if(!rst)
 state<=a;
 else
 state<=next_state;
 end
 always @(*) begin
 case(state)
 a:if(in) begin
 next_state=b;
 out=0;
 end
 else begin
 next_state=a;
 out=0;
 end
 b:if(in) begin
 next_state=b;
 out=0;
 end
 else begin
 next_state=c;
 out=0;
 end
 c:if(in) begin
 next_state=b;
 out=0;
 end
 else begin
 next_state=d;
 out=0;
 end
 d:if(in) begin
 next_state=e;
 out=0;
 end
 else begin
 next_state=a;
 out=0;
 end
 e:if(in) begin
 next_state=b;
 out=0;
 end
 else begin
 next_state=c;
 out=1;
 end
endcase
 end
 endmodule