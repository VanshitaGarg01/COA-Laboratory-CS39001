module barrel_shifter_tb;
    reg  dir;
    reg [2:0] shamt;
    reg [7:0] in;
    wire [7:0] out;
    
    barrel_shifter BS1(.in(in), .shamt(shamt), .dir(dir), .out(out));
    
    initial begin
        $monitor("time = %0d, shamt = %b, dir = %b, in = %b, out = %b", $time, shamt, dir, in, out);
        
        in = 8'b01011101; dir = 1'b1; shamt = 3'b101;

        #5 dir = 1'b0;

        #5 $finish;

    end
endmodule