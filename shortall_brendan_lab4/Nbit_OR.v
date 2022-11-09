`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/13/2022 04:12:09 PM
// Design Name: 
// Module Name: Nbit_OR
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


module Nbit_OR(out,a,b);
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
    or or1 (out[i],a[i],b[i]);
end
endgenerate
endmodule
