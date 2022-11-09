`timescale 1ns / 1ns

module ALU_control(
	 input [5:0] instruction,
	 input [1:0] ALUOp,
	 output reg [2:0] func
    );

 always @(*) begin
	if (ALUOp == 2'b00) begin  //R-type
		if (instruction == 6'h20) 
		func = 3'd0; //add
		else if (instruction == 6'h22)
		func = 3'd1; //sub
		else if (instruction == 6'h24)
		func = 3'd2; //and
		else if (instruction == 6'h25)
		func = 3'd3; //or
		else if (instruction == 6'h27)
		func = 3'd4; //nor
		else if (instruction == 6'h2a)
		func = 3'd5; //slt
		else
		func = 3'd7;
	end else if (ALUOp == 2'b01) //Branch
	    func=3'd6; //raise zero flag
	    else if (ALUOp == 2'b10) begin //SW/LW
		func = 3'd0;
	end else begin //i type (aluop == 11)
		func = 3'd0; //addi
	end
   end


endmodule
