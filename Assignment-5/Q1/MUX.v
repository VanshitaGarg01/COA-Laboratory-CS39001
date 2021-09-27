module mux (a0, a1, sel, out);
    input a0, a1;
    input sel;
    output reg out;

    always @(*) begin
        if (sel)
            out <= a1;
        else
            out <= a0;
    end

endmodule

