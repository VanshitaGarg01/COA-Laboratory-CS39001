`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:47:36 09/28/2021 
// Design Name: 
// Module Name:    two_complement 
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
   Problem No. - 2
   Semester - 5 (Autumn 2021-22)
   Group No. - 30
   Group Members - Vanshita Garg (19CS10064) & Ashutosh Kumar Singh (19CS30008)
*/

// Module for two's complement FSM using a Mealy machine
module two_complement (x, rst, clk, out);
    /*
      Input and output ports :
      x - the current input bit
      clk - the clock signal
      rst - the reset signal
      out - the output bit corresponding to the bit x
    */
    input x, rst, clk;
    output reg out;
    
    reg PS, NS;
    parameter S0 = 1'b0, S1 = 1'b1;
    
    // set present state
    always @ (posedge clk or posedge rst) begin
        if (rst)
            PS <= 1'b0;
        else 
            PS <= NS;
    end
    
    // next state logic
    always @ (*) begin
        case (PS)
            S0: NS = (x) ? S1 : S0;
            S1: NS = S1;
        endcase
    end
    
    // output logic
    always @ (*) begin
        case (PS)
            S0: out = (x) ? 1'b1 : 1'b0;
            S1: out = (x) ? 1'b0 : 1'b1;
        endcase
    end
endmodule
