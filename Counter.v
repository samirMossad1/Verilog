module clock(clck);

output reg clck;

initial clck=0;

always
begin
#5
clck=~clck;

end

endmodule



module Counter(Q_out,load,clock,clear,up,down,preset);

input clock ,load,clear,up,down;
output [7:0] Q_out;
input [7:0] preset;
reg [7:0] register;

assign Q_out=register;

always@(posedge clock or posedge clear)
begin

if(clear) register<=8'b0;

else if(load) register<=preset;

else if(up) register<=register+1;

else register<=register-1;


end

initial
begin
register=8'hff;
end

endmodule


module testcounter();

reg[7:0] preset;
reg load,clear,up,down;
wire clock;
wire [7:0]Q_out;

Counter counter1(Q_out,load,clock,clear,up,down,preset);
clock clock1(clock);

initial
begin

clear=1;
up=0;
down=0;
#6
clear=0;
up=1;
down=0;
#10
up=0;
down=1;
#5
clear=1;
#5
clear=0;
preset=8'hff;
load=1;






end



endmodule
