`include "and_gate.v"

module tb_alu;
    reg [2:0] a, b;
    wire [3:0] d;

    and_i2_3b g0(d, a, b);

    initial begin
        a = 0; b = 0; //c = 0;
        $monitor("%d %d = %d", a, b, d);
        #255 $finish;
    end

    always #1   a = a + 1;
    always #8   b = b + 1;
    //always #256 c = c + 1;
endmodule
