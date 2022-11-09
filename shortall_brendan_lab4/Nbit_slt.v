`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/13/2022 08:39:08 PM
// Design Name: 
// Module Name: Nbit_slt
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


module Nbit_slt(out, a, b);
//If a < b out = 1 else 0
parameter n=Nbit_ALU.n;
output reg out;
input [n-1:0] a;
input [n-1:0] b;
wire[n-1:0] neg_b;
wire[n-1:0] not_b;
wire c_out_b;
wire c_out_sub;
wire [n-1:0] sub_out;

//Negate B
Nbit_not notb (not_b, b); //flip bits
Nbit_adder negadd (c_out_b, neg_b, 1, not_b, 0); //add one
//a - b
Nbit_adder sub  (c_out_sub, sub_out, a, neg_b, 0); // add a + (-b)

always @* begin
    if (a == b)
        out = 0;
    else if (a[n-1] == 0 & b[n-1] == 0) begin //both positive
        case (sub_out[n-1])
                1'b1 : out = 1; //out neg
                1'b0 : out = 0; //out pos
         endcase
    end else if (a[n-1] == 1 & b[n-1] == 1) begin //both neg
        case (sub_out[n-1])
                1'b1 : out = 1; //out neg
                1'b0 : out = 0; //out pos
         endcase
    end else if (a[n-1] == 0 & b[n-1] == 1) //a pos, b neg
        out = 0;
        else if (a[n-1] == 1 & b[n-1] == 0) //a neg, b pos
        out = 1;
end
endmodule
