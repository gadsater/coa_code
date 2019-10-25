module pc(out_addr, in_addr, clk);
   input clk;
   input [31:0]  in_addr;
   output reg [31:0] out_addr;
   always @(posedge clk)
     assign out_addr = in_addr;
endmodule // pc

/* -----\/----- EXCLUDED -----\/-----
module tb_pc;
   reg [31:0] in_addr;
   reg clk;
   wire [31:0] out_addr;

   pc p0(out_addr, in_addr, clk);

   initial begin
      clk = 0;
      in_addr = 0;

      $monitor("(:out %d :in %d)", out_addr, in_addr);
      #32 $finish;
   end

   always #1 clk = ~clk;
   always #2 in_addr = in_addr + 1;

endmodule // tb_pc
 -----/\----- EXCLUDED -----/\----- */
