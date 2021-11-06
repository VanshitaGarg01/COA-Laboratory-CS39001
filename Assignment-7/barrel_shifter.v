/*
   Assignment No. - 6
   Problem No. - 1
   Semester - 5 (Autumn 2021-22)
   Group No. - 30
   Group Members - Vanshita Garg (19CS10064) & Ashutosh Kumar Singh (19CS30008)
*/

`timescale 1ns / 1ps

// The Bidirectional Barrel Shifter module
module barrel_shifter (input [7:0] in, input [2:0] shamt, input dir, output [7:0] out, input aorl);
    /*
      Input and output ports :
      in - the initial 8-bit input to be shifted
      shamt - shift amount(no. of bits to be shifted)
      dir - direction of shifting(1 to shift left, 0 to shift right)
      out - the 8-bit shifted output
    */

    // Temporary outputs for mux_array module instances
    wire [7:0] out1, out2, out3, out4;

    // Temporary inputs for mux_array module instances
    wire [7:0] in1 = {in[0], in[1], in[2], in[3], in[4], in[5], in[6], in[7]};
    wire [7:0] in2 = {aorl & out1[7], aorl & out1[7], aorl & out1[7], aorl & out1[7], out1[7], out1[6], out1[5], out1[4]};
    wire [7:0] in3 = {aorl & out1[7], aorl & out1[7], out2[7], out2[6], out2[5], out2[4], out2[3], out2[2]};
    wire [7:0] in4 = {aorl & out1[7], out3[7], out3[6], out3[5], out3[4], out3[3], out3[2], out3[1]};
    wire [7:0] in5 = {out4[0], out4[1], out4[2], out4[3], out4[4], out4[5], out4[6], out4[7]};

    // Instantiate the required mux_array modules
    mux_array level_1 (.a0(in), .a1(in1), .sel(dir), .out(out1));
    mux_array level_2 (.a0(out1), .a1(in2), .sel(shamt[2]), .out(out2));
    mux_array level_3 (.a0(out2), .a1(in3), .sel(shamt[1]), .out(out3));
    mux_array level_4 (.a0(out2), .a1(in4), .sel(shamt[0]), .out(out4));
    mux_array level_5 (.a0(out4), .a1(in5), .sel(dir), .out(out));
    
endmodule