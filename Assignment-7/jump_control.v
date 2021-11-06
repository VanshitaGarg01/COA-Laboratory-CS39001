module jump_control (
    input [5:0] opcode,
    input sign,
    input carry,
    input zero,
    output reg validJump
);
    
    always @(*) begin
        case (opcode)
            6'b000111 : begin           // bltz
                if (sign && !zero)
                    validJump = 1;
                else 
                    validJump = 0;
            end
            6'b001000 : begin           // bz
                if (!sign && zero)
                    validJump = 1;
                else 
                    validJump = 0;
            end
            6'b001001 : begin           // bnz
                if (!zero)
                    validJump = 1;
                else 
                    validJump = 0;
            end
            6'b001010 : begin           // br
                    validJump = 1;
                end
            6'b001011 : begin           // b
                    validJump = 1;
                end
            6'b001100 : begin           // bl
                    validJump = 1;
                end
            6'b001101 : begin           // bcy
                if (carry)
                    validJump = 1;
                else 
                    validJump = 0;
            end
            6'b001110 : begin           // bncy
                if (!carry)
                    validJump = 1;
                else 
                    validJump = 0;
            end
            default : validJump = 0;
        endcase
    end

endmodule
