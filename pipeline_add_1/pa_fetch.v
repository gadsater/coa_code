module fetch(output reg [31:0] instr,
             output reg [31:0] counter,
             input             clk);
   reg [31:0] instr_mem [31:0];
   // integer    counter;

   initial begin
    // feeding initial values into the memory for decoding
      instr_mem[0] = 32'b000000_00010_01101_01001_00000_100000;
      instr_mem[1] = 32'b000000_00011_01001_01101_00000_100000;
      instr_mem[2] = 32'b000000_01010_01101_00001_00000_100000;
      instr_mem[3] = 32'b000000_01010_00001_11001_00000_100000;
      instr_mem[4] = 32'b000000_00000_01101_01011_00000_100000;
      instr_mem[5] = 32'b000000_01010_10101_01001_00000_100000;
      instr_mem[6] = 32'b000000_00010_10001_00001_00000_100000;
      instr_mem[7] = 32'b000000_10000_10000_10000_00000_100000;
      instr_mem[8] = 32'b000000_00011_11000_01100_00000_100000;
      instr_mem[9] = 32'b000000_11111_01100_01111_00000_100000;
    
    // initializing counter to 0
      counter = 0;
   end

   always @(posedge clk) begin
    // fetching the instruction from instruction memory
      instr = instr_mem[counter];
      
    // updating counter - similar to PC. Value incremented after
    // instruction is fetched from instruction memory
      if (counter < 9)
        counter = counter + 1;
      else
        counter = 0;
        
    // displaying the fetched instruction and its corresponding
    // index in the memory
    // $display("(:instr-fetch (:counter %d :instr %d))", counter == 0 ? 9 : counter - 1, instr);
   end
endmodule // fetch

// module tb_fetch;
//    wire [31:0] instr;
//    wire [31:0] counter;
//    reg         clk;
// 
//    fetch m0(instr, counter, clk);
// 
//    initial begin
//       clk = 0;
// 
//       #20 $finish;
//    end
// 
//    always #1 clk = ~clk;
// endmodule
