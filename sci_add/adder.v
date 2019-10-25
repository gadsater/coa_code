// `include "full_adder.v"

module adder(result, operand_1, operand_2, clk);
    output reg [31:0] result;
    input      [31:0] operand_1;
    input      [31:0] operand_2;
    input             clk;

    wire       [31:0] out_res;
    wire              out_c;

    full_add_32b f0(out_res, out_c, operand_1, operand_2, 1'b0);

    always @ (posedge clk) begin
        result = out_res;
        // $strobe("(:pc-inc (:pc-in %d :pc-out %d))", operand_1, result);
    end
    // assign out_res = operand_1 + operand_2;
    
endmodule