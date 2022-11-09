`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2022 09:04:06 PM
// Design Name: 
// Module Name: S2_Register
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


module S2_Register(
    input clk,
	input rst,
	input [31:0] Reg_ReadData1,    //From Reg entering S2
	input [31:0] Reg_ReadData2,    //From Reg entering S2
	input [4:0] S1_WriteSelect,     //From S1
	input S1_WriteEnable,      //From S1
	input [2:0] S1_AluOp,      //From S1
	input [15:0] S1_imm,       //From S1
	input S1_data_src,         //From S1
	output reg [31:0] S2_ReadData1,    //Leaving S2
	output reg [31:0] S2_ReadData2,    //Leaving S2
	output reg [4:0] S2_WriteSelect,   //Leaving S2
	output reg S2_WriteEnable,         //Leaving S2
	output reg [2:0] S2_AluOp, //alu operation select
	output reg [15:0] S2_imm, //immediate value
	output reg S2_data_src    //i type(1) or r type(0)
    );
    
    always @ (posedge clk) begin
        if (rst) begin
            S2_ReadData1 <= 32'b0;
            S2_ReadData2 <= 32'b0;
            S2_WriteSelect <= 5'b0;
            S2_WriteEnable <= 1'b0;
            S2_AluOp <= 3'b0;
            S2_imm <= 16'b0;
            S2_data_src <= 1'b0;
            end
        else begin
            S2_ReadData1 <= Reg_ReadData1;
            S2_ReadData2 <= Reg_ReadData2;
            S2_WriteSelect <= S1_WriteSelect;
            S2_WriteEnable <= S1_WriteEnable;
            S2_AluOp <= S1_AluOp;
            S2_imm <= S1_imm;
            S2_data_src <= S1_data_src;
            end
    end    
endmodule
