module pc (addr,clk,jmp,out);
	input [11:0] addr;
	input clk,jmp;
	output reg [15:0]out;
	reg [15:0] keepaddr;
	reg [15:0] signext;
	integer i;
	initial begin
		out=16'hffff;
		assign signext = { {4{addr[11]}}, addr };
	end
	always @(posedge clk) begin
		if(jmp==0) begin
			out=out+16'h0001;
		end else begin
			out=out+signext;
		
		end
	end
endmodule
