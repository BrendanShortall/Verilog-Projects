`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/05/2022 07:28:01 PM
// Design Name: 
// Module Name: carry_select_4bit
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


module carry_select_4bit(
    input [3:0]a,
    input [3:0]b, 
    input c_in,
    output wire [3:0]sum, 
    output c_out
    );
//define output wires
wire c_out1_0,c_out1_1,sum1_0,sum1_1;   //FA1 outputs
wire c_out2_0,c_out2_1,sum2_0,sum2_1;   //FA2 outputs
wire c_out3_0,c_out3_1,sum3_0,sum3_1;   //FA3 outputs
wire c_out4_0,c_out4_1,sum4_0,sum4_1;   //FA4 outputs
//FA1 calculations
FA_str      FA1_0   (c_out1_0, sum1_0, a[0],b[0],0);//c_in = 0
FA_str      FA1_1   (c_out1_1, sum1_1, a[0],b[0],1);//c_in = 1
//FA2 Calculations
FA_str      FA2_0   (c_out2_0, sum2_0, a[1], b[1], c_out1_0);
FA_str      FA2_1   (c_out2_1, sum2_1, a[1], b[1], c_out1_1);
//FA3 Calculations
FA_str      FA3_0   (c_out3_0, sum3_0, a[2], b[2], c_out2_0);
FA_str      FA3_1   (c_out3_1, sum3_1, a[2], b[2], c_out2_1);
//FA4 Calculations
FA_str      FA4_0   (c_out4_0, sum4_0, a[3], b[3], c_out3_0);
FA_str      FA4_1   (c_out4_1, sum4_1, a[3], b[3], c_out3_1);
//Assign c_out mux
assign c_out = (c_in == 0) ?    c_out4_0: //if c_in == 0
                                c_out4_1; //else
//Assign sum mux
assign sum = (c_in == 0)    ?   {sum4_0,sum3_0,sum2_0,sum1_0}: //if c_in == 0, sum = sumx_0
                                {sum4_1,sum3_1,sum2_1,sum1_1}; //else sum = sumx_1
endmodule
