// `include "pa_fetch.v"

module decode (output reg [4:0]  write_dest,
               output reg [31:0] read_reg_1,
               output reg [31:0] read_reg_2,
               input [31:0]      instr,
               input             clk);

   reg [31:0]                    regfile [31:0];

   initial begin
    // inserting values into the register file
      regfile[00] = 00000000000000000000000000000000;
      regfile[01] = 11100010010000110111000010001100;
      regfile[02] = 00100000111000111000101110010001;
      regfile[03] = 01110110100111100101011001110101;
      regfile[04] = 01000011110101111110000000100000;
      regfile[05] = 11111010001000000011000001111011;
      regfile[06] = 10100011001111000100101100011011;
      regfile[07] = 10100110110001011011011010110011;
      regfile[08] = 00000011110000010000011011110000;
      regfile[09] = 01111011101111101001010100001001;
      regfile[10] = 00111010010110011110111111100010;
      regfile[11] = 10001110111011100010100110110011;
      regfile[12] = 00100110111000110101100001100011;
      regfile[13] = 00001000101111110111011101100101;
      regfile[14] = 00110010000100000110101011111010;
      regfile[15] = 11101000111010011010010110111010;
      regfile[16] = 10001101010001000100110001110010;
      regfile[17] = 10010000110011110010001100011010;
      regfile[18] = 10110101000000100111001101000001;
      regfile[19] = 00010101001010001110110110111111;
      regfile[20] = 10110100101010010000011100111101;
      regfile[21] = 10011100010100111001100010010100;
      regfile[22] = 01101010100101000000110001111010;
      regfile[23] = 10101110010101111111000101110011;
      regfile[24] = 01000001001100110110101000000000;
      regfile[25] = 10010011000011101100100111001100;
      regfile[26] = 10110111100011100010110100101000;
      regfile[27] = 11010001110001110001011110000011;
      regfile[28] = 01101011011011100010100100101111;
      regfile[29] = 00010101101111101100111011011111;
      regfile[30] = 01001000101011101111101100100010;
      regfile[31] = 11001100110101110101010001100010;
   end // initial begin

   always @ (posedge clk) begin
   // display decoded instruction. We only deal with add instruction,
   // so there is no check done to opcode to know how to split the
   // instruction depending on its type.
   // $display("(:instr-decode (:instr %d :opcode %d :rs %d :rt %d :rd %d :funct %d))", instr,
   //     instr[31:26], instr[25:21], instr[20:16],
   //     instr[15:11], instr[5:0]);
        
    // passing values read from register file and write address of
    // result to next stage of pipeline.
    if (instr) begin
        read_reg_1 = regfile[instr[25:21]];
        read_reg_2 = regfile[instr[20:16]];
        write_dest = instr[15:11];
    end
   end
endmodule // decode

// module tb_decode;
//    wire [4:0]  write_dest;
//    wire [31:0] read_reg_1;
//    wire [31:0] read_reg_2;
//    wire [31:0] counter;
//    wire [31:0] instr;
//    reg         clk1;
//    reg         clk2;
// 
//    fetch m0(instr, counter, clk1);
//    decode m1(write_dest, read_reg_1, read_reg_2, instr, clk2);
// 
//    initial begin
//       clk1 = 0;
//       clk2 = 0;
//       #32 $finish;
//    end
// 
//    always #1 begin
//       clk1 = ~clk1;
//       clk2 = ~clk2;
//    end
// 
//    always #2 $strobe("(:write-dest %d :read-reg-1 %d :read-reg-2 %d)\n",
//               write_dest, read_reg_1, read_reg_2);
// endmodule // tb_decode
