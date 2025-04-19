 module deco(
 input i1,
 input i2,
 output o1,
 output o2,
 output o3,
 output o4
 );
 wire x1,x2;
 not (x1,i1);
 not (x2,i2);
 and (o1,x1,x2);and (o2,x2,i1);
 and (o3,x1,i2);
 and (o4,i1,i2);
 endmodule