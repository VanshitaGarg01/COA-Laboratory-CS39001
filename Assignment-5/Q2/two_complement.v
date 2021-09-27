module two_complement (out, x, rst, clk);
    input x, rst, clk;
    output reg out;
    reg PS, NS;
    parameter S0 = 1'b0, S1 = 1'b1;

    always @ (posedge clk or posedge rst) begin
        if (rst)
            PS <= 1'b0;
        else 
            PS <= NS;
    end

    always @ (*) begin
        case (PS)
            S0: NS = (x) ? S1 : S0;
            S1: NS = S1;
        endcase
    end

    always @ (*) begin
        case (PS)
            S0: out = (x) ? 1 : 0;
            S1: out = (x) ? 0 : 1;
        endcase
    end

endmodule