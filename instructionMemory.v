module instructionMemory(address,data);
input [15:0] address;
output [15:0] data;
	reg [15:0] instructionMem[15:0];
	assign data = instructionMem[address];
	initial begin
		$readmemh("verilog_instructions.hex",instructionMem);
	end
endmodule
