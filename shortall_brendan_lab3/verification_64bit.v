`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/05/2022 04:00:40 PM
// Design Name: 
// Module Name: verification_64bit
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


module verification_64bit(a,b,c_in,c_out_verify,sum_verify);
//declare inputs a, b, c_in
input	[63:0]a;
input [63:0]b;
input c_in;
output c_out_verify; 
output [63:0]sum_verify; //declare outputs c_out and sum

assign {c_out_verify, sum_verify} = a + b + c_in;

endmodule

