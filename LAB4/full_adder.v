// full adder implementation - 1 bit
 `include "gates/and_gate.v"
 `include "gates/nand_gate.v"
 `include "gates/nor_gate.v"
 `include "gates/not_gate.v"
 `include "gates/or_gate.v"
 `include "gates/xnor_gate.v"
 `include "gates/xor_gate.v"


module fl_add_1b(s, c, x, y, z);
    output s, c;
    input  x, y, z;
    wire   p, q, r;
    
    xor_i2 g0(p, x, y);
    and_i2 g1(q, x, y);
    xor_i2 g2(s, p, z);
    and_i2 g3(r, p, z);
    or_i2  g4(c, q, r);
endmodule

module fl_add_3b(y, a, b);
    output wire [3:0] y;
    input       [2:0] a, b;
    wire 	          y0, y1;

    fl_add_1b f0(y[0],   y0, a[0], b[0], 1'b0);
	fl_add_1b f1(y[1],   y1, a[1], b[1],   y0);
	fl_add_1b f2(y[2], y[3], a[2], b[2],   y1);

endmodule // fl_add_3b

module fl_sub_3b(y, a, b);
    output wire [3:0] y;
    input       [2:0] a, b;
    wire 	          y0, y1;
      
    fl_add_1b f0(y[0],   y0, a[0], ~b[0], 1'b1);
    fl_add_1b f1(y[1],   y1, a[1], ~b[1],   y0);
    fl_add_1b f2(y[2], y[3], a[2], ~b[2],   y1);

endmodule // fl_sub_3b
    
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
