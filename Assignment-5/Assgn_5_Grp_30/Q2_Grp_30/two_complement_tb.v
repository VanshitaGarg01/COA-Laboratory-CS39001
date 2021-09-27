`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:52:48 09/28/2021
// Module Name:   two_complement_tb
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: two_complement
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
   Problem No. - 2
   Semester - 5 (Autumn 2021-22)
   Group No. - 30
   Group Members - Vanshita Garg (19CS10064) & Ashutosh Kumar Singh (19CS30008)
*/

// Testbench for the two's complement FSM
module two_complement_tb;
    // Inputs
    reg clk, rst, x;
    
    // Outputs
    wire out;
    
    parameter N = 11;
    reg [N-1:0] inp = 11'b01010011100;
    integer i, j;
    
    // Instantiate the unit under test
    two_complement TC1 (.x(x), .rst(rst), .clk(clk), .out(out));
    
    initial begin
        clk = 1'b0; rst = 1'b1; x = 1'b0;

        #2 rst = 1'b0; 
        
        // Pass the input bits one by one (LSB to MSB)
        for (i = 0; i < N; i = i + 1) begin
            #10 x = inp[i];
        end
        
        #10 $finish;   
    end

    initial begin
        // Display the output bits
        #5
        for (j = 0; j < N; j = j + 1) begin
            #10 $display("time = %0d, out = %b", $time, out);
        end
    end

    always begin
        #5 clk = ~clk;
    end
endmodule
