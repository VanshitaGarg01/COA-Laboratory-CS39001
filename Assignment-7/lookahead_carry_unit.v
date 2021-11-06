`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:28:41 08/25/2021 
// Design Name: 
// Module Name:    lookahead_carry_unit 
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

// Look-ahead carry unit module
module lookahead_carry_unit(p, g, c_in, c, c_out, P, G);
    /*
      Input and output ports :
      p - block propagate from the previous level
      g - block generate from the previous level
      c_in - the carry-in bit
      c - the carry bits
      c_out - the output bit to store the carry-out
      P - block propagate for the next level
      G - block generate for the next level
    */ 
    input [3:0] p, g;
    input c_in;
    output [3:0] c;
    output c_out, P, G;

    // compute the carry bits
    assign c[0] = c_in;
    assign c[1] = g[0] | (p[0] & c[0]);
    assign c[2] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & c[0]);
    assign c[3] = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & c[0]);
    assign c_out = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]) | (p[3] & p[2] & p[1] & p[0] & c[0]);

    // compute block propagate and generate for the next level
    assign P = p[3] & p[2] & p[1] & p[0];
    assign G = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]);
endmodule
