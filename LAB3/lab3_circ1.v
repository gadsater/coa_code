 `include "gates/and_gate.v"
 `include "gates/nand_gate.v"
 `include "gates/nor_gate.v"
 `include "gates/not_gate.v"
 `include "gates/or_gate.v"
 `include "gates/xnor_gate.v"
 `include "gates/xor_gate.v"
 
 module tb_circ;
    reg  [3:0] i;
    wire p;
    
    nand_i2 g0( p,  i[1],  i[0]);

    
    initial begin
        $monitor("%b %b %b %b = %b", i[3], i[2], i[1], i[0], p);
        
        i = {4{1'b0}};
        #15 $finish;
    end
    
    always #1 i = i + 1;
endmodule
        
        
    
    

