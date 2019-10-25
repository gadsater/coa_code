module full_add_1b(out_s, out_c, in_a, in_b, in_c);
    output out_s;
    output out_c;
    input  in_a;
    input  in_b;
    input  in_c;

    wire   temp_1;
    wire   temp_2;
    wire   temp_3;

    xor m0(temp_1, in_a,   in_b);
    and m1(temp_2, in_a,   in_b);
    xor m2(out_s,  temp_1, in_c);
    and m3(temp_3, temp_1, in_c);
    or  m4(out_c,  temp_2, temp_3);
endmodule

module full_add_2b(out_s, out_c, in_a, in_b, in_c);
    output [1:0] out_s;
    output       out_c;
    input  [1:0] in_a;
    input  [1:0] in_b;
    input        in_c;
    wire         carry;

    full_add_1b m6(out_s[0], carry, in_a[0], in_b[0], in_c);
    full_add_1b m5(out_s[1], out_c, in_a[1], in_b[1], carry);
endmodule

module full_add_4b(out_s, out_c, in_a, in_b, in_c);
    output [3:0] out_s;
    output       out_c;
    input  [3:0] in_a;
    input  [3:0] in_b;
    input        in_c;
    wire         carry;

    full_add_2b m8(out_s[1:0], carry, in_a[1:0], in_b[1:0], in_c);
    full_add_2b m7(out_s[3:2], out_c, in_a[3:2], in_b[3:2], carry);
endmodule

module full_add_8b(out_s, out_c, in_a, in_b, in_c);
    output [7:0] out_s;
    output       out_c;
    input  [7:0] in_a;
    input  [7:0] in_b;
    input        in_c;
    wire         carry;

    full_add_4b m10(out_s[3:0], carry, in_a[3:0], in_b[3:0], in_c);
    full_add_4b  m9(out_s[7:4], out_c, in_a[7:4], in_b[7:4], carry);
endmodule

module full_add_16b(out_s, out_c, in_a, in_b, in_c);
    output [15:0] out_s;
    output        out_c;
    input  [15:0] in_a;
    input  [15:0] in_b;
    input         in_c;
    wire         carry;

    full_add_8b m12(out_s[7:0],  carry,  in_a[7:0],  in_b[7:0],  in_c);
    full_add_8b m11(out_s[15:8], out_c, in_a[15:8], in_b[15:8], carry);
endmodule

module full_add_32b(out_s, out_c, in_a, in_b, in_c);
    output [31:0] out_s;
    output        out_c;
    input  [31:0] in_a;
    input  [31:0] in_b;
    input         in_c;
    wire         carry;

    full_add_16b m14(out_s[15:0],  carry,  in_a[15:0],  in_b[15:0],  in_c);
    full_add_16b m13(out_s[31:16], out_c, in_a[31:16], in_b[31:16], carry);
endmodule

// module tb_full_add_1b;
//     wire  out_s;
//     wire  out_c;
//     reg   in_a;
//     reg   in_b;
//     reg   in_c;

//     full_add_1b f0(out_s, out_c, in_a, in_b, in_c);

//     initial begin
//        in_a  = 0;
//        in_b  = 0;
//        in_c  = 0;

//        $monitor("(:a %b :b %b :cin %b :cout %b :s %b)", in_a, in_b, in_c, out_c, out_s);

//        #7 $finish;
//     end

//     always #4 in_a = ~in_a;
//     always #2 in_b = ~in_b;
//     always #1 in_c = ~in_c;

// endmodule

// module tb_full_add_32b;
//     wire  [31:0] out_s;
//     wire         out_c;
//     reg   [31:0] in_a;
//     reg   [31:0] in_b;
//     reg          in_c;

//     full_add_32b f0(out_s, out_c, in_a, in_b, in_c);

//     initial begin
//        in_a  = 0;
//        in_b  = 0;
//        in_c  = 0;

//        $monitor("(:a %d :b %d :c %d :s %d)", in_a, in_b, out_c, out_s);

//        #128 $finish;
//     end

//     always #32 in_a += 1;
//     always #1 in_b += 1;

// endmodule