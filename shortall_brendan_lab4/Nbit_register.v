`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/12/2022 11:21:50 AM
// Design Name: 
// Module Name: Nbit_register
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


module Nbit_register(out,in,clk);
//Set parameter value
parameter n=Nbit_adder_register.n;
//Set inputs/outputs
input [n-1:0] in;
output [n-1:0] out;
input clk;
//Generate loop counter
genvar i;
//Generate loop
generate
for (i = 0; i<n;i=i+1) begin: registerblk
dff     Dflipflop   (out[i],in[i],clk);
end
endgenerate

endmodule
