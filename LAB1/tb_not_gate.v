module tb_not_gate;
	reg a1;
	wire b;
	nand g(b, a1, a1);
	initial begin
		$monitor("%b = %b", a1, b);
		a1 = 0;
		#5 a1 = 1;
	end
endmodule
		
		