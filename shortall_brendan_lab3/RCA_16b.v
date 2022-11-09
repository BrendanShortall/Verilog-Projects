`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/05/2022 12:37:54 PM
// Design Name: 
// Module Name: RCA_16b
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


module RCA_16b(
//16 bit ripple carry adder using 4bit adders
    input [15:0]a,
    input [15:0]b, 
    input c_in,
    output wire [15:0]sum, 
    output c_out
);   
//carry wires
wire c1,c2,c3;
//4bit adders
fourbit_FA_str  fourbit1    (a[3:0],b[3:0],c_in,sum[3:0],c1);
fourbit_FA_str  fourbit2    (a[7:4],b[7:4],c1,sum[7:4],c2);
fourbit_FA_str  fourbit3    (a[11:8],b[11:8],c2,sum[11:8],c3);
fourbit_FA_str  fourbit4    (a[15:12],b[15:12],c3,sum[15:12],c_out);

endmodule
