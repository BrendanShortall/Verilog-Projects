`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/12/2022 11:43:33 AM
// Design Name: 
// Module Name: Nbit_not
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


module Nbit_not(out,in);
//Define parameter, input, output
parameter n=Nbit_adder_register.n;
input [n-1:0]in;
output [n-1:0]out;
//generate loop counter
genvar i;
//loop
generate
for(i=0;i<n;i=i+1) begin
    not not1 (out[i], in[i]);
end
endgenerate
endmodule
