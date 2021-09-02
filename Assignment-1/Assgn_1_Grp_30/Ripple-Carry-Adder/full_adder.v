`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:27:51 08/25/2021 
// Design Name: 
// Module Name:    full_adder 
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

// Full Adder module
module full_adder(a, b, c_in, sum, c_out);
    /*
      Input and output ports :
      a - first input bit
      b - second input bit
      c_in - the carry-in bit
      sum - the output bit to store the sum
      c_out - the output bit to store the carry-out
    */   
    input a, b, c_in;
    output sum, c_out;

    assign sum = a ^ b ^ c_in;
    assign c_out = (a & b) | (b & c_in) | (c_in & a);
endmodule
