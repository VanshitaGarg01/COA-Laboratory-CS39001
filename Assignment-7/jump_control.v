module jump_control (
    input Sign,
    input Carry,
    input Zero,
    input [5:0] opcode,
    output reg ValidJump
);
    parameter S0 = 7, S1 = 8, S2 = 9, S3 = 10, S4 = 11, S5 = 12, S6 = 13, S7 = 14;
    
    always @(*) begin
        case (opcode)
            S0 : begin
                if (Sign and !Zero)
                    ValidJump = 1;
                else 
                    ValidJump = 0
            end
            S1 : begin
                if (!Sign and Zero)
                    ValidJump = 1;
                else 
                    ValidJump = 0
            end
            S2 : begin
                if (!Zero)
                    ValidJump = 1;
                else 
                    ValidJump = 0
            end
            S3 : begin
                    ValidJump = 1;
                end
            S4 : begin
                    ValidJump = 1;
                end
            S5 : begin
                    ValidJump = 1;
                end
            S6 : begin
                if (Carry)
                    ValidJump = 1;
                else 
                    ValidJump = 0
            end
            S7 : begin
                if (!Carry)
                    ValidJump = 1;
                else 
                    ValidJump = 0
            end
            default : ValidJump = 0;
        endcase
    end

endmodule