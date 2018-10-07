
module Fulladder(in_1,in_2,carry,sum);

input wire  in_1 ,in_2; 
output  carry,sum;


assign carry = in_1 &in_2;
assign sum = in_1 ^ in_2;


endmodule 