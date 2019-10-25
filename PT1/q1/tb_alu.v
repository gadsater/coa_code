`include "enc_impl.v"
`include "alu_impl.v"

module tb_alu;
    wire y;
    wire [2:0] op;
    reg  [7:0] ip;

    enc_impl enc(op, ip, 1'b1);
    alu_impl alu(y, op[2], op[1], op[0]);
    
    initial begin
        ip = 1;
        $monitor("a=%b b=%b x=%b | y=%b", op[2], op[1], op[0], y);

        #7 $finish;
    end

    always #1 ip = ip << 1;
endmodule