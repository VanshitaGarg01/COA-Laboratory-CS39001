`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:27:26 08/25/2021 
// Design Name: 
// Module Name:    cla_4_bit_augmented
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
   Problem No. - 2
   Semester - 5 (Autumn 2021-22)
   Group No. - 30
   Group Members - Ashutosh Kumar Singh (19CS30008) & Vanshita Garg (19CS10064)
*/

// 4-bit carry look-ahead adder module which computes block propagate and generate for the next level of hierarchy
module cla_4_bit_augmented(a, b, c_in, sum, c_out, P, G);
    /*
      Input and output ports :
      a - first 4-bit input
      b - second 4-bit input
      c_in - the carry-in bit
      sum - the 4-bit output to store the sum
      c_out - the output bit to store the carry-out
      P - block propagate for the next level of hierarchy
      G - block generate for the next level of hierarchy
    */ 
    input [3:0] a, b;
    input c_in;
    output [3:0] sum;
    output c_out, P, G;
    wire [3:0] p, g;        // propagate and generate bits 
    wire [3:0] c;           // carry bits

    assign p = a ^ b;       // assign values to propagate bits
    assign g = a & b;       // assign values to generate bits

    // compute the carry bits
    assign c[0] = c_in;
    assign c[1] = g[0] | (p[0] & c_in);
    assign c[2] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & c_in);
    assign c[3] = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & c_in);

    // compute the sum
    assign sum = p ^ c;

    // compute block propagate and generate for the next level
    assign P = p[3] & p[2] & p[1] & p[0];
    assign G = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]);
    
    // assign c_out
    assign c_out = G + (P & c_in);
endmodule
