`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/07/2022 02:57:43 PM
// Design Name: 
// Module Name: carry_select_16bit
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


module carry_select_16bit(
    //define inputs and outputs
    input [15:0]a,
    input [15:0]b, 
    input c_in,
    output wire [15:0]sum, 
    output c_out
    );
//carry wires
wire c_out1_0,c_out1_1; wire [3:0]sum1_0; wire [3:0]sum1_1;   //4b1 outputs
wire c_out2_0,c_out2_1; wire [3:0]sum2_0; wire [3:0]sum2_1;   //4b2 outputs
wire c_out3_0,c_out3_1; wire [3:0]sum3_0; wire [3:0]sum3_1;   //4b3 outputs
wire c_out4_0,c_out4_1; wire [3:0]sum4_0; wire [3:0]sum4_1;   //4b4 outputs
wire c_out1,c_out2,c_out3;
//4b 1
carry_select_4bit   cs_4b10   (a[3:0], b[3:0], 0, sum1_0, c_out1_0); //c_in == 0
carry_select_4bit   cs_4b11   (a[3:0], b[3:0], 1, sum1_1, c_out1_1); //c_in == 1
assign c_out1 = (c_in == 0)? c_out1_0: //mux output connecting 4b1 and 4b2
                             c_out1_1;
assign sum[3:0] = (c_in == 0)? sum1_0: //assign sum value 
                               sum1_1;
//4b 2
carry_select_4bit   cs_4b20   (a[7:4], b[7:4], 0, sum2_0, c_out2_0);
carry_select_4bit   cs_4b21   (a[7:4], b[7:4], 1, sum2_1, c_out2_1);
assign c_out2 = (c_out1 == 0)? c_out2_0: //mux output connecting 4b2 and 4b3
                               c_out2_1;
assign sum[7:4] = (c_out1 == 0)? sum2_0: //assign sum value 
                                 sum2_1;
//4b 3
carry_select_4bit   cs_4b30   (a[11:8], b[11:8], 0, sum3_0, c_out3_0);
carry_select_4bit   cs_4b31   (a[11:8], b[11:8], 1, sum3_1, c_out3_1);
assign c_out3 = (c_out2 == 0)? c_out3_0: //mux output connecting 4b3 and 4b4
                               c_out3_1;
assign sum[11:8] = (c_out2 == 0)? sum3_0: //assign sum value 
                                 sum3_1;
//4b 4
carry_select_4bit   cs_4b40   (a[15:12], b[15:12],  0 , sum4_0, c_out4_0);
carry_select_4bit   cs_4b41   (a[15:12], b[15:12],  1 , sum4_1, c_out4_1);
assign c_out = (c_out3 == 0)? c_out4_0: //mux output connecting 4b4 and c_out
                              c_out4_1;
assign sum[15:12] = (c_out3 == 0)? sum4_0: //assign sum value 
                                 sum4_1;
endmodule
