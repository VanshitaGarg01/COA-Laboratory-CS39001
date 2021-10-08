/*
   Assignment No. - 6
   Problem No. - 1
   Semester - 5 (Autumn 2021-22)
   Group No. - 30
   Group Members - Vanshita Garg (19CS10064) & Ashutosh Kumar Singh (19CS30008)
*/

`timescale 1ns / 1ps

// Testbench for mux_array module
module mux_array_tb;
    // Inputs
    reg [7:0] a0, a1;
    reg sel;
    
    // Outputs
    wire [7:0] out;
    
    // Instantiate the unit under test
    mux_array M(.a0(a0), .a1(a1), .sel(sel), .out(out));
    
    initial begin
        // Monitor the changes
        $monitor("time = %0d, a0 = %b, a1 = %b, sel = %b, out = %b", $time, a0, a1, sel, out);
        
        // Stimulus to verify the working of the multiplexer
        a0 = 8'b10010101; a1 = 8'b10111111; sel = 1'b1;
        #5 sel = 1'b0;
        #5 a1 = 8'b10010101; a0 = 8'b10111111; sel = 1'b1;
        #5 sel = 1'b0;
        #5 $finish;
    end
endmodule