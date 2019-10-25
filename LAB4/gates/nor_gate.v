module nor_i3(y, x0, x1, x2);
	output y;
	input x0, x1, x2;
		
	assign y = ~(x0 | x1 | x2);
endmodule

module nor_i2(y, x0, x1);
	output y;
	input x0, x1;
		
	assign y = ~(x0 | x1);
endmodule
	
module nor_i2_3b(y, a, b);
	output [3:0] y;
	input  [2:0] a, b;
      
	nor_i2 g0(y[0], a[0], b[0]);
	nor_i2 g1(y[1], a[1], b[1]);
	nor_i2 g2(y[2], a[2], b[2]);
	assign y[3] = 1'b0;
endmodule // nor_i2_3b