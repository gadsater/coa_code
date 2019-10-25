module tb_xor_gate;
	reg a1, a2;
	wire b, b1, b2, b3;
	nand g(b1, a1, a2);
	nand g(b2, b1, a1);
	nand g(b3, b1, a2);
	nand g(b, b2, b3);
	initial begin
		$monitor("%b %b = %b", a1, a2, b);
		a1 = 0; a2 = 0;
		#5 a1 = 0; a2 = 1;
		#5 a1 = 1; a2 = 0;
		#5 a1 = 1; a2 = 1;
	end
endmodule
		
		