module ff_impl(output reg Q, 
               input      D, clk, res);
    
    always @(posedge clk) begin
        if (~res) begin
            Q <= 1'b0;
        end else begin
            Q <= D;
        end
    end
endmodule 

module ff_8bimpl(output [7:0] Q,
                 input  [7:0] D,
                 input        clk, res);

    wire clk;

    ff_impl ff0(Q[0], D[0], clk, res);
    ff_impl ff1(Q[1], D[1], clk, res);
    ff_impl ff2(Q[2], D[2], clk, res);
    ff_impl ff3(Q[3], D[3], clk, res);
    ff_impl ff4(Q[4], D[4], clk, res);
    ff_impl ff5(Q[5], D[5], clk, res);
    ff_impl ff6(Q[6], D[6], clk, res);
    ff_impl ff7(Q[7], D[7], clk, res);
endmodule
