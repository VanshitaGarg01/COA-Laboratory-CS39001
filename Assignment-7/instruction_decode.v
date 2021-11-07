module instruction_decode (
    input [31:0] instruction,
    output [5:0] opcode,
    output [4:0] func,
    output [25:0] label0,
    output [15:0] label1,
    output [4:0] rs,
    output [4:0] rt,
    output [4:0] shamt,
    output [16:0] imm
);

    assign opcode = instruction[31:26];
    assign func = instruction[4:0];
    assign label0 = instruction[25:0];
    assign label1 = instruction[15:0];
    assign rs = instruction[25:21];
    assign rt = instruction[20:16];
    assign shamt = instruction[15:11];
    assign imm = instruction[15:0];
    
endmodule