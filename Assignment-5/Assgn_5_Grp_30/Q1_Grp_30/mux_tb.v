`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:54:35 09/27/2021
// Module Name:   mux_tb
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mux
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

// Testbench for 2x1 mux module
module mux_tb;
    // Inputs
    reg a0, a1, sel;
    
    // Outputs
    wire out;
    
    // Instantiate the unit under test
    mux M1(.a0(a0), .a1(a1), .sel(sel), .out(out));
    
    initial begin
        // Monitor the changes
        $monitor("time = %0d, a0 = %b, a1 = %b, sel = %b, out = %b", $time, a0, a1, sel, out);
        
        // Stimulus to verify the working of the multiplexer
        a0 = 1'b1; a1 = 1'b0; sel = 1'b1;
        #5 sel = 1'b0;
        #5 a0 = 1'b1; a1 = 1'b1; sel = 1'b1;
        #5 sel = 1'b0;
        #5 a0 = 1'b0; a1 = 1'b0; sel = 1'b1;
        #5 sel = 1'b0;
        #5 a0 = 1'b0; a1 = 1'b1; sel = 1'b1;
        #5 sel = 1'b0;
        #5 $finish;
    end
endmodule
