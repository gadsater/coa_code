// half adder implementation - 1 bit

 `include "gates/and_gate.v"
 `include "gates/nand_gate.v"
 `include "gates/nor_gate.v"
 `include "gates/not_gate.v"
 `include "gates/or_gate.v"
 `include "gates/xnor_gate.v"
 `include "gates/xor_gate.v"

module hf_add_1b(c, s, x, y);
    output s, c;
    input  x, y;
    
    xor_i2 g0(s, x, y);
    and_i2 g1(c, x, y);
endmodule

module tb_circ;
    parameter len = 2;
    
    reg  [len:0] i;
    wire c, s;
    
    hf_add_1b g0(c, s, i[1], i[0]);
    
    
    initial begin
        $display("a b = c s");  
        $monitor("%b %b = %b %b", i[1], i[0], c, s);
        
        i = 0;
        #(2*len-1) $finish;
    end
    
    always #1 i = i + 1;
endmodule

