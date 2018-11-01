//clock module for the sequential part of the circuit

module clock(clck);

output reg clck;
initial clck=0;

always
begin
	#2
	clck=~clck;
end

endmodule



//Fsm module

module fsm(start,out_1,out_2,clock,reset);

//output are register due to syntax , as we can't use them inside an always block so they must be reg
output reg out_1,out_2;
input wire start,reset,clock;

//need 2bits at least to define 3 states
reg[1:0] state;

//defining the 3 states
parameter Idle=2'b00 ,
 	  G1=2'b01  ,
	  G2=2'b10;	


//next state logic circuit
always @(posedge clock or posedge reset)
begin


if(reset) state<=Idle;

else
begin

case(state)

Idle: if(start==1) state<=G1;
G1 :  state<=G2;
G2 :  state<=Idle;


endcase 

end
end

//output logic

always @(state)
begin


case(state)

G1: out_1<=1; 
G2: begin out_2<=1 ;  out_1<=0 ; end
default: begin out_1<=0; out_2<=0; end
	 

endcase
end


endmodule





module testfsm();

reg start,reset;
wire out_1,out_2,clock;

fsm f1(start,out_1,out_2,clock,reset);
clock c1(clock);

initial
begin
reset=0;
start=1;
#40

reset=1;
start=0;



end






endmodule