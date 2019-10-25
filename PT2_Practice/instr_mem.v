module instr_mem(out_data, in_addr, clk);
   output reg [31:0] out_data;
   input [31:0]      in_addr;
   input             clk;

   integer           instrfile;
   integer           scaninstr;
   reg [31:0]        instr [31:0];
   integer           count;

   initial begin
      count = 0;
      instrfile = $fopen("./instrfile", "r");

      if (instrfile == 0) begin
         $display("instruction file not found.");
         $finish;
      end else begin
         while ((! $feof(instrfile)) && (count < 32)) begin
            scaninstr = $fscanf(instrfile, "%d\n", instr[count]);
            count++;
         end
         $fclose(instrfile);
      end
   end

   always @(posedge clk) begin
      out_data = instr[in_addr];
   end
endmodule // instr_mem

/* -----\/----- EXCLUDED -----\/-----
module tb_instr_mem;
   wire [31:0] out_data;
   reg  [31:0] in_addr;
   reg  clk;

   instr_mem i0(out_data, in_addr, clk);

   initial begin
      clk = 0;
      in_addr = 0;

      $monitor("(:out %d :in %d)", out_data, in_addr);
      #32 $finish;
   end

   always #1 clk = ~clk;
   always #2 in_addr = in_addr + 1;
endmodule // tb_instr_mem
 -----/\----- EXCLUDED -----/\----- */

