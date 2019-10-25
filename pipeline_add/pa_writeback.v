// `include "pa_execute.v"

module writeback(input [4:0] write_addr,
                 input [31:0] write_data,
                 input clk);
   reg [31:0]          regfile [31:0];

   // In future, I will include a code block to read regfile contents
   // from a file. For now, regfile is used just to mimic storing
   // of values.
   
   always @ (posedge clk) begin
    // store value in regfile.
      regfile[write_addr] = write_data;
      
    // display write address and write data.
      $strobe("(instr-writeback (:write-addr %d :write-data %d))",
              write_addr, write_data);
   end
endmodule // writeback

// module tb_writeback;
//    wire [31:0] instr;
//    wire [31:0] counter;
//    wire [4:0]  write_dest;
//    wire [31:0] read_reg_1;
//    wire [31:0] read_reg_2;
//    wire [31:0] aluresult;
//    reg [1:0]   opcode;
//    reg         clk1;
//    reg         clk2;
//    reg         clk3;
//    reg         clk4;
// 
//    fetch m0(instr, counter, clk1);
//    decode m1(write_dest, read_reg_1, read_reg_2, instr, clk2);
//    execute m2(aluresult, read_reg_1, read_reg_2, opcode, clk3);
//    writeback m3(write_dest, aluresult, clk4);
// 
//    initial begin
//       clk1 = 0;
//       clk2 = 0;
//       clk3 = 0;
//       clk4 = 0;
//       opcode = 2'b00;
// 
//       #32 $finish;
//    end
// 
//    always #1 begin
//       clk1 = ~clk1;
//       clk2 = ~clk2;
//       clk3 = ~clk3;
//       clk4 = ~clk4;
//    end
// 
//    always #2 $strobe("\n");
// endmodule // tb_writeback
