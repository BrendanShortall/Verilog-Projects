`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/12/2022 11:39:49 AM
// Design Name: 
// Module Name: Nbit_adder_register
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


module Nbit_ALU(out,c_out,a,b,c_in,clk, select);
//Define parameters,inputs and outputs
parameter n=8;
input [n-1:0]a;
input [n-1:0]b;
input clk;
input c_in;
input [2:0]select; 
output [n-1:0]out;
output c_out;

wire[n-1:0] sum; //adder output
wire [n-1:0] not_out; //not output
wire [n-1:0] sub_out; //sub output
wire [n-1:0] or_out; //or output
wire [n-1:0] and_out; //and output
wire slt_out; //slt output
wire [n-1:0] not_b;
wire[n-1:0] neg_b;
wire c_out_sub;
wire c_out_b;
reg [n-1:0] alu_out; //alu output

//calculate not
Nbit_not notgate (not_out,a);
//calculate adder
Nbit_adder  adder   (c_out, sum, a, b, c_in);
//Calculate or
Nbit_OR orgate  (or_out, a, b);
//Calculate AND
Nbit_AND anddgate (and_out, a, b);
//calculate sub
//Negate B
Nbit_not notb (not_b, b); //flip bits
Nbit_adder negadd (c_out_b, neg_b, 1, not_b, 0); //add one
Nbit_adder sub  (c_out_sub, sub_out, a, neg_b, 0); // add a + (-b)
//calculate SLT
Nbit_slt slt (slt_out, a, b); //a<b out = 1, 0 else
//mux to select alu output
always @* begin
    if (select == 3'b000) //MOV
        alu_out = a;
    else if (select == 3'b001)//NOT
        alu_out = not_out;
    else if (select == 3'b010)//ADD
        alu_out= sum;
    else if (select == 3'b011)//SUB
        alu_out=sub_out;
    else if (select == 3'b100)//OR
        alu_out=or_out;
    else if (select == 3'b101)//AND
        alu_out=and_out;
    else if (select == 3'b110)//SLT
        alu_out=slt_out;
    else
        alu_out=0;
end
//Put ALU output into register
Nbit_register regout (out, alu_out, clk);
endmodule
