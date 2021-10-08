/*
   Assignment No. - 6
   Problem No. - 2
   Semester - 5 (Autumn 2021-22)
   Group No. - 30
   Group Members - Vanshita Garg (19CS10064) & Ashutosh Kumar Singh (19CS30008)
*/

`timescale 1ns / 1ps

// Module for a serial-in parallel out shift register for the output of the bit-serial adder
module sipo #(parameter N = 8) (clk, rst, serial_in, new_load, out);
    /*
      Input and output ports :
      clk - the clock signal
      rst - the reset signal
      serial_in - the input bit at each clock cycle
      new_load - indicates whether a new load has been supplied to the input shift registers 
      out - the 8-bit parallel output
    */
    input clk, rst, serial_in, new_load;
    output reg [N-1:0] out;

    reg [3:0] count = 4'b0;

    always @(posedge clk) begin
        if (rst || new_load) begin
            out <= 8'b0;
            count <= 4'b0;
        end
        else begin
            // we stop after the required amount of clock cycles to calculayte the sum are over
            if (count <= 4'b1000) begin
                out <= {serial_in, out[N-1:1]};
                count <= count + 1;
            end
        end
    end
endmodule
