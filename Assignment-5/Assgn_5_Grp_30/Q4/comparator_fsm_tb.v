`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   01:26:45 09/28/2021
// Module Name:   comparator_fsm_tb
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: comparator_fsm
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

/*
   Assignment No. - 5
   Problem No. - 4
   Semester - 5 (Autumn 2021-22)
   Group No. - 30
   Group Members - Vanshita Garg (19CS10064) & Ashutosh Kumar Singh (19CS30008)
*/

// Testbench for the comparator FSM
module comparator_fsm_tb;
    // Inputs
    reg clk, op, rst, a, b;
    
    // Outputs
    wire L, E, G;
    
    // Instantiate the unit under test
    comparator_fsm COMP (.clk(clk), .op(op), .rst(rst), .a(a), .b(b), .L(L), .E(E), .G(G));

    initial begin
        // Check for a case when A = B
        clk = 1'b0; rst = 1'b1; op = 1'b0;
        #4 rst = 1'b0; a = 1'b1; b = 1'b1;
        #10 op = 1'b1; a = 1'b0; b = 1'b0;
        #2 $display("time = %0d, L = %b, E = %b, G = %b", $time, L, E, G);
        
        // Check for a case when A > B
        #4 rst = 1'b1; op = 1'b0;
        #4 rst = 1'b0; a = 1'b1; b = 1'b0;
        #10 op = 1'b1; a = 1'b0; b = 1'b1;
        #2 $display("time = %0d, L = %b, E = %b, G = %b", $time, L, E, G);
        
        // Check for a case when A < B
        #4 rst = 1'b1; op = 1'b0;
        #4 rst = 1'b0; a = 1'b0; b = 1'b1;
        #10 op = 1'b1; a = 1'b1; b = 1'b0;
        #2 $display("time = %0d, L = %b, E = %b, G = %b", $time, L, E, G);

        #1 $finish;
    end

    always  begin
        #5 clk = ~clk;
    end
endmodule
