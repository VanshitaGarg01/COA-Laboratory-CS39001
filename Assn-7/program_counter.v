`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:19:51 11/08/2021 
// Design Name: 
// Module Name:    program_counter 
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
module program_counter (
    input [31:0] nextInstrAddr,
    input clk, 
    input rst,
    output reg [31:0] instrAddr
);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            instrAddr <= -32'd4;
        end else begin
            instrAddr <= nextInstrAddr;
        end
    end

endmodule

