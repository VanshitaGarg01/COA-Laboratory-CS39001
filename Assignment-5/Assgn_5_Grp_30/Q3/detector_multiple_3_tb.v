module detector_multiple_3_tb;
    reg clk, rst, x;
    wire out;
    parameter N = 8;
    reg [N-1:0] inp = 8'b11011001;
    integer i, j;

    detector_multiple_3 DM1 (.out(out), .x(x), .rst(rst), .clk(clk));
    
    initial begin
        clk = 0;
        rst = 1; 
        x = 0;

        #2 rst = 0; 

        for (i = N-1; i >= 0; i--) begin
            #10 x = inp[i]; 
        end

        #10 $finish;   
    end

    initial begin
        #5
        for (j = N-1; j >= 0; j--) begin
            #10
            $display("time = %0d, out = %b", $time, out);
        end
    end

    always begin
        #5 clk = ~clk;
    end

endmodule