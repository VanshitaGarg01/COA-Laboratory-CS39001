`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:22:19 11/07/2021 
// Design Name: 
// Module Name:    adder_32_bit 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
// 32-bit ripple carry adder module
module adder_32_bit (
    input [31:0] a,
    input [31:0] b,
    input c_in,
    output [31:0] sum,
    output c_out
);
    /*
      Input and output ports :
      a - first 32-bit input
      b - second 32-bit input
      c_in - the carry-in bit
      sum - the 32-bit output to store the sum
      c_out - the output bit to store the carry-out
    */ 

    wire c_out1, P1, P2, G1, G2;

    // Cascade 2 16-bit ripple carry adders to create a 32-bit ripple carry adder
    // rca_16_bit rca1(.a(a[15:0]), .b(b[15:0]), .c_in(c_in), .sum(sum[15:0]), .c_out(c_out1));
    // rca_16_bit rca2(.a(a[31:16]), .b(b[31:16]), .c_in(c_out1), .sum(sum[31:16]), .c_out(c_out));
    cla_16_bit CLA1 (.a(a[15:0]), .b(b[15:0]), .c_in(c_in), .sum(sum[15:0]), .c_out(c_out1), .P(P1), .G(G1));
    cla_16_bit CLA2 (.a(a[31:16]), .b(b[31:16]), .c_in(c_out1), .sum(sum[31:16]), .c_out(c_out), .P(P2), .G(G2));
endmodule
