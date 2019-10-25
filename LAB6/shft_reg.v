module ff_impl(output reg Q, 
               input      D, clk, res);
    
    always @(posedge clk) begin
        if (res) begin
            Q <= 1'b0;
        end else begin
            Q <= D;
        end
    end
endmodule 

module shft_8bss(output Q,
                 input  D,
                 input  clk, res);
    
    wire [6:0] A;
    wire       clk;

    ff_impl ff0(A[0], D   , clk, res);
    ff_impl ff1(A[1], A[0], clk, res);
    ff_impl ff2(A[2], A[1], clk, res);
    ff_impl ff3(A[3], A[2], clk, res);
    ff_impl ff4(A[4], A[3], clk, res);
    ff_impl ff5(A[5], A[4], clk, res);
    ff_impl ff6(A[6], A[5], clk, res);
    ff_impl ff7(Q   , A[6], clk, res);
endmodule

module shft_8bsp(output [7:0] Q,
                 input        D,
                 input        clk, res);
    
    wire       clk;

    ff_impl ff0(Q[0], D   , clk, res);
    ff_impl ff1(Q[1], Q[0], clk, res);
    ff_impl ff2(Q[2], Q[1], clk, res);
    ff_impl ff3(Q[3], Q[2], clk, res);
    ff_impl ff4(Q[4], Q[3], clk, res);
    ff_impl ff5(Q[5], Q[4], clk, res);
    ff_impl ff6(Q[6], Q[5], clk, res);
    ff_impl ff7(Q[7], Q[6], clk, res);
endmodule

module shft_8bps(output       Q,
                 input  [7:0] D,
                 input        clk, res);
    
    wire       clk;

    ff_impl ff0(D[1], D[0], clk, res);
    ff_impl ff1(D[2], D[1], clk, res);
    ff_impl ff2(D[3], D[2], clk, res);
    ff_impl ff3(D[4], D[3], clk, res);
    ff_impl ff4(D[5], D[4], clk, res);
    ff_impl ff5(D[6], D[5], clk, res);
    ff_impl ff6(D[7], D[6], clk, res);
    ff_impl ff7(Q   , D[7], clk, res);
endmodule

module shft_8bpp(output [7:0] Q,
                 input  [7:0] D,
                 input        clk, res);
    
    wire       clk;
    assign Q = D;
    
    ff_impl ff0(D[1], D[0], clk, res);
    ff_impl ff1(D[2], D[1], clk, res);
    ff_impl ff2(D[3], D[2], clk, res);
    ff_impl ff3(D[4], D[3], clk, res);
    ff_impl ff4(D[5], D[4], clk, res);
    ff_impl ff5(D[6], D[5], clk, res);
    ff_impl ff6(D[7], D[6], clk, res);
    ff_impl ff7(Q[7], D[7], clk, res);
endmodule

