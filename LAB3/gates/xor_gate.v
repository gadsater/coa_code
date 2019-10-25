module xor_i3(y, x0, x1, x2);
	output y;
	input x0, x1, x2;
		
	assign y = x0 ^ x1 ^ x2;
endmodule

module xor_i2(y, x0, x1);
	output y;
	input x0, x1;
		
	assign y = x0 ^ x1;
endmodule
	
