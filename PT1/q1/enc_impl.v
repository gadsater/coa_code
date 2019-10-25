module enc_impl(output [2:0] op,
                input  [7:0] ip,
                input        en);

    reg [2:0] op;

    always @(ip or en) begin
        if (en) begin
            case (ip)
                8'h01: op = 3'b000;
                8'h02: op = 3'b001;
                8'h04: op = 3'b010;
                8'h08: op = 3'b011;
                8'h10: op = 3'b100;
                8'h20: op = 3'b101;
                8'h40: op = 3'b110;
                8'h80: op = 3'b111;
            endcase
        end
    end
endmodule