`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:56:01 11/07/2021 
// Design Name: 
// Module Name:    barrel_shifter 
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
// The Bidirectional Barrel Shifter module
module barrel_shifter (
    input signed [31:0] in, 
    input [31:0] shamt, 
    input dir, 
    input aorl,
    output reg [31:0] out
);

    always @(*) begin
        if (aorl) begin
            if (!dir) begin
                out = in >>> shamt;
            end else begin
                out = in;
            end
        end else begin
            if (!dir) begin
                out = in >> shamt;
            end else begin
                out = in << shamt;
            end
        end
    end

endmodule
