
//first module ( Inverter )

module notgate(in1,out1);

input wire in1;
output wire out1;
assign out1=~in1;

endmodule



// second module (And or Inverter )

module AOI(in_A,in_B,in_C,in_D,out);

input wire in_A,in_B,in_C,in_D;
output wire out;

wire in_AB,in_CD;

assign in_AB=in_A & in_B;
assign in_CD=in_C & in_D;
assign out= ~ (in_AB | in_CD);

endmodule



module Mux_main(in_A,in_B,selector,out);

input wire in_A,in_B,selector;
output wire out;
wire selafter,outbefore;

notgate g1(selector,sleafter);

AOI aoi(sleafter,in_A,selector,in_B,outbefore);

notgate g2(outbefore,out);

endmodule


module testbenchofstructuralmux();

reg in1,in2,sel;
wire out1;

Mux_main mux1(in1,in2,sel,out1);


initial 
begin

in1=0;
in2=0;
sel=0;

#5
in1=0;
in2=0;
sel=1;

#5
in1=1;
in2=0;
sel=1;

#5
in1=1;
in2=0;
sel=0;


#5
in1=1;
in2=0;
sel=1;


end



endmodule


// behavioural multiplexer

module behMux(in_1,in_2,selector,out);

input wire in_1,in_2,selector;
output wire out;


assign out=(selector==0)?in_1:in_2;


endmodule

module testbenchbehavmux();

reg in_1,in_2,selector;
wire out;

behMux m1(in_1,in_2,selector,out);

initial 
begin

in_1=0;
in_2=0;
selector=0;
#5
in_1=1;
in_2=0;
selector=0;
#5
in_1=1;
in_2=0;
selector=1;
#5
in_1=0;
in_2=1;
selector=0;

end


endmodule


