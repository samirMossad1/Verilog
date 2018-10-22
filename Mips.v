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


module registerFile(data1,data2,Writedata,Readpath1,Readpath2,Writepath,RegWrite,clock);

output[31:0] data1,data2;
input [31:0] Writedata;
input RegWrite,clock;
input [4:0] Writepath,Readpath1,Readpath2;
reg [31:0] register[0:31]; 

initial
begin
$readmemb("D:\ms\examples\monitorinit.txt",register);
end


assign data1=register[Readpath1];
assign data2=register[Readpath2];

always @(posedge clock)
begin

if(RegWrite==1'b1)
	begin
	register[Writepath]<=Writedata;
	end

end


endmodule

module testmips();

/*
/////Register File test/////

wire [31:0] data1,data2;
reg [31:0] Writedata;
reg RegWrite;
wire clock;
reg [4:0] Writepath,Readpath1,Readpath2;
 

clock c1 (clock);
registerFile r1(data1,data2,Writedata,Readpath1,Readpath2,Writepath,RegWrite,clock);


initial
begin
$monitor("data1=%h data2=%h",data1,data2);
RegWrite=0;
Writepath=0;
Readpath1=0;
Readpath2=0;
 
#4
RegWrite=1;
Writepath=6;
Writedata=32'hffff_ffff;

#2
Writepath=10;
Writedata=32'hffff_aaaa;

#4
Readpath1=6;
Readpath2=10;

end
*/

endmodule