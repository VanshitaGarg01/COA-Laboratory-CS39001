`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:36:15 11/07/2021
// Design Name:   ALU
// Module Name:   /home/vanshita/COA-Laboratory-CS39001/Assn-7/control_unit_tb.v
// Project Name:  Assn-7
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
module control_unit_tb;
    // Inputs
    reg [5:0] opcode;
    reg [4:0] func;

    // Outputs
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

    initial begin
        $monitor("regDest = %b, regWrite = %b, memRead = %b, memWrite = %b, memToReg = %b, ALUsrc = %b, ALUop = %b, ALUsel = %b, branch = %b, jumpAddr = %b, lblsel = %b",
                regDst, regWrite, memRead, memWrite, memToReg, ALUsrc, ALUop, ALUsel, branch, jumpAddr, lblSel);  

        opcode = 6'b000000; func = 5'b00000;
        #5 opcode = 6'b000001; func = 5'b00000;
        #5 opcode = 6'b000010; func = 5'b00000;
        #5 opcode = 6'b000011;
        #5 opcode = 6'b000101;
        #5 opcode = 6'b000111;

        #5 $finish;
    end
endmodule
