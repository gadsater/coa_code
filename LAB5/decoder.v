
module decoder(output [7:0] bin_out,
               input  [2:0] dec_in,
               input        enable);

  reg    [7:0] bin_out;

  always @ (enable or dec_in)
  begin
    bin_out = 8'h01;
    if (enable) begin
      case (dec_in)
        3'b001 : bin_out = 8'h02;
        3'b010 : bin_out = 8'h04;
        3'b011 : bin_out = 8'h08;
        3'b100 : bin_out = 8'h10;
        3'b101 : bin_out = 8'h20;
        3'b110 : bin_out = 8'h40;
        3'b111 : bin_out = 8'h80;
     endcase
    end
  end

endmodule
