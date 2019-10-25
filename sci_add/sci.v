`include "full_adder.v"
`include "pc.v"
`include "adder.v"
`include "instr_mem.v"
`include "regfile.v"
`include "alu.v"

module sci_add;
    wire [31:0] pc_out;
    wire [31:0] pc_in;
    wire [31:0] instr;
    wire [31:0] rd_1;
    wire [31:0] rd_2;
    wire [31:0] alu_res;

    wire [31:0] alu_dum;
    reg         clk1;
    reg         clk2;
    reg         clk3;
    reg         clk4;
    reg         clk5;
    // reg         clk6;
    reg         reg_write;

    pc        m0(pc_out, pc_in,  clk1);
    adder     m1(pc_in,  pc_out, 4, clk2);
    instr_mem m2(instr,   pc_out, clk3);
    regfile   m3(rd_1, rd_2, instr[25:21], instr[20:16], instr[15:11], alu_res, 1'b1, clk4);
    alu       m4(alu_res, rd_1, rd_2, 2'b00, clk5);
    // regfile   m6(rd_1, rd_2, instr[25:21], instr[20:16], instr[15:11], alu_res, 1'b1, clk6);

    initial begin
       clk1 = 0;
       clk2 = 0;
       clk3 = 0;
       clk4 = 0;
       clk5 = 0;
    //    clk6 = 0;
       reg_write = 0;

       #120 $finish; 
    end

    always #1 begin
        #1 clk1 = ~clk1;
        #1 clk2 = ~clk2;
        #1 clk3 = ~clk3;
        #1 clk4 = ~clk4;
        #1 clk5 = ~clk5;      
        // clk6 = ~clk6;
        #1 reg_write = ~reg_write;
    end


    always @ (negedge clk5) begin
        $strobe("(:pc (:addr %d))", pc_out);
        $strobe("(:instr-mem (:addr %d :instr %d))", pc_out, instr);
        $strobe("(:regfile (:rr1 %d :rr2 %d :rd1 %d :rd2 %d))", instr[25:21], instr[20:16], rd_1, rd_2);
        $strobe("(:alu (:opr1 %d :opr2 %d :res %d))", rd_1, rd_2, alu_res);
        $strobe("(:regfile (:wr %d :wd %d))", instr[15:11], alu_res);
        $strobe("\n");
    end
endmodule

