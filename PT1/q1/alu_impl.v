module alu_impl(output y,
                input a, b, x);
    reg y;

    always @(a or b or x) begin
        case ({a, b, x})
            3'b000: y =   a + b ;
            3'b001: y =   a - b ;
            3'b010: y =   a & b ;
            3'b011: y =   a | b ;
            3'b100: y =   a ^ b ;
            3'b101: y = ~(a & b);
            3'b110: y = ~(a | b);
            3'b111: y = ~(a ^ b);
        endcase
    end
endmodule