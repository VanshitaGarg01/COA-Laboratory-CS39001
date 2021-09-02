`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:26:33 08/25/2021 
// Design Name: 
// Module Name:    half_adder 
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

// Half Adder module
module half_adder(a, b, sum, c_out);
    /*
      Input and output ports :
      a - first input bit
      b - second input bit
      sum - the output bit to store the sum
      c_out - the output bit to store the carry
    */   
    input a, b;
    output sum, c_out;

    assign sum = a ^ b;
    assign c_out = a & b;
endmodule
