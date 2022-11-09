`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/04/2022 07:16:33 PM
// Design Name: 
// Module Name: fourbit_FA_str
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


module fourbit_FA_str(
    input [3:0]a,
    input [3:0]b, 
    input c_in,
    output wire [3:0]sum, 
    output c_out
);   
wire c1,c2,c3;

FA_str  FA1 (c1,sum[0],a[0],b[0],c_in);
FA_str  FA2 (c2,sum[1],a[1],b[1],c1);
FA_str  FA3 (c3,sum[2],a[2],b[2],c2);
FA_str  FA4 (c_out,sum[3],a[3],b[3],c3);

   
   
endmodule
