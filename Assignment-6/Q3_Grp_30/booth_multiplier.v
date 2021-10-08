/*
   Assignment No. - 6
   Problem No. - 3
   Semester - 5 (Autumn 2021-22)
   Group No. - 30
   Group Members - Vanshita Garg (19CS10064) & Ashutosh Kumar Singh (19CS30008)
*/

`timescale 1ns / 1ps

// Module for Sequential Signed Binary Multiplier (Booth Multiplier)
module booth_multiplier #(parameter N = 8) (clk, rst, load, A, B, prod);
     /*
      Input and output ports :
      clk - the clock signal
      rst - the reset signal
      load - the load signal
      A - parallel load value for 1st integer
      B - parallel load value for 2nd integer
      prod - the 16-bit product output
    */
    input clk, rst, load;
    input signed [N-1:0] A, B;
    output reg [2*N-1:0] prod;

    // right_bit stores the rightmost shifted bit used in booth multiplier 
    // Initialized to zero
    reg right_bit = 1'b0; 

    // pos_B stores 8-bit right shifted positive multiplicand B
    // neg_B stores 8-bit right shifted negative multiplicand B
    // prod_sofar stores temporary computed product after each iteration 
    reg signed [2*N-1:0] pos_B, neg_B, prod_sofar;

    // a and b stores A and B respectively, used for parallel load of input
    reg signed [N-1:0] a, b;

    // loop counter for booth multiplication algorithm, will count till 8
    integer counter = 0;

    // executes on every positive edge of clk
    always @(posedge clk) begin

        // If rst is pressed, reset everything to 0
        if (rst) begin
            right_bit <= 1'b0;
            a <= 8'b0;
            b <= 8'b0;
            pos_B <= 16'b0;
            neg_B <= 16'b0;
            prod_sofar <= 16'b0;
            counter <= 0;
        end

        // If load is pressed, load data and reset everything else
        else if (load) begin
            right_bit <= 1'b0;
            a <= A;
            b <= B;
            pos_B <= {B, 8'b0};
            neg_B <= (~B + 1'b1) << 8;
            prod_sofar <= {8'b0, A};
            counter <= 0;
        end

        // Computes product of A and B by checking two leftmost bits
        else begin

            // If two leftmost bits are 00 or 11, shift right by 1-bit
            if (prod_sofar[0] == right_bit) begin
                prod_sofar <= prod_sofar >>> 1;
            end 

            // If two leftmost bits are 10, add neg_B and shift right by 1-bit
            else if (right_bit == 1'b0) begin
                prod_sofar <= (prod_sofar + neg_B) >>> 1;
            end 

            // If two leftmost bits are 01, subtract neg_B and shift right by 1-bit
            else begin
                prod_sofar <= (prod_sofar + pos_B) >>> 1;
            end

            // update rightmost bit after shifting
            right_bit <= prod_sofar[0];

            // increment counter
            counter <= counter + 1;
        end
    end

    // update output product
    always @(*) begin

        // If rst is pressed, prod = 0
        if (rst)
            prod <= 0;

        // If counter < 8, update prod, else do nothing
        else if (counter <= 8)
            prod <= prod_sofar;
    end

endmodule
