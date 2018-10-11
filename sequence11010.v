module sequencedet(i_A,i_clock,o_Z);

input wire i_A,i_clock;
output reg o_Z;

reg [2:0]states;

initial states=3'b000;

always@(posedge i_clock)
begin

//sequence is 11010
case(states)
//a
3'b000:

if(i_A==1'b1)
	begin
	  states<=3'b001;
	  o_Z<=1'b0;
	end




//b
3'b001:

 if(i_A==1'b1)
	begin
	  states<=3'b010;
	  o_Z<=1'b0;
	end
	
else
	begin
	  states<=3'b000;
	  o_Z<=1'b0;
	end


//c
3'b010:

 if(i_A==1'b0)
	begin
	  states<=3'b011;
	  o_Z<=1'b0;
	end

//d
3'b011:

 if(i_A==1'b1)
	begin
	  states<=3'b100;
	  o_Z<=1'b0;
	end

else
	begin
	  states<=3'b000;
	  o_Z<=1'b0;
	end

//e
3'b100:
 if(i_A==1'b0)
	begin
 	 states<=3'b111;
  	o_Z<=1'b1;
	end

else
	begin
	  states<=3'b010;
	  o_Z<=1'b0;
	end

//f
3'b111:

 if(i_A==1'b1)
	begin
  	states<=3'b001;
  	o_Z<=1'b0;
	end

else
	begin
  	states<=3'b000;
  	o_Z<=1'b0;
	end


endcase


end
endmodule






module clockgene(clock);

output reg clock;


initial clock=1'b1;

always
	begin
	#2.5
	clock=~clock;
	end

endmodule



module testseq11010();

reg i_A;
wire o_Z,i_clock;


sequencedet s1(i_A,i_clock,o_Z);
clockgene c1(i_clock);


initial
	begin

 	i_A=1;
	#5
	i_A=1;
	#5
	i_A=1;
	#5
	i_A=0;
	#5
	i_A=0;
	#5
	i_A=1;
	#5
	i_A=1;
	#11
	i_A=0;
	#5
	i_A=1;
	#5
	i_A=0;

	end
endmodule



