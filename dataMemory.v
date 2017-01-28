module dataMemory(address,datain,dataout,load,store,clk);
input [7:0] address;
input [15:0] datain;
input load,store,clk;
output [15:0] dataout;
	reg [9:0] extaddr;	
	reg [15:0] dataMem[9:0];
	integer i;
	initial begin
	for(i=0;i<10;i=i+1)
		 dataMem[i] = 16'h0111;
	assign extaddr = { {2{address[7]}}, address };
	end	
	
	always @(posedge clk) begin
		if (store) begin
			dataMem[extaddr]<= datain;
		end
	end

	assign dataout = dataMem[extaddr];

endmodule
			