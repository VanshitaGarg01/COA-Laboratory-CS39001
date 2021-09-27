module comparator_fsm (clk, op, rst, a, b, L, E, G);
    input clk, op, rst, a, b;
    output reg L, E, G;

    reg [1:0] PS, NS;
    parameter A_eq_B = 2'b00, A_gr_B = 2'b01, A_le_B = 2'b10;

    always @(posedge clk or posedge rst) begin
        if (rst)
            PS <= 2'b00;
        else
            PS <= NS;
    end

    always @(*) begin
        case (PS)
            A_eq_B: begin
                        if (a && !b)
                            NS = A_gr_B;
                        else if (!a && b)
                            NS = A_le_B;
                        else
                            NS = A_eq_B;
                    end
            A_gr_B: NS = A_gr_B;
            A_le_B: NS = A_le_B;
        endcase
    end

    always @(*) begin
        if (op) begin
            case (PS)
                A_eq_B: begin
                            L = 0; E = 1; G = 0;
                        end
                A_gr_B: begin
                            L = 0; E = 0; G = 1;
                        end
                A_le_B: begin
                            L = 1; E = 0; G = 0;
                        end
            endcase
        end
        else begin
            L = 0; E = 0; G = 0;
        end
    end
endmodule
