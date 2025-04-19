module fulladder(
 input a,b,cin,
 output s,cout
 );
 wire w1,w2,w3;
 xor(s1,a,b,cin);
 and(w1,a,b);
 and(w2,b,cin);
 or(cout,w1,w2,w3);
 endmodule
 
 module ripple(a,b,cin,s,cout);
 input [7:0]a;
 input[7:0]b;
 input cin;
 output[7:0]s;
 output cout;
 wire [6:0]c;
 fulladder(a[0],b[0],cin,s[0],c[0]);
 fulladder(a[1],b[1],c[0],s[1],c[1]);
 fulladder(a[2],b[2],c[1],s[2],c[2]);
 fulladder(a[3],b[3],c[2],s[3],c[3]);
 fulladder(a[4],b[4],c[3],s[4],c[4]);
 fulladder(a[5],b[5],c[4],s[5],c[5]);
 fulladder(a[6],b[6],c[5],s[6],c[6]);
 fulladder(a[7],b[7],c[6],s[7],cout);
 endmodule