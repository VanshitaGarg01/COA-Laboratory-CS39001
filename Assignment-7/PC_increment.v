module PC_increment (
    input [31:0] instrAddr,
    output [31:0] nextPC
);

    assign nextPC = instrAddr + 32'b00000000000000000000000000000100;
    
endmodule