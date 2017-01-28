module decode(datain,opcode,reg0,src1,src2,jmpaddr,dataaddr);
	input [15:0] datain;
	output [3:0] opcode,reg0,src1,src2;
	output [11:0] jmpaddr;
	output [7:0] dataaddr;
	assign opcode = datain[15:12];
	assign reg0 = datain[11:8];
	assign src1 = datain[7:4];
	assign src2 = datain[3:0];
	assign jmpaddr = datain[11:0];
	assign dataaddr = datain[7:0];
endmodule

