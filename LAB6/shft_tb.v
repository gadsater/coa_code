`include "shft_reg.v"

module shft_8bsp_tb;
    parameter tst = 8;
    wire q;
    reg  d;
    reg  clk, res;

    shft_8bsp sp(q, d, clk, res);

    initial begin
        
        
        clk = 0;
        #1 clk = 1;
        #1 $display("D =%d | Q =%d", d, q);
    end


endmodule
