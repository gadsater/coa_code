`include "demux.v"

module tb_circ;
    reg        inp, en;
    reg  [2:0] sel;
    wire [7:0] op;

    demux e0(op, inp, sel, en);

    initial begin
        en = 1; inp = 1'b1; sel = 0;
        $monitor ("%b = %b", sel, op);

        #7 $finish;
    end

    always #1 sel = sel + 1;
    //always #1 inp = inp << 1;

endmodule