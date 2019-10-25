`include "pa_fetch.v"
`include "pa_decode.v"
`include "pa_execute.v"
`include "pa_writeback.v"

module inter_reg_32b(output reg [31:0] val_out,
                     input [31:0] val_in,
                     input        clk);

   always @ (posedge clk) begin
      // $display("(:instr-out %d :instr-in %d)", val_out, val_in);
      val_out = val_in;
   end
endmodule // inter_reg_32b

module inter_reg_5b(output reg [4:0] val_out,
                     input [4:0] val_in,
                     input        clk);


   always @ (posedge clk) begin
      // $display("(:instr-out %d :instr-in %d)", val_out, val_in);
      val_out = val_in;
   end
endmodule // inter_reg_5b

module clk_toggle(output reg [31:0] clk_out, 
                  input [31:0]      clk_in);
   
   initial clk_out = 0;

   always @ (clk_in) begin
      clk_out = ~clk_out;
      #0.5 clk_out = ~clk_out;
   end
endmodule // clk_toggle

module pipeline;
   wire [31:0] instr;
   wire [31:0] instr_out;
   wire [31:0] counter;
   wire [4:0]  write_dest;
   wire [31:0] read_reg_1;
   wire [31:0] read_reg_2;
   wire [4:0]  rd_out;
   wire [31:0] ra_out;
   wire [31:0] rb_out;
   wire [31:0] aluresult;
   wire [31:0] res_out;
   wire [4:0]  rdd_out;
//   wire [4:0]  rdm_out;
   reg [1:0]   opcode;
   reg         clk1;
   reg         clk2;
   reg         clk3;
   reg         clk4;
   reg         clk5;
   reg         clk6;
   reg         clk7;
//   reg         clk8;

  // instantiation of modules
  // Instruction Fetch
   fetch m0(instr, counter, clk1);

  // Instruction Fetch - Instruction Decode registers
   inter_reg_32b r0(instr_out, instr, clk5);

  // Instruction Decode
   decode m1(write_dest, read_reg_1, read_reg_2, instr_out, clk2);

  // Instruction Decode - Instruction Execute registers
   inter_reg_5b  rd(rd_out, write_dest, clk6);
   inter_reg_32b rs(ra_out, read_reg_1, clk6);
   inter_reg_32b rt(rb_out, read_reg_2, clk6);

  // Instruction Execute
   execute m2(aluresult, ra_out, rb_out, opcode, clk3);

  // Instruction Execute - Writeback registers
   inter_reg_32b ro(res_out, aluresult, clk7);
   inter_reg_5b rdd(rdd_out, rd_out, clk7);

  // MemAccess
  // MemAccess - Writeback registers
//     inter_reg_5b rdm(rdm_out, rdd_out, clk8);

  // Writeback
   writeback m3(rdd_out, res_out, clk4);

   initial begin
      clk1 = 0;
      clk2 = 0;
      clk3 = 0;
      clk4 = 0;
      clk5 = 0;
      clk6 = 0;
      clk7 = 0;
//      clk8 = 0;

      #20 $finish;
   end

   always #1 begin
//      clk8 = ~clk8;
      clk7 = ~clk7;
      clk6 = ~clk6;
      clk5 = ~clk5;

      clk1 = ~clk1;
      clk2 = ~clk2;
      clk3 = ~clk3;
      clk4 = ~clk4;
   end

   always #2 $strobe("\n");

endmodule // pipeline

