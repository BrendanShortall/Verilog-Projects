`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/07/2022 03:37:43 PM
// Design Name: 
// Module Name: carry_select_64b_TB
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


module carry_select_64b_TB();
//INPUTS
reg [63:0]a;
reg [63:0]b;
reg c_in;
reg clk;
//OUTPUTS
wire [63:0]sum;
wire c_out;
wire c_out_verify;
wire [63:0]sum_verify;
wire error_flag;
//64 bit carry select adder
carry_select_64bit     CS1    (.a(a),.b(b),.c_in(c_in),.sum(sum),.c_out(c_out));
// Compute Verification 
verification_64bit  verify  (.a(a), .b(b), .c_in(c_in), .c_out_verify(c_out_verify), .sum_verify(sum_verify));

// Assign Error_flag
assign error_flag = (c_out != c_out_verify || sum != sum_verify);
	
	// Verification logic
always@(posedge clk)
	begin
	if(error_flag)
		// Use $display here instead of $monitor
		// $monitor will display the message whenever there's a change of a, b, c_in
		// $display will only display once when it's been executed
		$display("Error occurs when a = %d, b = %d, c_in = %d\n", a, b, c_in);
	end
//declare clk
always #5 clk = ~clk;

initial begin
clk = 0;
//force carry out
a = 64'd100;
b = 64'hFFFFFFFFFFFFFFFF;
c_in = 1'b0;

#20
//generate random large numbers
a[63:32] = $random;
b[63:32] = $random;
#20
//generate random small numbers
a=$urandom%100;
b=$urandom%100;
//generate random numbers
#20
a[31:0] = $random;
a[63:32] = $random;
b[31:0] = $random;
b[63:32] = $random;
end
endmodule
