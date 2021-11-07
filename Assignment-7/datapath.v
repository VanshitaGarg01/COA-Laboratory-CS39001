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
    parameter ra = 5'b11111;

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

    // mux_32b_2_1 MUX2 (
    //     .a0()
    // );

    mux_32b_2_1 MUX3 (
        .a0(readData2),
        .a1(mux2Out),
        .sel(ALUsrc), 
        .out(b)
    );

    ALU ALU1 (
        
    );




endmodule