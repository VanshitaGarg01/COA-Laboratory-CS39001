module mux_tb;
    reg a0, a1, sel;
    wire out;
    mux M1(.a0(a0), .a1(a1), .sel(sel), .out(out));
    initial begin
        $monitor("a0 = %b, a1 = %b, sel = %b, out = %b", a0, a1, sel, out);
        #5 a0 = 1; a1 = 0; sel = 1;
        #5 sel = 0;
        #5 a0 = 1; a1 = 1; sel = 1;
        #5 sel = 0;
        #5 a0 = 0; a1 = 0; sel = 1;
        #5 sel = 0;
        #5 a0 = 0; a1 = 1; sel = 1;
        #5 sel = 0;
        #5 $finish;
    end
endmodule