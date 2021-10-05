/*
   Assignment No. - 6
   Problem No. - 2
   Semester - 5 (Autumn 2021-22)
   Group No. - 30
   Group Members - Vanshita Garg (19CS10064) & Ashutosh Kumar Singh (19CS30008)
*/

// Top level module for the bit serial adder
module bit_serial_adder #(parameter N = 8) (clk, rst, load, A, B, sum, c_out);
    /*
      Input and output ports :
      clk - the clock signal
      rst - the reset signal
      load - the load signal
      A - parallel load value for 1st integer
      B - parallel load value for 2nd integer
      sum - the 8-bit sum output
      c_out - the carry out bit
    */
    input clk, rst, load;
    input [N-1:0] A, B;
    output wire [N-1:0] sum;
    output wire c_out;

    wire a, b, s, carry;

    // Instantiate the input side shift registers
    shift_register SREG_A (.clk(clk), .rst(rst), .load(load), .parallel_in(A), .out(a));
    shift_register SREG_B (.clk(clk), .rst(rst), .load(load), .parallel_in(B), .out(b));

    // Instantiate the full adder
    full_adder FA (.a(a), .b(b), .c_in(c_out), .sum(s), .c_out(carry));

    // Instantiate the D Flip-Flop
    dff DFF (.clk(clk), .rst(rst), .d(carry), .q(c_out));

    // Instantiate the serial-in parallel-out shift register for the output 
    sipo SIPO (.clk(clk), .rst(rst), .serial_in(s), .new_load(load), .out(sum));
endmodule
