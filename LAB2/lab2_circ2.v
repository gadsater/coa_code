 module lab2_circ2;
    reg  a, b, c, d;
    wire p, q, r, s;
    
    xor_i2 g0( p,  b,  d);
    and_i2 g1( q, ~c,  p);
    and_i3 g2( r, ~a,  b,  c);
    or_i2  g3( s,  q,  r);
    
    initial begin
        $monitor("%b %b %b %b = %b", a, b, c, d, s);
        
        a = 0; b = 0; c = 0; d = 0;
        #16 $finish;
    end
    
    always #8 a = ~a; 
    always #4 b = ~b; 
    always #2 c = ~c; 
    always #1 d = ~d;
endmodule
        
        
    
    

