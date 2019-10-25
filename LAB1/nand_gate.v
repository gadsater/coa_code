module nand_gate(y, x0, x1, x2);
	output y;
	input x0, x1, x2;
		
	assign y = ~(x0 & x1 & x2);
endmodule
	