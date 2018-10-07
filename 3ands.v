
module andgate(o_1,i_1,i_2);

input wire i_1,i_2;
output wire o_1;



assign o_1=i_1 & i_2;

endmodule





module testbench();

reg a,b,c,d;
wire s1,s2,result;

andgate g1(s1,a,b);
andgate g2(s2,c,d);
andgate g3(result,s1,s2);

initial 
begin


a<=0;
b<=1;
c<=1;
d<=1;
$monitor("a=%b b=%b c=%b d=%b s1=%b s2=%b result=%b",a,b,c,d,s1,s2,result);
#5
a=1;
b=1;
c=0;
d=1;
$display("a=%b b=%b s1=%b s2=%b result=%b",a,b,s1,s2,result);

end
endmodule