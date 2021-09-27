`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   01:34:10 09/28/2021
// Module Name:   seq_comp_tb
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: seq_comp
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

// Testbench for the sequential unsigned comparator
module seq_comp_tb;
    // Inputs
    parameter N = 32;
    reg clk, rst, op, load_A, load_B;
    reg [N-1:0] parallel_in_A, parallel_in_B;
    
    // Outputs
    wire L, E, G;
    
    // Instantiate the unit under test
    seq_comp SEQ_COMP_1 (.clk(clk), .rst(rst), .op(op), .load_A(load_A), .load_B(load_B), .parallel_in_A(parallel_in_A), .parallel_in_B(parallel_in_B), .L(L), .E(E), .G(G));

    initial begin
        // Check for a case when A > B
        clk = 1'b0; rst = 1'b1; op = 1'b0;
        #2 rst = 1'b0; load_A = 1'b1; load_B = 1'b1; parallel_in_A = 32'd3424522475; parallel_in_B = 32'd232242467;
        #2 load_A = 1'b0; load_B = 1'b0;
        
        // Wait for 32 clock cycles
        #315 op = 1'b1;
        #1 $display("time = %0d, L = %b, E = %b, G = %b", $time, L, E, G);
        
        // Check for a case when A = B
        #1 rst = 1'b1; op = 1'b0;
        #1 rst = 1'b0; load_A = 1'b1; load_B = 1'b1; parallel_in_A = 32'd3424522475; parallel_in_B = 32'd3424522475;
        #2 load_A = 1'b0; load_B = 1'b0;
        
        // Wait for 32 clock cycles
        #315 op = 1'b1;
        #1 $display("time = %0d, L = %b, E = %b, G = %b", $time, L, E, G);
        
        // Check for a case when A < B
        #1 rst = 1'b1; op = 1'b0;
        #1 rst = 1'b0; load_A = 1'b1; load_B = 1'b1; parallel_in_A = 32'd232242467; parallel_in_B = 32'd3424522475;
        #2 load_A = 1'b0; load_B = 1'b0;
        
        // Wait for 32 clock cycles
        #315 op = 1'b1;
        #1 $display("time = %0d, L = %b, E = %b, G = %b", $time, L, E, G);

        #1 $finish;
    end

    always begin
        #5 clk = ~clk;
    end
endmodule
