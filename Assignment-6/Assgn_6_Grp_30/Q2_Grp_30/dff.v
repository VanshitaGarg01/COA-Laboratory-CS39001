/*
   Assignment No. - 6
   Problem No. - 2
   Semester - 5 (Autumn 2021-22)
   Group No. - 30
   Group Members - Vanshita Garg (19CS10064) & Ashutosh Kumar Singh (19CS30008)
*/

`timescale 1ns / 1ps

// D Flip-Flop module with synchronous reset
module dff (clk, rst, d, q);
    /*
      Input and output ports :
      clk - the clock signal
      rst - the reset signal
      d - input value
      q - value stored by the flip-flop (output)
    */
    input clk, rst, d;
    output reg q;
    
    always @(posedge clk) begin
        if (rst)
            q <= 1'b0;
        else
            q <= d;
    end
endmodule
