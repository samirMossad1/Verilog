module positivecompare(in_1,in_2,compresult);

input wire [31:0] in_1,in_2;
output wire [31:0] compresult;

parameter Equal=32'h0000_0001
	 , Bigger=32'h0000_0002
	 , Smaller=32'h0000_0003 
	 , unknown=32'h0000_0004 ;

//3amel unknow 3shan law feeh bits floating maslan aw ma7salhaash set yob2a unknow mesh equal

assign compresult= (in_1 > in_2 )? Bigger : (in_1 < in_2 )? Smaller : (in_1 == in_2 )? Equal : unknown;

endmodule






module myAlu(in_1,in_2,in_Mode,Result,overflow,operation);

input wire [31:0] in_1,in_2;
input wire in_Mode;
input wire [2:0] operation;
output wire overflow;
output wire [31:0] Result ;

wire[31:0] in2_complement,compresult;



parameter
    
	Add=3'b000,
	Sub=3'b001,
	Sll_in1=3'b010,
	Srl_in1=3'b011,
	SrA_in1=3'b100,
	Negate_in1=3'b101,
	Compare=3'b110;

positivecompare p1(in_1,in_2,compresult);

assign in2_complement= -in_2; // ~in_2 +1 ;

assign Result= (operation==Add) ? in_1+in_2 : (operation==Sub)? in_1-in_2:(operation==Sll_in1)? in_1<<1:

(operation==Srl_in1)?in_1>>1:(operation==SrA_in1)?in_1>>1:(operation==Negate_in1)? -in_1

:(operation==Compare)? compresult : 1'b0 ;


//3shan ye7sal overflow homa 7alteen bs 
// law ana bagma3 rakameen wel 2 positive we keber 3al limit hatla2y el rakam laf we rege3 we ba2a negative
// aw law ana batra7 rakameen wa7ed menhom saleb ely hwa bagma3 rakameen bel saleb ya3ny el mafrood el yetla3
// rakam saleb laken hatla2eeh laf we ba2a rakam positive fa keda 7asal overflow.



//hena shart el overflow fel plus hwa hwa fel minus A[31]==B[31] Result[31] different bit
// zy el fol le7ad keda bs el moshkela fel minus ! ana asasn A da5la saleba yob2a el msb be 1
// we B da5la mogaba ya3ny el msb 0 fa be keda asasn el condition mesh true
// laken hwa bey3mel el minus bel 2's comp 
// fa ana lama akaren el A[31] akerenha ma3 el 2's Comp beta3 elB[31]
//3shan yob2a akeny ba3mel -(no)+(-no) 3shan ye7sal overflow


assign overflow = ((operation==Add)&&(in_Mode==1'b1)&&(in_1[31]==in_2[31])&& (Result[31]!=in_1[31]))?1'b1:
((operation==Sub)&&(in_Mode==1'b1)&&(in_1[31]==in2_complement[31])&& (Result[31]!=in_1[31]))? 1'b1 : 1'b0;


endmodule









/*
module testbenchAlu();

reg [31:0] in_1,in_2;
reg in_Mode;
wire [31:0]Result;
wire overflow;
reg [2:0] operation;

myAlu A1(in_1,in_2,in_Mode,Result,overflow,operation);

initial
begin

operation=3'b010; //sll

in_1=32'h0000_0001;
in_2=32'h0fff_ffff;
#5
operation=3'b011; //srl
in_1=32'hf0ff_ffff;
#5
operation=3'b100; 

#5
in_1=32'hf000_0000;//srA
#5
operation=3'b101; // Negate
#5
operation=3'b110; // compare
in_1=32'h0000_0001;
in_2=32'h0fff_ffff;
#5
in_2=32'h0000_0001;
in_1=32'h0fff_ffff;
#5     
in_2=32'h0000_0001;
in_1=32'h0000_0001;
#5
in_2=32'h0000_0001;
in_1=32'hx000_0001;


end

endmodule


*/