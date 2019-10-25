 `include "gates/and_gate.v"
 `include "gates/nand_gate.v"
 `include "gates/nor_gate.v"
 `include "gates/not_gate.v"
 `include "gates/or_gate.v"
 `include "gates/xnor_gate.v"
 `include "gates/xor_gate.v"
 
 
 
 
 module tb_circ;
    reg  a, b, c, d;
    wire p, q, r, s, t;
    
    xor_i2  g0( p,  a,  b);
    and_i2  g1( q, ~a,  b);
    or_i2   g2( r,  p, ~q);
    nand_i2 g3( s,  c,  d);
    or_i2   g4( t,  s, ~d);
    and_i2  g5( u,  r,  t);
    
    initial begin
        $monitor("%b %b %b %b = %b", a, b, c, d, t);
        
        a = 0; b = 0; c = 0; d = 0;
        #15 $finish;
    end
    
    always #8 a = ~a; 
    always #4 b = ~b; 
    always #2 c = ~c; 
    always #1 d = ~d;
endmodule
        
        
    
    

