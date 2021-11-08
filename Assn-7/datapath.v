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
    output [5:0] opcode,
    output [4:0] func
);
    parameter ra = 5'b11111;

    wire enable;
    wire carry, zero, sign, validJump;
    wire [31:0] nextInstrAddr, instrAddr, instruction, writeData, readData1, readData2, SE1out, b, result, nextPC, dataMemReadData;
    wire [25:0] label0;
    wire [15:0] label1, imm;
    wire [4:0] rs, rt, shamt, writeReg;
    wire [31:0] offset;
    
    assign enable = memRead | memWrite;
    assign offset = instrAddr >>> 3'b100;
    
    program_counter PC (
        .nextInstrAddr(nextInstrAddr),
        .clk(clk),
        .rst(rst),
        .instrAddr(instrAddr)
    );

    bram_instr_mem instructionMemory (
        .clka(clk),
        .ena(1'b1),
        .addra(offset[9:0]),
        .douta(instruction)
    );

    instruction_decode instructionDecoder (
        .instruction(instruction),
        .opcode(opcode),
        .func(func),
        .label0(label0),
        .label1(label1),
        .rs(rs),
        .rt(rt),
        .shamt(shamt),
        .imm(imm)
    );

    mux_5b_3_1 MUX1 (
        .a0(rs),
        .a1(rt),
        .a2(ra),
        .sel(regDst),
        .out(writeReg)
    );

    register_file registerFile (
        .rs(rs),
        .rt(rt),
        .regWrite(regWrite),
        .writeReg(writeReg),
        .writeData(writeData),
        .clk(clk),
        .rst(rst),
        .readData1(readData1),
        .readData2(readData2)
    );

    immediate_sign_extend SE1 (
        .opcode(opcode),
        .func(func),
        .instr(imm),
        .extendImm(SE1out)
    );

    mux_32b_2_1 MUX2 (
        .a0(readData2),
        .a1(SE1out),
        .sel(ALUsrc), 
        .out(b)
    );

    ALU ALU1 (
        .a(readData1),
        .b(b),
        .ALUsel(ALUsel),
        .ALUop(ALUop),
        .carry(carry),
        .zero(zero), 
        .sign(sign),
        .result(result)
    );

    jump_control JC (
        .opcode(opcode),
        .sign(sign),
        .carry(carry),
        .zero(zero),
        .validJump(validJump)
    );

    PC_increment PCInc (
        .instrAddr(instrAddr),
        .nextPC(nextPC)
    );

    branch_unit branchUnit (
        .nextPC(nextPC),
        .label0(label0),
        .label1(label1),
        .rsAddr(readData1),
        .lblSel(lblSel),
        .jumpAddr(jumpAddr),
        .branch(branch),
        .validJump(validJump),
        .nextAddr(nextInstrAddr)
    );

    bram_data_mem dataMemory (
        .clka(clk),
        .ena(enable),
        .wea(memWrite),
        .addra(result[9:0]),
        .dina(readData2),
        .douta(dataMemReadData)
    );

    mux_32b_3_1 MUX3 (
        .a0(nextPC),
        .a1(dataMemReadData),
        .a2(result),
        .sel(memToReg),
        .out(writeData)
    );

endmodule