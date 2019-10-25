module tb_gate;
	reg a1, a2, a3;
	wire b;
	
	initial
		if($test$plusargs("and_gate"))
			and_gate g(b, a1, a2, a3);
		else if($test$plusargs("or_gate"))
			or_gate g(b, a1, a2, a3);
		else if($test$plusargs("xor_gate"))
			xor_gate g(b, a1, a2, a3);
		else if($test$plusargs("nand_gate"))
			nand_gate g(b, a1, a2, a3);
		else if($test$plusargs("nor_gate"))
			nor_gate g(b, a1, a2, a3);
		else if($test$plusargs("xnor_gate"))
			xnor_gate g(b, a1, a2, a3);
		else if($test$plusargs("not_gate"))
			not_gate g(b, a1, a2, a3);
		else if($test$plusargs("buf_gate"))
			buf_gate g(b, a1, a2, a3);
		begin
			$monitor("%b %b %b = %b", a1, a2, a3, b);
		
			a1 = 0; a2 = 0; a3 = 0;
			#5 a1 = 0; a2 = 0; a3 = 1;
			#5 a1 = 0; a2 = 1; a3 = 0;
			#5 a1 = 0; a2 = 1; a3 = 1;
			#5 a1 = 1; a2 = 0; a3 = 0;
			#5 a1 = 1; a2 = 0; a3 = 1;
			#5 a1 = 1; a2 = 1; a3 = 0;
			#5 a1 = 1; a2 = 1; a3 = 1;		
	end
endmodule
		
		