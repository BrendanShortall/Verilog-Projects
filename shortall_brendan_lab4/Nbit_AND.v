`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/13/2022 04:19:06 PM
// Design Name: 
// Module Name: Nbit_AND
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


module Nbit_AND(out,a,b);
//Define parameter, input, output
parameter n=Nbit_ALU.n;
input [n-1:0]a;
input [n-1:0]b;
output [n-1:0]out;
//generate loop counter
genvar i;
//loop
generate
for(i=0;i<n;i=i+1) begin
    and and1 (out[i],a[i],b[i]);
end
endgenerate
endmodule