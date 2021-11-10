`timescale 1ns / 1ps

module KGPRISC (
    input clk,
    input rst
//    output [31:0] instruction, instrAddr, result, nextPC, dataMemReadData
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
//    output carry, zero, sign, validJump, lastCarry
    

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
//        .dataMemReadData(dataMemReadData),
//        .carry(carry), 
//        .zero(zero), 
//        .sign(sign), 
//        .validJump(validJump),
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
        .rst(rst)
//        .instruction(instruction),
//        .instrAddr(instrAddr),
//        .result(result),
//        .nextPC(nextPC),
//        .lastCarry(lastCarry)
    );
endmodule