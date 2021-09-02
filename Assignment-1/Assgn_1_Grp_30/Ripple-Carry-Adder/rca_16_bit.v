`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:32:36 08/25/2021 
// Design Name: 
// Module Name:    rca_16_bit 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
//
//////////////////////////////////////////////////////////////////////////////////

/*
   Assignment No. - 1
   Problem No. - 1
   Semester - 5 (Autumn 2021-22)
   Group No. - 30
   Group Members - Ashutosh Kumar Singh (19CS30008) & Vanshita Garg (19CS10064)
*/

// 16-bit ripple carry adder module
module rca_16_bit(a, b, c_in, sum, c_out);
    /*
      Input and output ports :
      a - first 16-bit input
      b - second 16-bit input
      c_in - the carry-in bit
      sum - the 16-bit output to store the sum
      c_out - the output bit to store the carry-out
    */ 
    input [15:0] a, b;
    input c_in;
    output [15:0] sum;
    output c_out;
    wire c_out1;

    // Cascade 2 8-bit ripple carry adders to create a 16-bit ripple carry adder
    rca_8_bit rca1(.a(a[7:0]), .b(b[7:0]), .c_in(c_in), .sum(sum[7:0]), .c_out(c_out1));
    rca_8_bit rca2(.a(a[15:8]), .b(b[15:8]), .c_in(c_out1), .sum(sum[15:8]), .c_out(c_out));
endmodule
