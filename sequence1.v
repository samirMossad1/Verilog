module sequence(i_seq,o_check,i_clock);

input wire i_seq,i_clock;
output reg o_check;

reg[1:0] states;

initial states=2'b00;

always @(posedge i_clock)
	begin

case(states)

2'b00:
      if(i_seq==1'b1)
         	begin
        	 states<=2'b01;
        	o_check<=0;            
         	end

2'b01:
     
      if(i_seq==1'b0)
         	begin
         	states<=2'b10;
         	o_check<=1;            
         	 end
     else
		begin
		states<=2'b01;
		o_check<=0;
		end


2'b10:
  	if(i_seq==1'b0)
         	begin
         	states<=2'b00;
         	o_check<=0;            
          	end
    	 else
		begin
		states<=2'b01;
		o_check<=0;
		end



endcase
	end




endmodule




module clockgene(clock);

output reg clock;


initial clock=0;

always
	begin
	#1
	clock=~clock;
	end

endmodule



module testsequence();

reg i_seq;
wire o_check,i_clock;

sequence s1(i_seq,o_check,i_clock);
clockgene clck(i_clock);

initial
	begin

i_seq=1;
#6
i_seq=0;
#6
i_seq=1;
#6
i_seq=1;
#6
i_seq=0;
#6
i_seq=0;
#6
i_seq=0;
#6
i_seq=1;
#6
i_seq=0;

	end



endmodule


