imodule und_and(b, a1, a2);
   output b;
   input  a1, a2;
   wire   w1;

   nand(w1, a1, a2);
   nand(b, w1, w1);
endmodule // und_and

module und_or(b, a1, a2);
   output b;
   input  a1, a2;
   wire   w1, w2;

   nand(w1, a1, a1);
   nand(w2, a2, a2);
   nand(b, w1, w2);
endmodule // und_or

module und_not(b, a);
   output b;
   input  a;

   nand(b, a, a);
endmodule // und_not

module und_xor(b, a1, a2);
   output b;
   input  a1, a2;
   wire   w1, w2, w3;

   nand(w1, a1, a2);
   nand(w2, a1, w1);
   nand(w3, a2, w1);
   nand(b, w2, w3);
endmodule // und_xor

module unr_and(b, a1, a2);
   output b;
   input  a1, a2;
   wire   w1, w2;

   nor(w1, a1, a1);
   nor(w2, a2, a2);
   nor(b, w1, w2);
endmodule // unr_and

module unr_or(b, a1, a2);
   output b;
   input  a1, a2;
   wire   w1;

   nor(w1, a1, a2);
   nor(b, w1, w1);
endmodule // unr_or

module unr_not(b, a);
   output b;
   input  a;

   nor(b, a, a);
endmodule // unr_not

module unr_xor(b, a1, a2);
   output b;
   input  a1, a2;
   wire   w1, w2, w3, w4;

   nor(w1, a1, a2);
   nor(w2, a1, w1);
   nor(w3, a2, w1);
   nor(w4, w2, w3);
   nor(b, w4, w4);
endmodule // unr_xor

module tb_gate;
   wire b;
   reg  a1, a2;

   unr_and g(b, a1, a2);

   initial begin
      $monitor("%b %b = %b", a1, a2, b);

      a1 = 0; a2 = 0;
      #5 a1 = 0; a2 = 1;
      #5 a1 = 1; a2 = 0;
      #5 a1 = 1; a2 = 1;
   end
endmodule // tb_gate
