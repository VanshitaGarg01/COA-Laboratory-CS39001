module shift_register_tb;
    reg clk, rst, load;
    parameter N = 32;
    reg [N-1:0] parallel_in;
    wire out;
    integer i;

    shift_register S_REG (.clk(clk), .rst(rst), .load(load), .parallel_in(parallel_in), .out(out));

    initial begin
        clk = 0;
        rst = 1;

        #2
        rst = 0;
        load = 1;
        parallel_in = 32'b10011011000101010000010010101011;

        #1 load = 0;

        #320 $finish;
    end

    initial begin
        for (i = 0; i < N; i++) begin
            #10
            $display("time = %0d, out = %b, expected = %b", $time, out, parallel_in[N-i-1]);
        end
    end

    always begin
        #5 clk = ~clk;
    end
endmodule
