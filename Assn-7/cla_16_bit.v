`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:19:06 11/07/2021 
// Design Name: 
// Module Name:    cla_16_bit 
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
// 16-bit carry look-ahead adder module using the look-ahead carry unit
module cla_16_bit(a, b, c_in, sum, c_out, P, G);
    /*
      Input and output ports :
      a - first 16-bit input
      b - second 16-bit input
      c_in - the carry-in bit
      sum - the 16-bit output to store the sum
      c_out - the output bit to store the carry-out
      P - block propagate for the next level of hierarchy
      G - block generate for the next level of hierarchy
    */
    parameter k = 1'b1;
    input [15:0] a, b;
    input c_in;
    output [15:0] sum;
    output c_out, P, G;

    wire [3:0] p, g, c;

    // Instantiate 4 4-bit carry look-ahead adders
    // We leave the c_out port empty as they are not required in this case
    cla_4_bit cla1(.a(a[3:0]), .b(b[3:0]), .c_in(c_in), .sum(sum[3:0]), .c_out(), .P(p[0]), .G(g[0]));
    cla_4_bit cla2(.a(a[7:4]), .b(b[7:4]), .c_in(c[1]), .sum(sum[7:4]), .c_out(), .P(p[1]), .G(g[1]));
    cla_4_bit cla3(.a(a[11:8]), .b(b[11:8]), .c_in(c[2]), .sum(sum[11:8]), .c_out(), .P(p[2]), .G(g[2]));
    cla_4_bit cla4(.a(a[15:12]), .b(b[15:12]), .c_in(c[3]), .sum(sum[15:12]), .c_out(), .P(p[3]), .G(g[3]));

    // Instantiate the look-ahead carry unit
    lookahead_carry_unit lcu(.p(p), .g(g), .c_in(c_in), .c(c), .c_out(c_out), .P(P), .G(G));
endmodule
