// full adder implementation - 1 bit

 `include "gates/and_gate.v"
 `include "gates/nand_gate.v"
 `include "gates/nor_gate.v"
 `include "gates/not_gate.v"
 `include "gates/or_gate.v"
 `include "gates/xnor_gate.v"
 `include "gates/xor_gate.v"

module fl_add_1b(c, s, x, y, z);
    output c, s;
    input  x, y, z;
    wire   p, q, r;
    
    xor_i2 g0(p, x, y);
    and_i2 g1(q, x, y);
    xor_i2 g2(s, p, z);
    and_i2 g3(r, p, z);
    or_i2  g4(c, q, r);
endmodule
    
/*
module tb_circ;
    parameter len = 3;
    
    reg  [len:0] i;
    wire c, s;
    
    fl_add_1b g0(c, s, i[2], i[1], i[0]);
    
    initial begin
        $display("x y z = c s");
        $monitor("%b %b %b = %b %b", i[2], i[1], i[0], c, s);
        
        i = 0;
        #(2 * len - 1) $finish;
    end
    
    always #1 i = i + 1;
endmodule
*/
