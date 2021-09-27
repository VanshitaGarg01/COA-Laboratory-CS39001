`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:03:15 09/27/2021
// Module Name:   dff_tb
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: dff
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
   Problem No. - 1
   Semester - 5 (Autumn 2021-22)
   Group No. - 30
   Group Members - Vanshita Garg (19CS10064) & Ashutosh Kumar Singh (19CS30008)
*/

// Testbench for D Flip-Flop module
module dff_tb;
    // Inputs
    reg clk, rst, d;
    
    //Outputs
    wire q;
    
    // Instantiate the unit under test
    dff D1(.clk(clk), .rst(rst), .d(d), .q(q));
    
    initial begin
        // Monitor the changes
        $monitor("time = %0d, d = %b, q = %b, rst = %b, clk = %b", $time, d, q, rst, clk);
        
        // Stimulus to verify the working of the multiplexer
        clk = 1'b0;
        #2 d = 1'b1; rst = 1'b1;
        #1 rst = 1'b0;
        #5 d = 1'b0;
        #5 d = 1'b1;
        #5 d = 1'b1;
        #5 d = 1'b0;
        #5 d = 1'b1;
        #5 $finish;
    end
    
    // Change the clock signal after every 5 time units
    always begin
        #5 clk = ~clk;
    end
endmodule
