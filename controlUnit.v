module controlunit(opcode,aluselect,isImmediate,writeEnable,readMem,writeMem,jump,push,pop);
	input [3:0] opcode;
	output reg [1:0] aluselect;
	output reg isImmediate,writeEnable,readMem,writeMem,jump,push,pop;
	initial begin
		readMem<=0;
		writeMem<=0;
		aluselect<=2'b00;
		isImmediate<=0;
		writeEnable<=0;
		jump<=0;
		push<=0;
		pop<=0;
	end
	always @(opcode) begin
		if(opcode==4'h0) begin
			jump<=0;
			isImmediate<=0;
			aluselect<=2'b00;
			readMem<=0;
			writeMem<=0;
			writeEnable<=1;
			push<=0;
			pop<=0;
		end else if (opcode==4'h1) begin
			jump<=0;
			aluselect<=2'b00;
			isImmediate<=1;
			readMem<=0;
			writeMem<=0;
			writeEnable<=1;
			push<=0;
			pop<=0;
		end else if (opcode==4'h2) begin
			jump<=0;
			isImmediate<=0;
			aluselect<=2'b01;
			readMem<=0;
			writeMem<=0;
			writeEnable<=1;
			push<=0;
			pop<=0;
		end else if (opcode==4'h3) begin
			jump<=0;
			aluselect<=2'b01;
			isImmediate<=1;
			writeEnable<=1;
			writeMem<=0;
			readMem<=0;
			push<=0;
			pop<=0;
		end else if (opcode==4'h4) begin
			jump<=0;
			isImmediate<=0;
			aluselect<=2'b10;
			writeEnable<=1;
			writeMem<=0;
			readMem<=0;
			push<=0;
			pop<=0;
		end else if (opcode==4'h5) begin
			jump<=0;
			isImmediate<=1;
			aluselect<=2'b10;
			writeEnable<=1;
			writeMem<=0;
			readMem<=0;
			push<=0;
			pop<=0;
		end else if (opcode==4'h6) begin
			writeEnable<=0;
			isImmediate<=0;
			jump<=1;
			aluselect<=2'b11;
			writeMem<=0;
			readMem<=0;
			push<=0;
			pop<=0;
		end else if (opcode==4'h7) begin
			jump<=0;
			isImmediate<=0;
			readMem<=1;
			aluselect<=2'b11;
			writeEnable<=1;
			writeMem<=0;
			push<=0;
			pop<=0;
		end else if (opcode==4'h8) begin
			jump<=0;
			writeMem<=1;
			isImmediate<=0;
			aluselect<=2'b11;
			writeEnable<=0;
			readMem<=0;
			push<=0;
			pop<=0;
		end else if (opcode==4'h9) begin
			jump<=0;
			writeMem<=0;
			isImmediate<=0;
			aluselect<=2'b11;
			writeEnable<=0;
			readMem<=0;
			push<=1;
			pop<=0;
		end else if (opcode==4'ha) begin
			jump<=0;
			writeMem<=0;
			isImmediate<=0;
			aluselect<=2'b11;
			writeEnable<=1;
			readMem<=0;
			push<=0;
			pop<=1;			
		end
	end
endmodule
