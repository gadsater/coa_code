// `include "full_adder.v"

module alu(alu_res, alu_in_a, alu_in_b, opcode, clk);
    output reg [31:0] alu_res;
    input [31:0]      alu_in_a;
    input [31:0]      alu_in_b;
    input [1:0]       opcode;
    input             clk;

    wire              out_c;
    wire [31:0]       add_res;
    wire [31:0]       sub_res;

    full_add_32b f0(add_res, out_c, alu_in_a, alu_in_b, 1'b0);
    full_add_32b f1(sub_res, out_c, alu_in_a, alu_in_b, 1'b1);

    always @ (posedge clk) begin
        case (opcode)
            2'b00: alu_res = add_res;
            2'b01: alu_res = sub_res;
            default: alu_res = 32'h0000_0000;
        endcase
        // $strobe("(:alu (:opr1 %d :opr2 %d :res %d))", alu_in_a, alu_in_b, alu_res);
    end

endmodule