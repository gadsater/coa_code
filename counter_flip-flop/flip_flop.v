module t_flip_flop(Q, Qc, T, clk);
    output reg Q;
    output     Qc;
    input      T, clk;

    assign Qc = ~Q;

    initial Q = 0;

    always @ (posedge clk) begin
        if (T == 1) Q = ~Q;
        else if(T == 0)  Q =  Q;
    end
endmodule

module jk_flip_flop(Q, Qc, J, K, clk, rst);
    output reg Q;
    output Qc;
    input J, K, clk, rst;

    assign Qc = ~Q;

    initial begin
        Q  = 1'b0;
    end
        
    always @ (posedge clk) begin
        case ({J, K})
            2'b00: begin Q =    Q; end
            2'b01: begin Q = 1'b0; end
            2'b10: begin Q = 1'b1; end
            2'b11: begin Q =   ~Q; end
        endcase

    end

    always @ (negedge rst) begin
        Q = 1'b0;
    end
endmodule

// module tb_jk_flip_flop;
//     wire Q, Q1;
//     reg J, K, clk, rst, en;
//     reg [1:0] L;
    
//     jk_flip_flop jk(Q, Q1, J, K, clk, rst);
    
//     initial begin
//         clk = 0;
//         rst = 1;
//         en  = 1;
//         J   = 0;
//         K   = 0;
        
//         // $monitor ("(:J %d :K %d :Q %1d :Q1: %1d)", J, K, Q, Q1);
//         #8 $finish;
//     end
        
//     always #1 clk = ~clk;
//     always #2 K   =   ~K;
//     always #4 J   =   ~J;
    
//     always @ (posedge clk) begin
//         $strobe ("(:J %d :K %d :Q %1d :Q1: %1d)", J, K, Q, Q1);
//     end
// endmodule

