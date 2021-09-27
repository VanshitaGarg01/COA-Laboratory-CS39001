`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   01:06:08 09/28/2021
// Module Name:   detector_multiple_3_tb
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: detector_multiple_3
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
   Problem No. - 3
   Semester - 5 (Autumn 2021-22)
   Group No. - 30
   Group Members - Vanshita Garg (19CS10064) & Ashutosh Kumar Singh (19CS30008)
*/

// Testbench for the multiple-of-3 detector FSM
module detector_multiple_3_tb;
    // Inputs
    reg clk, rst, x;
    
    // Outputs
    wire out;
    
    parameter N = 8;
    reg [N-1:0] inp = 8'b11011001;
    integer i, j;
    
    // Instantiate the unit under test
    detector_multiple_3 DM1 (.x(x), .rst(rst), .clk(clk), .out(out));
    
    initial begin
        clk = 1'b0;
        rst = 1'b1; 
        x = 1'b0;

        #2 rst = 1'b0; 
        
        // Pass the input bits one by one (MSB to LSB)
        for (i = N - 1; i >= 0; i = i - 1) begin
            #10 x = inp[i]; 
        end

        #10 $finish;   
    end

    initial begin
        // Display the output bits
        #5
        for (j = N - 1; j >= 0; j = j - 1) begin
            #10 $display("time = %0d, out = %b", $time, out);
        end
    end
    
    always begin
        #5 clk = ~clk;
    end
endmodule
