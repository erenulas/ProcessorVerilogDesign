module muxReg(input1,input2,writeMem,out);
input[3:0] input1;
input[3:0] input2;
input writeMem;
output wire[3:0] out;

assign out=(writeMem)?input2:input1;
endmodule


