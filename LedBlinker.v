
module LedB(i_s1,i_s2,i_enable,i_clck,o_ledDriver);


input wire i_s1,i_s2,i_enable,i_clck;
output wire o_ledDriver;



parameter ct_100=125;
parameter ct_50=250;
parameter ct_10=1250;
parameter ct_1=12500;


reg [13:0] c_100=0;
reg [13:0] c_50=0;
reg [13:0] c_10=0;
reg [13:0] c_1=0;



reg T_100=1'b0;
reg T_50=1'b0;
reg T_10=1'b0;
reg T_1=1'b0;



reg output_selected ;




always @(posedge i_clck)
begin


 if(c_100==ct_100-1)
  begin
         T_100=!T_100;
         c_100=0;
end
  else
     c_100=c_100+1; 

end



always @(posedge i_clck)
begin


 if(c_50==ct_50-1)
  begin
         T_50=!T_50;
         c_50=0;
end
  else
     c_50=c_50+1; 

end


always @(posedge i_clck)
begin


 if(c_10==ct_10-1)
  begin
         T_10=!T_10;
         c_10=0;
end
  else
     c_10=c_10+1; 

end

always @(posedge i_clck)
begin


 if(c_1==ct_1-1)
  begin
         T_1=!T_1;
         c_1=0;
end
  else
     c_1=c_1+1; 

end




always@(*)
begin
case ({i_s1,i_s2})

2'b00: output_selected = T_100;
2'b01: output_selected = T_50;
2'b10: output_selected = T_10;
2'b11: output_selected = T_1;

endcase

end

assign o_ledDriver=output_selected & i_enable;



endmodule





