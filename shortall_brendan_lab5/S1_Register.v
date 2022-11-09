`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2022 08:11:26 PM
// Design Name: 
// Module Name: S1_Register
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


module S1_Register(
    input clk,
	input rst,
	input [31:0] InstrIn,
	output reg [4:0] S1_ReadSelect1,
	output reg [4:0] S1_ReadSelect2,
	output reg [4:0] S1_WriteSelect,
	output reg S1_WriteEnable,
	output reg [2:0] AluOp, //alu operation select
	output reg [15:0] imm, //immediate value
	output reg data_src    //i type(1) or r type(0)
    );
    
    always @(posedge clk) begin
        if (rst) begin
 			S1_ReadSelect1 <= 5'd0;
			S1_ReadSelect2 <= 5'd0;
			S1_WriteSelect <= 5'd0;
			S1_WriteEnable <= 1'b0;
			AluOp <= 3'b0;
			imm <= 16'b0;
			data_src <= 1'b0;
			end       
        else begin
            data_src <= InstrIn[29];
            AluOp <= InstrIn[28:26];
            S1_WriteSelect <= InstrIn[25:21];
            S1_ReadSelect1 <= InstrIn[20:16];
            S1_ReadSelect2 <= InstrIn[15:11];
            imm <= InstrIn[15:0];
            S1_WriteEnable <= 1'b1; 
        end
   end
endmodule
