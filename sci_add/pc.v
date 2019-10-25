module pc(pc_out, pc_in, clk);
    output reg [31:0] pc_out;
    input [31:0]      pc_in;
    input             clk;

    initial begin
       pc_out = 32'h00000000; 
    end
    
    always @ (posedge clk) begin
        if (pc_in) pc_out = pc_in;
        // $strobe("(:pc (:addr %d))", pc_out);
    end
endmodule