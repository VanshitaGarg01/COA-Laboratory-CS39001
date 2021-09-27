`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:22:16 09/28/2021 
// Design Name: 
// Module Name:    comparator_fsm 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

/*
   Assignment No. - 5
   Problem No. - 4
   Semester - 5 (Autumn 2021-22)
   Group No. - 30
   Group Members - Vanshita Garg (19CS10064) & Ashutosh Kumar Singh (19CS30008)
*/

// Module for a FSM which acts as an unsigned comparator
// We have 3 states - A_eq_B (A = B till now), A_gr_B (A > B till now) and A_le_B (A < B till now)
// Once we enter the states A_gr_B or A_le_B, we stay in that state
// From A_eq_B, on reading a = 1, b = 1 or a = 0, b = 0, we self loop
// On reading a = 1, b = 0, we go to A_gr_B, on reading a = 0, b = 1, we go to A_le_B
module comparator_fsm (clk, op, rst, a, b, L, E, G);
    /*
      Input and output ports :
      clk - the clock signal
      op - an input signal that becomes 1 after all 32 bits have been read
      rst - the reset signal
      a - the next bit from the number A
      b - the next bit from the number B
      L - output bit that is 1 when A < B
      E - output bit that is 1 when A = B
      G - output bit that is 1 when A > B
    */
    input clk, op, rst, a, b;
    output reg L, E, G;

    reg [1:0] PS, NS;
    parameter A_eq_B = 2'b00, A_gr_B = 2'b01, A_le_B = 2'b10;
    
    // Set the present state
    always @(posedge clk or posedge rst) begin
        if (rst)
            PS <= 2'b00;
        else
            PS <= NS;
    end
    
    // Next state logic
    always @(*) begin
        case (PS)
            A_eq_B: begin
                        if (a && !b)
                            NS = A_gr_B;
                        else if (!a && b)
                            NS = A_le_B;
                        else
                            NS = A_eq_B;
                    end
            A_gr_B: NS = A_gr_B;
            A_le_B: NS = A_le_B;
        endcase
    end
    
    // Output logic
    always @(*) begin
        if (op) begin
            case (PS)
                A_eq_B: begin
                            L = 1'b0; E = 1'b1; G = 1'b0;
                        end
                A_gr_B: begin
                            L = 1'b0; E = 1'b0; G = 1'b1;
                        end
                A_le_B: begin
                            L = 1'b1; E = 1'b0; G = 1'b0;
                        end
            endcase
        end
        else begin
            L = 1'b0; E = 1'b0; G = 1'b0;
        end
    end
endmodule
