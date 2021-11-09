`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:53:03 11/07/2021 
// Design Name: 
// Module Name:    ALU 
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
module ALU (
    input signed [31:0] a, 
    input signed [31:0] b, 
    input ALUsel, 
    input [4:0] ALUop, 
    output reg carry, 
    output reg zero, 
    output reg sign, 
    output reg [31:0] result
);

    wire carryTemp;
    wire [31:0] not1Out, adder1Out, barrelShifter1Out, and1Out, xor1Out, mux1Out, mux2Out;

    // not not1 (not1Out, b);

    mux_32b_2_1 mux1 (.a0(a), .a1(32'b00000000000000000000000000000001), .sel(ALUsel), .out(mux1Out));
    mux_32b_2_1 mux2 (.a0(b), .a1(not1Out), .sel(ALUsel), .out(mux2Out));

    adder_32_bit adder1 (.a(mux1Out), .b(mux2Out), .c_in(1'b0), .c_out(carryTemp), .sum(adder1Out));

    barrel_shifter barrelShifter1 (.in(mux1Out), .shamt(mux2Out), .dir(ALUop[1]), .out(barrelShifter1Out), .aorl(ALUop[0]));

    // and and1 (and1Out, mux1Out, mux2Out);

    // xor xor1 (xor1Out, mux1Out, mux2Out);
    assign not1Out = ~b;
    assign and1Out = mux1Out & mux2Out;
    assign xor1Out = mux1Out ^ mux2Out;

    always @(*) begin
        
        if (ALUop == 5'b00000) begin
            result = mux1Out;
        end else if (ALUop == 5'b00001) begin
            carry = carryTemp;
            result = adder1Out;
            $display("opcode=%b", ALUop);
        end else if (ALUop == 5'b00101) begin
            result = adder1Out;
        end else if (ALUop == 5'b10101) begin
            result = adder1Out;
        end else if (ALUop == 5'b00010) begin
            result = and1Out;
        end else if (ALUop == 5'b00011) begin
            result = xor1Out;
        end else if (ALUop[4:2] == 3'b010) begin
            result = barrelShifter1Out;
        end 
        else begin
            result = 32'b00000000000000000000000000000000;
            $display("***");
        end
        $display($time, ", A = %b, a = %b, b = %b, notb = %b, result = %b, carry = %b, cT = %b", a, mux1Out, mux2Out, not1Out, result, carry, carryTemp);
    end

    always @(result) begin
        if (!result) begin
            zero = 1'b1;
        end else begin
            zero = 1'b0;
        end
        sign = result[31];
    end
    
endmodule
