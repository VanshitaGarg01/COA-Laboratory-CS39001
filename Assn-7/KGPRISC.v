`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:48:40 11/08/2021 
// Design Name: 
// Module Name:    KGPRISC 
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
module KGPRISC (
    input clk,
    input rst,
    output [31:0] instruction, instrAddr, result, nextPC
);
    wire [5:0] opcode;
    wire [4:0] func;
    wire [1:0] regDst;
    wire regWrite;
    wire memRead;
    wire memWrite;
    wire [1:0] memToReg;
    wire ALUsrc;
    wire [4:0] ALUop;
    wire ALUsel;
    wire branch;
    wire jumpAddr;
    wire lblSel;
    

    control_unit CU (
        .opcode(opcode),
        .func(func),
        .regDst(regDst),
        .regWrite(regWrite),
        .memRead(memRead),
        .memWrite(memWrite),
        .memToReg(memToReg),
        .ALUsrc(ALUsrc),
        .ALUop(ALUop),
        .ALUsel(ALUsel),
        .branch(branch),
        .jumpAddr(jumpAddr),
        .lblSel(lblSel)
    );

    datapath DP (
        .opcode(opcode),
        .func(func),
        .regDst(regDst),
        .regWrite(regWrite),
        .memRead(memRead),
        .memWrite(memWrite),
        .memToReg(memToReg),
        .ALUsrc(ALUsrc),
        .ALUop(ALUop),
        .ALUsel(ALUsel),
        .branch(branch),
        .jumpAddr(jumpAddr),
        .lblSel(lblSel),
        .clk(clk),
        .rst(rst),
        .instruction(instruction),
        .instrAddr(instrAddr),
        .result(result),
        .nextPC(nextPC)
    );
endmodule