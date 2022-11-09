`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/12/2022 11:28:38 AM
// Design Name: 
// Module Name: Nbit_adder
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


module Nbit_adder(c_out, sum, a, b, c_in);
//Define parameters, inputs and outputs
parameter n=Nbit_adder_register.n;
input [n-1:0]a;
input [n-1:0]b;
input c_in;
output c_out;
output [n-1:0]sum;
//define carry wire
wire [n:0]carry;
assign carry[0] = c_in;
assign c_out = carry[n];
//generate loop counter
genvar i;
//loop
generate
for(i=0;i<n;i=i+1) begin
    FA_str  adder   (carry[i+1], sum[i],a[i],b[i],carry[i]);
end
endgenerate
endmodule
