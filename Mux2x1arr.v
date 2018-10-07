
module Muxarr2x1(in1,in2,out,sel);

input [31:0] in1 ,in2 ;

output [31:0] out;
input sel;


assign out=sel? in2:in1;


endmodule