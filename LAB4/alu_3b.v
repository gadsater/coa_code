`include "full_adder.v"
   
module alu_3b (y, x0, x1, s);
   output wire [3:0] y; 
   input       [2:0] x0, x1, s;	       
   wire        [3:0] y0, y1, y2, y3, y4, y5, y6, y7;
   reg         [3:0] k;

   assign y = k;

   fl_add_3b  g0(y0, x0, x1);
   fl_sub_3b  g1(y1, x0, x1);
   and_i2_3b  g2(y2, x0, x1);
   or_i2_3b   g3(y3, x0, x1);
   xor_i2_3b  g4(y4, x0, x1);
   nand_i2_3b g5(y5, x0, x1);
   nor_i2_3b  g6(y6, x0, x1);
   xnor_i2_3b g7(y7, x0, x1);

   always @(*) begin
      case (s)
	      0 : k = y0;  
	      1 : k = y1;
	      2 : k = y2;
	      3 : k = y3;
	      4 : k = y4;
	      5 : k = y5;
	      6 : k = y6;
	      7 : k = y7;
      endcase // case (s)
   end
endmodule // alu_3b

