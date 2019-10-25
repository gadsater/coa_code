module program_counter(out_addr, in_addr);
    input      [31:0] in_addr;
    output reg [31:0] out_addr;

    assign out_addr = in_addr;
endmodule

module instruction_memory(in_addr, out_data);
    input      [31:0] in_addr;
    output reg [31:0] out_data;

    initial begin
        instr = $fopen("./command.txt", "r")
        $fscanf(instr, "%d", out_data)
    end
endmodule

module register_file(in_data, out_val_a, out_val_b);
    input      [31:0] in_data;
    output reg [31:0] out_val_a;
    output reg [31:0] out_val_b;

    if (in_data[31:26] == 6'b000000) begin
    end
endmodule
