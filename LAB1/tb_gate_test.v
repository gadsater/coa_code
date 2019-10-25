module tb_gate;
	reg a1, a2, a3;
	wire b1, b2, b3, b4, b5, b6, b7, b8;
	and_gate g0(b1, a1, a2, a3);
	or_gate g1(b2, a1, a2, a3);
	xor_gate g2(b3, a1, a2, a3);
	nand_gate g3(b4, a1, a2, a3);
	nor_gate g4(b5, a1, a2, a3);
	xnor_gate g5(b6, a1, a2, a3);
	not_gate g6(b7, a1);
	buf_gate g7(b8, a1);
	initial
		begin
		if($test$plusargs("and_gate"))
			$monitor("%b %b %b = %b", a1, a2, a3, b1);
		else if($test$plusargs("or_gate"))
			$monitor("%b %b %b = %b", a1, a2, a3, b2);
		else if($test$plusargs("xor_gate"))
			$monitor("%b %b %b = %b", a1, a2, a3, b3);
		else if($test$plusargs("nand_gate"))
			$monitor("%b %b %b = %b", a1, a2, a3, b4);
		else if($test$plusargs("nor_gate"))
			$monitor("%b %b %b = %b", a1, a2, a3, b5);
		else if($test$plusargs("xnor_gate"))
			$monitor("%b %b %b = %b", a1, a2, a3, b6);
		else if($test$plusargs("not_gate"))
			$monitor("%b = %b", a1, b7);
		else if($test$plusargs("buf_gate"))
			$monitor("%b = %b", a1, b8);
			
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
		
		