`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:48:58 11/08/2021 
// Design Name: 
// Module Name:    datapath 
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
module datapath (
    input [1:0] regDst,
    input regWrite,
    input memRead,
    input memWrite,
    input [1:0] memToReg,
    input ALUsrc,
    input [4:0] ALUop,
    input ALUsel,
    input branch,
    input jumpAddr,
    input lblSel,
    input clk,
    input rst,
    output reg [5:0] opcode,
    output reg [4:0] func
);

    program_counter PC (
        .nextInstrAddr(nextInstrAddr),
        .clk(clk),
        .rst(rst),
        .instrAddr(instrAddr)
    );

    bram_instr_mem instructionMemory (
        .clka(clk),
        .ena(1'b1),
        .addra(instrAddr),
        .douta(instruction)
    );

    instruction_decode instructionDecoder (
        .instruction(instruction),
        .opcode(opcode),
        .func(func),
        .label0(label0),
        .label1(label1),
        .rs(rs)
        .rt(rt),
        .shamt(shamt),
        .imm(imm)
    );




endmodule
