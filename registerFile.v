module registerFile(wR,writeEnable,clk,datain,output1,output2,reg1,reg2,isImmediate);
	input [3:0] wR,reg1,reg2;
	input writeEnable,clk;
	input [15:0] datain;
	output reg [15:0] output1,output2;
	input isImmediate;
	reg [15:0] register[0:15];
	reg [15:0] extImm;
	integer i;
	initial begin
		for(i=0;i<16;i=i+1)
			register[i] = 16'h0000;

	end
	always @(posedge clk)
	begin
		if(writeEnable) begin
			register[wR] <=datain;
		end
	end
	always @(*)begin
		output1 = register[reg1];
		if (isImmediate==1)
			output2=reg2;
		else
			output2=register[reg2];
	end


endmodule
