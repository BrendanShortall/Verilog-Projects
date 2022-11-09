`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/12/2022 12:37:55 PM
// Design Name: 
// Module Name: final_TB
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module final_TB();
parameter n = 4;
reg[n-1:0]a;
reg[n-1:0]b;
reg c_in;
reg select;
reg clk;
wire [n-1:0] out;
wire c_out;

Nbit_adder_register #(n) test (.out(out), .c_out(c_out), .a(a), .b(b), .c_in(c_in), .clk(clk), .select(select));

initial begin
clk = 0;
select = 0;
a = 4'b1011;
b= 4'b0111;
c_in = 0;

#100 select = 1;
end

always #5 clk = ~clk;

endmodule
