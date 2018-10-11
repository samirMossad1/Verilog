module circuit(i_Ewcar,i_Nscar,i_clock,o_Ewgreen,o_Nsgreen);

input wire i_Ewcar,i_Nscar,i_clock;
output wire o_Ewgreen,o_Nsgreen;

reg state;


initial state=0;

assign o_Nsgreen=~state;
assign o_Ewgreen=state;


always @(posedge i_clock)
begin

case(state)
1'b0: state<=i_Ewcar;
1'b1: state<=~i_Nscar;
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


module testtraffic();

reg i_Ewcar,i_Nscar;
wire o_Ewgreen,o_Nsgreen,i_clock;


circuit myc(i_Ewcar,i_Nscar,i_clock,o_Ewgreen,o_Nsgreen);
clockgene c(i_clock);

initial
begin
$monitor("i_Ewcar=%b i_Nscar=%b i_clock=%b o_Ewgreen=%b o_Nsgreen=%b",i_Ewcar,i_Nscar,i_clock,o_Ewgreen,o_Nsgreen);

i_Ewcar=1;
i_Nscar=0;
#5
i_Ewcar=0;
i_Nscar=0;
#5
i_Ewcar=0;
i_Nscar=1;
#5
i_Ewcar=0;
i_Nscar=0;

end



endmodule

