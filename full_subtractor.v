module fs(
 input a,
 input b,
 input bin,
 output d,
 output bout
 );
 wire w1,w2,w3,w4;
 xor(d,a,b,bin);
 not(w1,a);and(w2,w1,b);
 and(w3,w1,bin);
 and(w4,b,bin);
 or(bout,w2,w3,w4);
 endmodule