
module encoder(bin_out ,enc_in ,enable);
  output [2:0] bin_out;
  input  [7:0] enc_in;
  input        enable; 
 
  reg    [2:0] bin_out;
        
  always @ (enable or enc_in)
  begin
    bin_out = 0;
    if (enable) begin
      case (enc_in) 
        8'h02 : bin_out = 1; 
        8'h04 : bin_out = 2; 
        8'h08 : bin_out = 3; 
        8'h10 : bin_out = 4;
        8'h20 : bin_out = 5; 
        8'h40 : bin_out = 6; 
        8'h80 : bin_out = 7;  
     endcase
    end
  end

endmodule