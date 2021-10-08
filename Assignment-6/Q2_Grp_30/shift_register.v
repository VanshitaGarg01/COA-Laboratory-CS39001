/*
   Assignment No. - 6
   Problem No. - 2
   Semester - 5 (Autumn 2021-22)
   Group No. - 30
   Group Members - Vanshita Garg (19CS10064) & Ashutosh Kumar Singh (19CS30008)
*/

`timescale 1ns / 1ps

// Module for a 8-bit shift register with synchronous reset and parallel load
module shift_register #(parameter N = 8) (clk, rst, load, parallel_in, out);
    /*
      Input and output ports :
      clk - the clock signal
      rst - the reset signal
      load - the signal indicating if there is a parallel load
      parallel_in - the value of the parallel load
      out - the leftmost bit shifted out
    */
    input clk, rst, load;
    input [N-1:0] parallel_in;
    output reg out;
    
    reg [N-1:0] val;

    always @(posedge clk) begin
        if (load) begin             // parallel load
            val <= parallel_in;
            out <= 1'b0;
        end
        else if (rst) begin         // reset
            val <= 8'b0;
            out <= 1'b0;
        end
        else begin
            val <= {1'b0, val[N-1:1]};
            out <= val[0];
        end
    end
endmodule
