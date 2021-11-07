module pc (
    input [31:0] nextInstrAddr,
    input clk, 
    input rst,
    output [31:0] instrAddr
);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            instrAddr <= 32'b00000000000000000000000000000000;
        end else begin
            instrAddr <= nextInstrAddr;
        end
    end

endmodule
