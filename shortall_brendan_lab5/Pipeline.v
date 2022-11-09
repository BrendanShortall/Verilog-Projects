`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2022 04:18:43 PM
// Design Name: 
// Module Name: Pipeline
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


module Pipeline(
    input clk,
    input rst,
    input [31:0] InstrIn,
    input S1_WriteEnable,
    output [31:0] Out
    );
    //Wires Leaving S3
    wire [4:0] S3_WriteSelect;
    wire S3_WriteEnable;    
    //Wires leaving S1
    wire [4:0] S1_ReadSelect1;
	wire [4:0] S1_ReadSelect2;
	wire [4:0] S1_WriteSelect;
	wire [2:0] AluOp; 
	wire [15:0] imm; 
	wire data_src;
    S1_Register S1_reg  (.clk(clk), .rst(rst), .InstrIn(InstrIn), .S1_ReadSelect1(S1_ReadSelect1),
                     .S1_ReadSelect2(S1_ReadSelect2), .S1_WriteSelect(S1_WriteSelect), .S1_WriteEnable(S1_WriteEnable),
                     .AluOp(AluOp), .imm(imm), .data_src(data_src));
                     
   //Wires Leaving Reg File
   wire [31:0] Reg_S2_ReadData1;
   wire [31:0] Reg_S2_ReadData2;
   nbit_register_file  reg_file    (.WriteData(Out), .ReadData1(Reg_S2_ReadData1), .ReadData2(Reg_S2_ReadData2),
                                     .ReadSelect1(S1_ReadSelect1),.ReadSelect2(S1_ReadSelect2),.WriteSelect(S3_WriteSelect),
                                     .WriteEnable(S3_WriteEnable), .Reset(rst), .Clk(clk));    
   
   //Wires leaving S2
   wire [31:0] S2_ReadData1;
   wire [31:0] S2_ReadData2;
   wire [4:0] S2_WriteSelect;
   wire S2_WriteEnable;
   wire [2:0] S2_AluOp; 
   wire [15:0] S2_imm; 
   wire S2_data_src;
   S2_Register  S2_reg  (.clk(clk), .rst(rst), .Reg_ReadData1(Reg_S2_ReadData1),
                     .Reg_ReadData2(Reg_S2_ReadData2), .S1_WriteSelect(S1_WriteSelect), .S1_WriteEnable(S1_WriteEnable),
                     .S1_AluOp(AluOp), .S1_imm(imm), .S1_data_src(data_src), .S2_ReadData1(S2_ReadData1), 
                     .S2_ReadData2(S2_ReadData2), .S2_WriteSelect(S2_WriteSelect), .S2_WriteEnable(S2_WriteEnable),
                     .S2_AluOp(S2_AluOp), .S2_imm(S2_imm), .S2_data_src(S2_data_src) );  
                     
   reg [31:0] mux_out;  
   //Mux to select i type or r type                
    always @*  begin
        case(S2_data_src)
            1'b0 : mux_out = S2_ReadData2;
            1'b1 : mux_out = S2_imm;
        endcase  
    end 
   //Compute ALU
   wire [31:0] alu_out;
   Ideal_ALU    alu (.R1(alu_out), .R2(S2_ReadData1), .R3(mux_out), .ALUOp(S2_AluOp));    
   
    //Compute S3
    S3_Register  S3_reg  (.clk(clk), .rst(rst), .alu_out(alu_out), .S2_WriteSelect(S2_WriteSelect), 
                        .S2_WriteEnable(S2_WriteEnable), .out(Out), .S3_WriteSelect(S3_WriteSelect),
                        .S3_WriteEnable(S3_WriteEnable));
   
endmodule
