`include "flip_flop.v"

module mux2_1(mux_out, mux_in_1, mux_in_2, sel, clk);
    output reg mux_out;
    input mux_in_1;
    input mux_in_2;
    input sel;
    input clk;

    always @ (posedge clk) begin
        case (sel)
            1'b0: mux_out = mux_in_1;
            1'b1: mux_out = mux_in_2;
            default: mux_out = mux_in_1;
        endcase 
    end
endmodule


module counter(Q, updown, clk);
    output wire [3:0] Q;
    wire [3:0]   Q1;
    wire [3:0]   Qc1;
    wire [3:0]   Q2;
    wire [3:0]   Qc2;
    input        updown;
    input        clk;

    // reg          clk1;
    // reg          t_updown;
    // wire [2:0]   t_clk;
    // reg          rst;
    // reg          en;
    // wire [2:0]   jk_clk;
    
    // jk_flip_flop jk0(Q[0], Qc[0], 1'b1, 1'b1, t_clk, rst);
    // jk_flip_flop jk1(Q[1], Qc[1], 1'b1, 1'b1, Qc[0], rst);
    // jk_flip_flop jk2(Q[2], Qc[2], 1'b1, 1'b1, Qc[1], rst);
    // jk_flip_flop jk3(Q[3], Qc[3], 1'b1, 1'b1, Qc[2], rst);
    // mux2_1 m0(jk_clk[0], Q[0], ~Q[0], t_updown, t_clk);
    // mux2_1 m1(jk_clk[1], Q[1], ~Q[1], t_updown, t_clk);
    // mux2_1 m2(jk_clk[2], Q[2], ~Q[2], t_updown, t_clk);

    t_flip_flop t0(Q1[0], Qc1[0], 1'b1, clk);
    t_flip_flop t1(Q1[1], Qc1[1], 1'b1, Qc1[0]);
    t_flip_flop t2(Q1[2], Qc1[2], 1'b1, Qc1[1]);
    t_flip_flop t3(Q1[3], Qc1[3], 1'b1, Qc1[2]);

    t_flip_flop t4(Q2[0], Qc2[0], 1'b1, clk);
    t_flip_flop t5(Q2[1], Qc2[1], 1'b1, Q2[0]);
    t_flip_flop t6(Q2[2], Qc2[2], 1'b1, Q2[1]);
    t_flip_flop t7(Q2[3], Qc2[3], 1'b1, Q2[2]);
    
    mux2_1 m0(Q[0], Q1[0], Q2[0], updown, clk);
    mux2_1 m1(Q[1], Q1[1], Q2[1], updown, clk);
    mux2_1 m2(Q[2], Q1[2], Q2[2], updown, clk);
    mux2_1 m3(Q[3], Q1[3], Q2[3], updown, clk);
 
    // initial begin
    //     rst = 1;
    //     t_clk = 0;
    //     t_updown = 1;
    //     $monitor("(:jk_clk %b :Q %b :Qc %b)", jk_clk, Q, Qc);

    //     #63 $finish;
    // end
    
    // always #1 t_clk = ~t_clk;
endmodule

module counter_tb;
    wire [3:0] Q;
    wire [3:0] Qc;
    reg        updown;
    reg        clk;

    assign Qc = ~Q;
    counter c0(Q, updown, clk);

    initial begin
        clk = 0;
        updown = 1;

        $monitor("(:Q %b :Qc %b)", Q, Qc);
        #34 $finish;
    end

    always #1 clk = ~clk;
endmodule