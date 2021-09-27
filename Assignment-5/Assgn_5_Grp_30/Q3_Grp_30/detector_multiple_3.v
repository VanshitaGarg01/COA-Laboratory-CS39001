`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:01:23 09/28/2021 
// Design Name: 
// Module Name:    detector_multiple_3 
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
   Problem No. - 3
   Semester - 5 (Autumn 2021-22)
   Group No. - 30
   Group Members - Vanshita Garg (19CS10064) & Ashutosh Kumar Singh (19CS30008)
*/

// Module for multiple-of-3 detector FSM using a Mealy machine
// We have 3 states - S0 (0 mod 3), S1 (1 mod 3), S2 (2 mod 3)
module detector_multiple_3 (x, rst, clk, out);
    /*
      Input and output ports :
      x - the current input bit
      rst - the reset signal
      clk - the clock signal
      out - the output bit corresponding to the bit x
    */
    input x, rst, clk;
    output reg out;
    
    reg [1:0] PS, NS;
    parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10;
    
    // Set the next state
    always @(posedge clk or posedge rst) begin
        if (rst)
            PS <= 2'b00;
        else 
            PS <= NS;
    end
    
    // Next state logic
    always @(*) begin
        case (PS)
            S0: NS = (x) ? S1 : S0;
            S1: NS = (x) ? S0 : S2;
            S2: NS = (x) ? S2 : S1;
        endcase
    end
    
    // Output logic
    always @(*) begin
        case (PS)
            S0: out = (x) ? 1'b0 : 1'b1;
            S1: out = (x) ? 1'b1 : 1'b0;
            S2: out = 1'b0;
        endcase
    end
endmodule
