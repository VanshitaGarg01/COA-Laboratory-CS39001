`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:40:19 08/26/2021 
// Design Name: 
// Module Name:    cla_16_bit_ripple 
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

// 16-bit carry look-ahead adder module with rippling carry
module cla_16_bit_ripple(a, b, c_in, sum, c_out);
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

    wire [2:0] c;

    // Instantiate 4 cascaded 4-bit carry look-ahead adders
    cla_4_bit cla1(.a(a[3:0]), .b(b[3:0]), .c_in(c_in), .sum(sum[3:0]), .c_out(c[0]));
    cla_4_bit cla2(.a(a[7:4]), .b(b[7:4]), .c_in(c[0]), .sum(sum[7:4]), .c_out(c[1]));
    cla_4_bit cla3(.a(a[11:8]), .b(b[11:8]), .c_in(c[1]), .sum(sum[11:8]), .c_out(c[2]));
    cla_4_bit cla4(.a(a[15:12]), .b(b[15:12]), .c_in(c[2]), .sum(sum[15:12]), .c_out(c_out));
endmodule
