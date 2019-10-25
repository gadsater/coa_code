
module demux(output [7:0] bin_out,
             input        dem_in,
             input  [2:0] select,
             input        enable);
  
  reg [7:0] bin_out;
        
  always @ (enable or dem_in or select)
  begin
    bin_out = 8'h00;
    
    if (enable) begin
      case (select)
        3'b000 : bin_out[0] = dem_in; 
        3'b001 : bin_out[1] = dem_in; 
        3'b010 : bin_out[2] = dem_in; 
        3'b011 : bin_out[3] = dem_in; 
        3'b100 : bin_out[4] = dem_in;
        3'b101 : bin_out[5] = dem_in; 
        3'b110 : bin_out[6] = dem_in; 
        3'b111 : bin_out[7] = dem_in;  
     endcase
    end
  end

endmodule