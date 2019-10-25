`include "alu_3b.v"

module tb_alu;
    reg [2:0] a, b, c;
    wire [3:0] d;
    //reg ta, tb, tc;
    alu_3b g0(d, a, b, c);

    initial begin
        //ta = 0; tb = 0; tc = 0;
        //a = 0; b = 0; c = 0;
        if (! $value$plusargs("a=%d", a)) begin
            a = 0;
        end
        if (! $value$plusargs("b=%d", b)) begin
            b = 0;
        end
        if (! $value$plusargs("c=%d", c)) begin
            c = 0;
        end

        $monitor("%b %b %b = %b", a, b, c, d);
        //#2047 $finish;
    end

endmodule
