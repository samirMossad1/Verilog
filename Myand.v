
module myAndgate(o1,in1,in2);


input in1,in2;
output o1;
assign o1=in1 & in2;


endmodule



module testBench;


reg A,B;
wire C;

initial
begin

$monitor ("in1=%b   in2=%b   o1=%b ",A,B,C);


A=0;
B=0;
#10
A=1;
B=1;
#10

A=1;
B=0;

end


myAndgate a (C,A,B);

endmodule