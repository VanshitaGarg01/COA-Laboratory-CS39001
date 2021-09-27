`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:30:28 09/28/2021 
// Design Name: 
// Module Name:    seq_comp 
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

// Top level module for the sequential unsigned comparator
module seq_comp #(parameter N = 32) (clk, rst, op, load_A, load_B, parallel_in_A, parallel_in_B, L, E, G);
    /*
      Input and output ports :
      clk - the clock signal
      rst - the reset signal
      op - an input signal that becomes 1 after all 32 bits have been read
      load_A - set to 1 if we need to supply a parallel load to A
      load_B - set to 1 if we need to supply a parallel load to B
      parallel_in_A - parallel load to A
      parallel_in_B - parallel load to B
      L - output bit that is 1 when A < B
      E - output bit that is 1 when A = B
      G - output bit that is 1 when A > B
    */
    input clk, rst, op, load_A, load_B;
    input [N-1:0] parallel_in_A, parallel_in_B;
    output wire L, E, G;
    
    wire out_a, out_b;
    
    // Instantiate the 2 shift registers
    shift_register S_REG_A (.clk(clk), .rst(rst), .load(load_A), .parallel_in(parallel_in_A), .out(out_a));
    shift_register S_REG_B (.clk(clk), .rst(rst), .load(load_B), .parallel_in(parallel_in_B), .out(out_b));
    
    // Instantiate the comparator FSM module
    comparator_fsm COMP (.clk(clk), .op(op), .rst(rst), .a(out_a), .b(out_b), .L(L), .E(E), .G(G));
endmodule
