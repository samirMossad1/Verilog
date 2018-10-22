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

module Alu(in_1,in_2,Aluctrl,zeroflag,Aluout);

input [31:0] in_1,in_2;
input [3:0] Aluctrl;
output reg [31:0] Aluout;
output zeroflag;

parameter 	And=4'h0,
  		Or=4'h1,
		Add=4'h2,
		Minus=4'h6,
		Compare=4'h7,
		Nor=4'h12;
		
		
assign zeroflag=(in_1==in_2)?1:0; 	

always @(in_1 or in_2 or Aluctrl)
begin

case(Aluctrl)

And : Aluout<=in_1 & in_2 ;

Or :  Aluout<=in_1 | in_2 ;

Add : Aluout<=in_1 + in_2 ;

Minus :Aluout<=in_1 - in_2 ;

Compare : Aluout<=(in_1<in_2)?1:0;

Nor :Aluout<=~(in_1 | in_2) ;

endcase

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
/*
/////Alu test//////

reg [31:0] in_1 ,in_2;
reg [3:0]Aluctrl;
wire [31:0]Aluout;
wire zeroflag;


Alu A1(in_1,in_2,Aluctrl,zeroflag,Aluout);

initial
begin 
in_1=32'hffff_ffff;
in_2=32'h0000_0000;
Aluctrl=4'h0;
#5
Aluctrl=4'h1;
#5
Aluctrl=4'h7;
#5
in_1=32'hffff_fffb;
in_2=32'hffff_ffff;

#5
in_1=32'hffff_ffff;
in_2=32'hffff_ffff;

end

*/

endmodule