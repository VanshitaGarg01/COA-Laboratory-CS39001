module ALU (
    input [31:0] A, 
    input [31:0] B, 
    input Dir, 
    input Type, 
    input ALUsel, 
    input ALUop, 
    output reg Carry, 
    output reg Zero, 
    output reg Sign, 
    output reg [31:0] Result
);

    parameter S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b011, S4 = 3'b100;

    wire NOT1_out, MUX1_out, MUX2_out;
    wire [31:0] ADDER_out, BARREL_SHIFTER1_out, AND_out, XOR_out;

    not NOT1 (NOT1_out, B);

    mux_2_1 MUX1 (.a0(A), .a1(1'b1), .sel(ALUsel), .out(MUX1_out));
    mux_2_1 MUX2 (.a0(B), .a1(NOT1_out), .sel(ALUsel), .out(MUX2_out));

    adder ADDER1 (.a(A), .b(B), .c_in(1'b0), .c_out(carry_temp), .sum(ADDER_out));

    barrel_shifter BARREL_SHIFTER1 (.in(MUX1_out), .shamt(MUX2_out), .dir(Dir), .out(BARREL_SHIFTER1_out), .aorl(Type));

    and AND1 (AND_out, MUX1_out, MUX2_out);

    xor XOR1 (XOR_out, MUX1_out, MUX2_out);

    always @(*) begin
        case (ALUop)
            S0 : begin
                Result = M1_out;
            end
            S1 : begin
                Result = ADDER_out;
                Carry = carry_temp;
            end
            S2 : begin
                Result = AND_out;
            end
            S3 : begin
                Result = XOR_out;
            end
            S4 : begin
                Result = BARREL_SHIFTER1_out;
            end
        endcase
    end

    always @(Result) begin
        if (!Result) begin
            Zero = 1'b1;
        end else begin
            Zero = 1'b0;
        end
        if (Result < 0) begin
            Sign = 1'b0;
        end else begin
            Sign = 1'b1;
        end
    end
    
endmodule