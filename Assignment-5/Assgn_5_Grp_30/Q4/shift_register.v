`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:12:52 09/28/2021 
// Design Name: 
// Module Name:    shift_register 
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

/*
   Assignment No. - 5
   Problem No. - 4
   Semester - 5 (Autumn 2021-22)
   Group No. - 30
   Group Members - Vanshita Garg (19CS10064) & Ashutosh Kumar Singh (19CS30008)
*/

// Module for a 32-bit shift register with asynchronous reset and asynchronous parallel load
module shift_register #(parameter N = 32) (clk, rst, load, parallel_in, out);
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

    always @(posedge clk or posedge rst or posedge load) begin
        if (rst)
            val <= 32'b0;
        else if (load)
            val <= parallel_in;
        else
            val <= {val[N-2:0], 1'b0};
        out <= val[N-1];
    end
endmodule
