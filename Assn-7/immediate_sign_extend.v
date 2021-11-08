`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:40:20 11/08/2021 
// Design Name: 
// Module Name:    immediate_sign_extend 
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
module immediate_sign_extend (
    input [5:0] opcode,
    input [4:0] func,       // not used here
    input [15:0] instr,
    output reg [31:0] extendImm
);
    always @(*) begin
        if (opcode == 6'b000010) begin
            extendImm = {{27{instr[15]}}, instr[15:11]};
        end else begin
            extendImm = {{16{instr[15]}}, instr};
        end
    end
endmodule