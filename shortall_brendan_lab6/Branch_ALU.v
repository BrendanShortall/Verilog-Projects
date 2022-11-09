`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/04/2022 12:54:39 PM
// Design Name: 
// Module Name: Branch_ALU
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


module Branch_ALU(
    a,
    b,
	ins,
    out
    );


	 parameter size = 32;
	 
    input [size-1:0] a;
    input [size-1:0] b;
	input [5:0] ins;
    output reg out;
	
	always @(*) begin
		if (ins == 6'b000100) 
		out = (a == b); //beq
		else if (ins == 6'b000101)
		out = ~(a==b); //bne
		else
		out = 0; //dont care		
   end


endmodule
