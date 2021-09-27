`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:13:48 09/27/2021 
// Design Name: 
// Module Name:    lfsr 
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
   Problem No. - 1
   Semester - 5 (Autumn 2021-22)
   Group No. - 30
   Group Members - Vanshita Garg (19CS10064) & Ashutosh Kumar Singh (19CS30008)
*/

// The Linear Feedback Shift Register (LFSR) module
module lfsr (seed, sel, clk, rst, w);
    /*
      Input and output ports :
      seed - the initial 4 bits loaded into the LFSR
      sel - the select line for the multiplexers
      clk - the clock signal
      rst - the reset signal
      w - the 4 output bits from the LFSR
    */
    input [3:0] seed;
    input sel, clk, rst;
    output wire [3:0] w;
    wire [3:0] wint;
    wire xor_output;
    
    // Instantiate the required mux modules
    mux M0 (.a0(seed[3]), .a1(xor_output), .sel(sel), .out(wint[0]));
    mux M1 (.a0(seed[2]), .a1(w[0]), .sel(sel), .out(wint[1]));
    mux M2 (.a0(seed[1]), .a1(w[1]), .sel(sel), .out(wint[2]));
    mux M3 (.a0(seed[0]), .a1(w[2]), .sel(sel), .out(wint[3]));
    
    // Instantiate the required dff modules
    dff d3 (.d(wint[0]), .q(w[0]), .rst(rst), .clk(clk));
    dff d2 (.d(wint[1]), .q(w[1]), .rst(rst), .clk(clk));
    dff d1 (.d(wint[2]), .q(w[2]), .rst(rst), .clk(clk));
    dff d0 (.d(wint[3]), .q(w[3]), .rst(rst), .clk(clk));
    
    // Instantiate the required xor gate
    xor x1 (xor_output, w[3], w[2]);
endmodule

