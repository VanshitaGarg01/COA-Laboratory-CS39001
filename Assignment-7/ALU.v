module ALU (
    input [31:0] a, 
    input [31:0] b, 
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

    mux_32b_2_1 mux1 (.a0(a), .a1(32'd1), .sel(ALUsel), .out(mux1Out));
    mux_32b_2_1 mux2 (.a0(b), .a1(not1Out), .sel(ALUsel), .out(mux2Out));

    adder_32_bit adder1 (.a(a), .b(b), .c_in(1'b0), .c_out(carryTemp), .sum(adder1Out));

    barrel_shifter barrelShifter1 (.in(mux1Out), .shamt(mux2Out), .dir(ALUop[1]), .out(barrelShifter1Out), .aorl(ALUop[0]));

    // and and1 (and1Out, mux1Out, mux2Out);

    // xor xor1 (xor1Out, mux1Out, mux2Out);
    assign not1Out = ~b;
    assign and1Out = mux1Out & mux2Out;
    assign xor1Out = mux1Out ^ mux2Out;
    always @(*) begin
        $display($time, ", a = %d, b = %d", mux1Out, mux2Out);
        if (ALUop == 5'b00000) begin
            result = mux1Out;
        end else if (ALUop == 5'b00001) begin
            carry = carryTemp;
            result = adder1Out;
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
        end else begin
            result = 32'd0;
        end
    end

    always @(result) begin
        if (!result) begin
            zero = 1'b1;
        end else begin
            zero = 1'b0;
        end
        if (result < 0) begin
            sign = 1'b1;
        end else begin
            sign = 1'b0;
        end
    end
    
endmodule
