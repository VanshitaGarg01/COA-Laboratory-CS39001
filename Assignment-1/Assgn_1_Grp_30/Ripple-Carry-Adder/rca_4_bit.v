`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:27:28 08/26/2021 
// Design Name: 
// Module Name:    rca_4_bit 
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

// 4-bit ripple carry adder module
module rca_4_bit(a, b, c_in, sum, c_out);
    /*
      Input and output ports :
      a - first 4-bit input
      b - second 4-bit input
      c_in - the carry-in bit
      sum - the 4-bit output to store the sum
      c_out - the output bit to store the carry-out
    */   
    input [3:0] a, b;
    input c_in;
    output [3:0] sum;
    output c_out;
    wire [2:0] w;

    // Cascade 4 full adders to create a 4-bit ripple carry adder
    full_adder fa1(.a(a[0]), .b(b[0]), .c_in(c_in), .sum(sum[0]), .c_out(w[0]));
    full_adder fa2(.a(a[1]), .b(b[1]), .c_in(w[0]), .sum(sum[1]), .c_out(w[1]));
    full_adder fa3(.a(a[2]), .b(b[2]), .c_in(w[1]), .sum(sum[2]), .c_out(w[2]));
    full_adder fa4(.a(a[3]), .b(b[3]), .c_in(w[2]), .sum(sum[3]), .c_out(c_out));
endmodule
