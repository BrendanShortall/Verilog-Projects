`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/05/2022 06:55:18 PM
// Design Name: 
// Module Name: carry_select_64bit
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


module carry_select_64bit(
    input [63:0]a,
    input [63:0]b, 
    input c_in,
    output wire [63:0]sum, 
    output c_out
    );
//carry wires
wire c_out1_0,c_out1_1; wire [15:0]sum1_0; wire [15:0]sum1_1;   //16b1 outputs
wire c_out2_0,c_out2_1; wire [15:0]sum2_0; wire [15:0]sum2_1;   //16b2 outputs
wire c_out3_0,c_out3_1; wire [15:0]sum3_0; wire [15:0]sum3_1;   //16b3 outputs
wire c_out4_0,c_out4_1; wire [15:0]sum4_0; wire [15:0]sum4_1;   //16b4 outputs
wire c_out1,c_out2,c_out3;
//16b 1
carry_select_16bit   cs_16b10   (a[15:0], b[15:0], 0, sum1_0, c_out1_0); //c_in == 0
carry_select_16bit   cs_16b11   (a[15:0], b[15:0], 1, sum1_1, c_out1_1); //c_in == 1
assign c_out1 = (c_in == 0)? c_out1_0: //mux output connecting 4b1 and 4b2
                             c_out1_1;
assign sum[15:0] = (c_in == 0)? sum1_0: //assign sum value 
                               sum1_1;
//16b 2
carry_select_16bit   cs_16b20   (a[31:16], b[31:16], 0, sum2_0, c_out2_0);
carry_select_16bit   cs_16b21   (a[31:16], b[31:16], 1, sum2_1, c_out2_1);
assign c_out2 = (c_out1 == 0)? c_out2_0: //mux output connecting 4b2 and 4b3
                               c_out2_1;
assign sum[31:16] = (c_out1 == 0)? sum2_0: //assign sum value 
                                 sum2_1;
//16b 3
carry_select_16bit   cs_16b30   (a[47:32], b[47:32], 0, sum3_0, c_out3_0);
carry_select_16bit   cs_16b31   (a[47:32], b[47:32], 1, sum3_1, c_out3_1);
assign c_out3 = (c_out2 == 0)? c_out3_0: //mux output connecting 4b2 and 4b3
                               c_out3_1;
assign sum[47:32] = (c_out2 == 0)? sum3_0: //assign sum value 
                                 sum3_1;
//16b 4
carry_select_16bit   cs_16b40   (a[63:48], b[63:48],  0 , sum4_0, c_out4_0);
carry_select_16bit   cs_16b41   (a[63:48], b[63:48],  1 , sum4_1, c_out4_1);
assign c_out = (c_out3 == 0)? c_out4_0: //mux output connecting 4b2 and 4b3
                              c_out4_1;
assign sum[63:48] = (c_out3 == 0)? sum4_0: //assign sum value 
                                 sum4_1;
endmodule
