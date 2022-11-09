`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/05/2022 12:58:24 PM
// Design Name: 
// Module Name: RCA_64b
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


module RCA_64b(
//64 bit ripple carry adder using 16bit adders
    input [63:0]a,
    input [63:0]b, 
    input c_in,
    output wire [63:0]sum, 
    output c_out
);   
//carry wires
wire c1,c2,c3;
//16bit adders
RCA_16b  sixteenbit1    (a[15:0],b[15:0],c_in,sum[15:0],c1);
RCA_16b  sixteenbit2    (a[31:16],b[31:16],c1,sum[31:16],c2);
RCA_16b  sixteenbit3    (a[47:32],b[47:32],c2,sum[47:32],c3);
RCA_16b  sixteenbit4    (a[63:48],b[63:48],c3,sum[63:48],c_out);
endmodule
