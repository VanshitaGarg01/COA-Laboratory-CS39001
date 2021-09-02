`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:29:19 08/25/2021
// Design Name:   
// Module Name:   rca_8_bit_tb
// Project Name:  Ripple-Carry-Adder
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: rca_8_bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// 
////////////////////////////////////////////////////////////////////////////////

/*
   Assignment No. - 1
   Problem No. - 1
   Semester - 5 (Autumn 2021-22)
   Group No. - 30
   Group Members - Ashutosh Kumar Singh (19CS30008) & Vanshita Garg (19CS10064)
*/

// Testbench for the 8-bit ripple carry adder module
module rca_8_bit_tb;

    // Inputs
    reg [7:0] A = 8'd0, B = 8'd0;
    reg c_in = 1'b0;

    // Outputs
    wire [7:0] sum;
    wire c_out;

    // Instantiate the unit under test
    rca_8_bit RCA(.a(A), .b(B), .c_in(c_in), .sum(sum), .c_out(c_out));

    initial begin
        // Monitor the changes
        $monitor("A = %d, B = %d, c_in = %b, sum = %d, c_out = %b", A, B, c_in, sum, c_out);
        
        // Stimulus to verify the working of the 8-bit ripple carry adder
        #5 A = 8'd42; B = 8'd45;
        #5 A = 8'd128; B = 8'd127;
        #5 A = 8'd130; B = 8'd169;
        #5 A = 8'd255; B = 8'd255;
        #5 $finish;
    end
endmodule
