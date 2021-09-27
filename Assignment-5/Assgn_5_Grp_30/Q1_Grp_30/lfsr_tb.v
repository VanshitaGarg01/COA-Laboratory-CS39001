`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:17:44 09/27/2021
// Module Name:   lfsr_tb
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: lfsr
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

// Testbench for the LFSR module
module lfsr_tb;
    // Inputs
    reg sel, clk, rst;
    reg [3:0] seed;
    
    // Outputs
    wire [3:0] w;
    
    // Instantiate the unit under test
    lfsr LFSR1(.seed(seed), .sel(sel), .rst(rst), .clk(clk), .w(w));
    
    initial begin
        // Monitor the changes
        $monitor("time = %0d, output = %b%b%b%b", $time, w[0], w[1], w[2], w[3]);
        clk = 1'b0;
        sel = 1'b0;
        seed = 4'b1111;
        #6 sel = 1'b1;
        
        // Finish after 15 clock cycles
        #155 $finish;
    end
    
    // Change the clock signal after every 5 time units
    always begin
        #5 clk = ~clk;
    end
endmodule

