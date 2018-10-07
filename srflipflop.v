module clockk(clck);
output reg clck;
initial clck=0;

always
begin
#1
clck=~clck;
end
endmodule





module srff(q,s,r,reset,enable,clock);

input wire s,r,reset,enable,clock;
output reg q;

always@(posedge clock or posedge reset)
begin

if(reset==1) 
begin
  q<=0;

end

else if ( enable== 1'b0)
begin

if(s==1'b0 && r==1'b1)
begin
q<=0;

end
else if(s==1'b1 && r==1'b0)
begin
q<=1;

end
else if(s==1'b1 && r==1'b1)
begin
q<=1'b0;

end
end
end
endmodule





module testrsff();

reg s,r,reset,enable;
wire q,clock;
srff sr1(q,s,r,reset,enable,clock);


initial
begin
$monitor("s=%b r=%b q=%b reset=%b enable=%b clock=%b",s,r,q,reset,enable,clock);

s=1;
r=0;
reset=0;
enable=0;
#3
s=0;
r=1;
reset=0;
enable=0;
#3
s=1;
r=0;
reset=0;
enable=0;
#3
s=0;
r=1;
reset=0;
enable=0;

end





clockk c1(clock);




endmodule




