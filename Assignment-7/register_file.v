module register_file (
//     input [4:0] reg1,
//     input [4:0] reg2,
//     input RegWrite,
//     input write_reg,
//     input [31:0] write_data,
//     input clk,
//     input rst,
//     output reg [31:0] read_data_1,
//     output reg [31:0] read_data_2
// );

//     reg [31:0] reg_array[31:0];
//     // wire write_reg;
//     integer i;

//     parameter ra = 31;

//     // mux_4_1 MUX1 (.a0(reg1), .a1(reg2), .a2(ra), .a3(1'b0), .sel(RegDst), .out(write_reg));

//     always @(posedge clk or posedge rst) begin
//         if (rst) begin
//             for (i = 0; i < 32; i++)
//                 reg_array[i] <= 0;
//         end else if (RegWrite) begin
//             reg_array[write_reg] <= write_data;
//         end
//     end

//     always @(*) begin
//         read_data_1 = reg_array[reg1];
//         read_data_2 = reg_array[reg2];
//     end

endmodule