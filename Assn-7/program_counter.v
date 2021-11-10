`timescale 1ns / 1ps

module program_counter (
    input [31:0] nextInstrAddr,
    input clk, 
    input rst,
    output reg [31:0] instrAddr
);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            instrAddr <= -32'd4;
        end else begin
            instrAddr <= nextInstrAddr;
        end
    end

endmodule

