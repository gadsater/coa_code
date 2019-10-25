`include "ff_impl.v"

module test_ff;
    wire [7:0] q;
    reg  [7:0] d;
    reg        clk, res;

    ff_8bimpl ff(q, d, clk, res);

    initial begin
        if (! $value$plusargs("D=%d", d)) begin
            d = 0;
        end
        clk = 0;
        #1 clk = 1;
        #1 $display("D =%b | Q =%b", d, q);
    end


endmodule
