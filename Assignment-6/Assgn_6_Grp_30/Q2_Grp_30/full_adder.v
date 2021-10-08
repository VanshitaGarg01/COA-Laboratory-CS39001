/*
   Assignment No. - 6
   Problem No. - 2
   Semester - 5 (Autumn 2021-22)
   Group No. - 30
   Group Members - Ashutosh Kumar Singh (19CS30008) & Vanshita Garg (19CS10064)
*/

`timescale 1ns / 1ps

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
