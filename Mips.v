module clock(clck);

output reg clck;

initial clck=0;

always
begin
#5
clck=~clck;

end

endmodule


module filewrite();

reg[31:0]i;
integer file1;

initial
begin 
file1 =$fopen("D:\ms\examples\monitorinit.txt");

$fmonitor(file1, "%b"  ,i);

for(i=0;i<31;i=i+1)
	begin

	#1
	i=i;
	end

end


endmodule
