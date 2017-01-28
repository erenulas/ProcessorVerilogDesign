module alu (input1, input2, aluselect, dataout);
	input [15:0] input1,input2;
	input [1:0] aluselect;
	output reg[15:0] dataout;
	always @(aluselect)
	begin
	if (aluselect == 2'b00) begin
		assign dataout = input1|input2;
	end else if (aluselect == 2'b01) begin
		assign dataout = input1&input2;
	end else if (aluselect == 2'b10) begin
		assign dataout = input1+input2;
	end
	end
endmodule
