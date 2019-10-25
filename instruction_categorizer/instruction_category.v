module instr_cat(type, instr);
    output reg [1:0] type;
    input [31:0] instr;

    always @ (*) begin
        casex(instr[31:26])
            6'b000000: type = 2'b00;
            6'b00x1xx,  // A'B'D
            6'b001xxx,  // A'B'C
            6'b00xx01,  // A'B'E'F
            6'b10x00x,  // AB'D'E'
            6'b10x0x1,  // AB'D'F
            6'b1xx001,  // AD'E'F
            6'bx00100: type = 2'b01; // B'C'DE'F'
            6'b00001x: type = 2'b10;
        endcase
        // $display("(:instr %b :type: %d)", instr[31:26], type);
    end
endmodule

module tb_instr_cat;
    wire [1:0] type;
    reg [31:0] instr;

    reg[7*8:0] str_type;

    instr_cat i0(type, instr);

    initial begin
        $monitor("(:instr %d :type: %s)", instr, str_type);
        #0 instr = 32'b000000_00000000000000000000000000; // R-Type
        #1 instr = 32'b001000_00000000000000000000000000; // ADDI
        #2 instr = 32'b000010_00000000000000000000000000; // J
        #3 instr = 32'b001100_00000000000000000000000000; // ANDI
        #4 instr = 32'b100011_00000000000000000000000000; // LW
        #5 instr = 32'b000100_00000000000000000000000000; // BEQ
        #6 instr = 32'b001101_00000000000000000000000000; // ORI
        #7 instr = 32'b000011_00000000000000000000000000; // JAL
        #8 instr = 32'b101000_00000000000000000000000000; // SB
        #9 instr = 32'b101011_00000000000000000000000000; // SW
        
        #10 $finish;
    end
    
    always @ (type) str_type = (type == 2'b00) ? "R-Type" :
                               (type == 2'b01) ? "I-Type" :
                               (type == 2'b10) ? "J-Type" :
                               "Error";
endmodule