module barrel_shifter (input [7:0] in, input [2:0] shamt, input dir, output [7:0] out);
    
    wire [7:0] out1, out2, out3, out4;

    wire [7:0] in1 = {in[0], in[1], in[2], in[3], in[4], in[5], in[6], in[7]};
    wire [7:0] in2 = {1'b0, 1'b0, 1'b0, 1'b0, out1[7], out1[6], out1[5], out1[4]};
    wire [7:0] in3 = {1'b0, 1'b0, out2[7], out2[6], out2[5], out2[4], out2[3], out2[2]};
    wire [7:0] in4 = {1'b0, out3[7], out3[6], out3[5], out3[4], out3[3], out3[2], out3[1]};
    wire [7:0] in5 = {out4[0], out4[1], out4[2], out4[3], out4[4], out4[5], out4[6], out4[7]};

    mux_array level_1 (.a0(in), .a1(in1), .sel(dir), .out(out1));
    mux_array level_2 (.a0(out1), .a1(in2), .sel(shamt[2]), .out(out2));
    mux_array level_3 (.a0(out2), .a1(in3), .sel(shamt[1]), .out(out3));
    mux_array level_4 (.a0(out2), .a1(in4), .sel(shamt[0]), .out(out4));
    mux_array level_5 (.a0(out4), .a1(in5), .sel(dir), .out(out));
    
endmodule