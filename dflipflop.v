module clockk(clck);
output reg clck;

initial
clck=0;

always
begin
#1
clck=~clck;
end

endmodule



module dflipflop(q,qbar,i_d,i_clck,i_enable,i_reset);


input wire i_d,i_clck,i_enable,i_reset;
output reg q,qbar;


always@(posedge i_clck or posedge i_reset)
begin

if(i_reset==1'b1) 
begin
q<=1'b0;
qbar<=1'b1;
end
else if(i_enable==1'b0)
begin
q<=i_d;
qbar<=~i_d;
end
end
endmodule



module dfftest();

reg d,enable,reset;
wire clck,q,qbar; 


initial
begin

d=0;
enable=0;
reset=0;

#3

d=1;
enable=0;
reset=0;

#3

d=1;
enable=1;
reset=0;

#3
d=0;
enable=1;
reset=0;
#3
d=1;
enable=0;
reset=1;

end



dflipflop d1(q,qbar,d,clck,enable,reset);
clockk c1(clck);
endmodule



