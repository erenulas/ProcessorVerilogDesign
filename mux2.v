module mux2(input1,input2,enable,muxout);
input[15:0] input1,input2;
input enable;
output wire[15:0] muxout;

assign muxout=(enable)?input2:input1;
endmodule
