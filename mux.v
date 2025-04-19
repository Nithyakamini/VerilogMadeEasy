 module mux(
 input s0,
 input s1,
 input i0,
 input i1,
 input i2,
 input i3,
 output op
 );
 wire w1,w2,w3,w4,w5,w6;
 not n1(w1,s0);
 not n2(w2,s1);
 and a1(w3,i0,w1,w2);and a2(w4,i1,w2,s0);
 and a3(w5,i2,s1,w1);
 and a4(w6,i3,s0,s1);
 or or1(op,w3,w4,w5,w6);
 endmodule