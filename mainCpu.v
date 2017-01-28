`include "instructionMemory.v"
`include "decode.v"
`include "controlUnit.v"
`include "alu.v"
`include "registerFile.v"
`include "pc.v"
`include "muxReg.v"
`include "mux2.v"
`include "dataMemory.v"
`include "pushpop.v"

module mainCpu;
	wire[15:0] outaddress,regOut1,regOut2;
	wire [15:0] registerIn,memout;
	wire [11:0] jmpaddr;
	reg clk;
	wire[15:0] data,muxout1,muxout2,popout;
	wire [3:0] opcode,reg0,src1,src2,muxsrc1out,muxreg0;
	wire [1:0] aluselect;
	wire [7:0] dataaddr;
	wire isImmediate,writeEnable,writeMem,jmp,readMem,push,pop;
	initial begin
		clk=0;
	end
	always begin
		 #1 clk = 1;
		#99 clk = 0;
	end
	pc p(jmpaddr,clk,jmp,outaddress);
	instructionMemory i(outaddress,data);
	decode d(data,opcode,reg0,src1,src2,jmpaddr,dataaddr);
	controlunit cu(opcode,aluselect,isImmediate,writeEnable,readMem,writeMem,jmp,push,pop);
	muxReg muxsrc1(src1,reg0,writeMem,muxsrc1out);
	muxReg muxr0(reg0,src2,pop,muxreg0);
	registerFile rf(muxreg0,writeEnable,clk,muxout2,regOut1,regOut2,muxsrc1out,src2,isImmediate);
	pushpop pp(regOut2,push,pop,popout);
	dataMemory m (dataaddr,regOut1,memout,readMem,writeMem,clk);
	alu a(regOut1, regOut2, aluselect, registerIn);
	mux2 mux(registerIn,memout,readMem,muxout1);
	mux2 mux1(muxout1,popout,pop,muxout2);
	
endmodule

