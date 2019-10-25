module lab2_circ1;
    reg  a, b, c, d;
    wire p, q, r, s;
    
    and_i3 g0( p,  b, ~c, ~d);
    and_i3 g1( q, ~b, ~c,  d);
    and_i3 g2( r, ~a,  b,  c);
    or_i3  g3( s,  p,  q,  r);
    
    initial begin
        $monitor("%b %b %b %b = %b", a, b, c, d, s);
        
        a = 0; b = 0; c = 0; d = 0;
        #5 a = 0; b = 0; c = 0; d = 1;
        #5 a = 0; b = 0; c = 1; d = 0;
        #5 a = 0; b = 0; c = 1; d = 1;
        #5 a = 0; b = 1; c = 0; d = 0;
        #5 a = 0; b = 1; c = 0; d = 1;
        #5 a = 0; b = 1; c = 1; d = 0;
        #5 a = 0; b = 1; c = 1; d = 1;
        #5 a = 1; b = 0; c = 0; d = 0;
        #5 a = 1; b = 0; c = 0; d = 1;
        #5 a = 1; b = 0; c = 1; d = 0;
        #5 a = 1; b = 0; c = 1; d = 1;
        #5 a = 1; b = 1; c = 0; d = 0;
        #5 a = 1; b = 1; c = 0; d = 1;
        #5 a = 1; b = 1; c = 1; d = 0;
        #5 a = 1; b = 1; c = 1; d = 1;
        
    end
endmodule
        
        
    
    
