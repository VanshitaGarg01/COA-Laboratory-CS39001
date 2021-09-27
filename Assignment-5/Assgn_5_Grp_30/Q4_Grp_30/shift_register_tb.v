`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   01:15:52 09/28/2021
// Module Name:   shift_register_tb
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: shift_register
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

// Testbench for the shift register module
module shift_register_tb;
    // Inputs
    reg clk, rst, load;
    parameter N = 32;
    reg [N-1:0] parallel_in;
    
    // Outputs
    wire out;
    
    integer i;
    
    // Instantiate the unit under test
    shift_register S_REG (.clk(clk), .rst(rst), .load(load), .parallel_in(parallel_in), .out(out));

    initial begin
        clk = 1'b0; rst = 1'b1;

        #2 rst = 1'b0; load = 1'b1;
        parallel_in = 32'b10011011000101010000010010101011;

        #1 load = 1'b0;
        
        // Wait for 32 clock cycles to finish
        #320 $finish;
    end

    initial begin
        // Display the output bits
        for (i = 0; i < N; i = i + 1) begin
            #10 $display("time = %0d, out = %b", $time, out);
        end
    end

    always begin
        #5 clk = ~clk;
    end
endmodule
