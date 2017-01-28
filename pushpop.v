module pushpop(input1,push,pop,out);
input[15:0] input1;
input push,pop;
output reg[15:0] out;
	reg[15:0] stack[15:0];
	reg [15:0] addrin,adddrout;
	integer i;
	initial begin
		for(i=0;i<16;i=i+1)
			stack[i] = 16'h0000;
		addrin = 16'h0010;
	end
	always @(push or pop) begin
		if(push) begin
			addrin = addrin - 16'h0001;
			stack[addrin] = input1;
		end if(pop) begin
			out = stack[addrin];
			addrin = addrin + 16'h0001; 
		end
	end
endmodule
