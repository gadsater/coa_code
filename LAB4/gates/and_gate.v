module and_i3(y, x0, x1, x2);
	output y;
	input x0, x1, x2;
		
	assign y = x0 & x1 & x2;
endmodule

module and_i2(y, x0, x1);
	output y;
	input x0, x1;
		
	assign y = x0 & x1;
endmodule

module and_i2_3b(y, a, b);
	output wire [3:0] y;
	input  [2:0] a, b;
      
	and_i2 g0(y[0], a[0], b[0]);
	and_i2 g1(y[1], a[1], b[1]);
	and_i2 g2(y[2], a[2], b[2]);
	assign y[3] = 1'b0;
endmodule // and_i2_3b
	
