/*
   Assignment No. - 6
   Problem No. - 2
   Semester - 5 (Autumn 2021-22)
   Group No. - 30
   Group Members - Vanshita Garg (19CS10064) & Ashutosh Kumar Singh (19CS30008)
*/

`timescale 1ns / 1ps

// Testbench for bit serial adder
module bit_serial_adder_tb;
    // Inputs
    reg clk, rst, load;
    parameter N = 8;
    reg [N-1:0] A, B;

    // Outputs
    wire [N-1:0] sum;
    wire c_out;

    // Instantiate the unit under test
    bit_serial_adder BSA (.clk(clk), .rst(rst), .load(load), .A(A), .B(B), .sum(sum), .c_out(c_out));

    initial begin
        clk = 1'b0; rst = 1'b1;
        #10 rst = 1'b0;

        #5 load = 1'b1;
        A = 8'b01010110; B = 8'b10000111;       // A = 86, B = 135
        
        #5 load = 1'b0;

        // Wait for clock cycles to finish
        #90 $display("time = %0d, A = %b (= %d), B = %b (= %d), sum = %b (= %d), c_out = %b", $time, A, A, B, B, sum, sum, c_out);

        #10 rst = 1'b1;
        #10 rst = 1'b0;

        #5 load = 1'b1;
        A = 8'b01111111; B = 8'b10010100;       // A = 127, B = 148
        
        #5 load = 1'b0;
        
        // Wait for clock cycles to finish
        #90 $display("time = %0d, A = %b (= %d), B = %b (= %d), sum = %b (= %d), c_out = %b", $time, A, A, B, B, sum, sum, c_out);
        
        #10 $finish;
    end

    always begin
        #5 clk = ~clk;
    end
endmodule
