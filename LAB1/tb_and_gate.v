module tb_and_gate;
	reg a1, a2, a3;
	wire b, b1;
	nand g(b1, a1, a2);
	nand g(b, b1, b1);
	initial begin
		$monitor("%b %b = %b", a1, a2, b);
		a1 = 0; a2 = 0;
		#5 a1 = 0; a2 = 1;
		#5 a1 = 1; a2 = 0;
		#5 a1 = 1; a2 = 1;	
	end
endmodule
		
		