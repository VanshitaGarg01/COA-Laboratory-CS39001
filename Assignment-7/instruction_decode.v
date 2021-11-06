module instruction_decode (
    input [31:0] instruction,
    output [5:0] opcode,
    output [4:0] func,
    output [15:0] label1,
    output [25:0] label2,
    output [4:0] reg1,
    output [4:0] reg2,
    output [4:0] shamt,
    output [16:0] imm
);

    assign opcode = instruction[31:26];
    assign func = instruction[4:0];
    assign label1 = instruction[15:0];
    assign label2 = instruction[25:0];
    assign reg1 = instruction[25:21];
    assign reg2 = instruction[20:16];
    assign shamt = instruction[15:11];
    assign imm = instruction[15:0];
    
endmodule