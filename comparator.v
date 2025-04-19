module comp(
 input a0,
 input a1,
 input a2,
 input a3,
 input b0,
 input b1,
 input b2,
 input b3,
 output g,
 output e,output l
 );
 wire x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,x16,x17,x18,x19,x20;
 xnor (x1,a3,b3);
 xnor (x2,a2,b2);
 xnor (x3,a1,b1);
 xnor (x4,a0,b0);
 and (e,x1,x2,x3,x4);
 not (x5,a3);
 not (x6,a2);
 not (x7,a1);
 not (x8,a0);
 and (x13,x5,b3);
 and (x14,x6,b2,x1);
 and (x15,x7,b1,x1,x2);
 and (x16,x8,b0,x1,x2,x3);
 or (l,x13,x14,x15,x16);
 not(x9,b3);
 not(x10,b2);
 not(x11,b1);
 not(x12,b0);
 and(x17,x9,a3);
 and(x18,x10,a2,x1);
 and(x19,x11,a1,x2,x1);
 and(x20,x12,a0,x1,x2,x3);
 or(g,x17,x18,x19,x20);
 endmodule