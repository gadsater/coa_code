// `include "pa_decode.v"

module execute(output reg [31:0] aluresult,
               input [31:0] reg_a,
               input [31:0] reg_b,
               input [1:0]  opcode,
               input        clk);

   always @ (posedge clk) begin
    // executing the received operands in ALU. Since we know its add 
    // instruction is to be executed, we set as the default case to 
    // be executed.
      case (opcode)
        2'b00: aluresult = reg_a + reg_b;
        2'b01: aluresult = reg_a - reg_b;
        2'b10: aluresult = reg_a * reg_b;
        2'b11: aluresult = reg_a / reg_b;
        default: aluresult = reg_a + reg_b;
      endcase // case (opcode)
    
    // prints the input operands and the result obtained from alu.
    // $strobe("(:instr-execute (:reg-a %d :reg-b: %d :aluresult %d))",
    //          reg_a, reg_b, aluresult);
   end
endmodule // execute

// module tb_execute;
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
// 
//    fetch m0(instr, counter, clk1);
//    decode m1(write_dest, read_reg_1, read_reg_2, instr, clk2);
//    execute m2(aluresult, read_reg_1, read_reg_2, opcode, clk3);
// 
//    initial begin
//       clk1 = 0;
//       clk2 = 0;
//       clk3 = 0;
//       opcode = 2'b00;
// 
//       #32 $finish;
//    end
// 
//    always #1 begin
//       clk1 = ~clk1;
//       clk2 = ~clk2;
//       clk3 = ~clk3;
//    end
// 
//    always #2 $strobe("\n");
// 
// endmodule // tb_execute
