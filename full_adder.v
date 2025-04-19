module fa(
 input a,
 input b,
 input c_in,
 output s,
 output c_out
 );
 wire x1,x2,x3,x4;
 xor(x1,a,b);
 xor(s,x1,c_in);
 and(x2,a,b);
 and(x3,x1,c_in);
 or(c_out,x2,x3);
 endmodule