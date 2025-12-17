module parity_detector(input clk,data, 
output reg state,newstate,output reg [5:0] out);
parameter A=0 , B=1;
initial begin
state=A;
newstate=A;
out=0;
end
always@(*)begin
    case(state)
        A:newstate<=data?B:A;
        B:newstate<=data?A:B;
        endcase
         
end
always@(posedge clk)begin
    state<=newstate;
      if(state^newstate)
         out<=out+1;
end
endmodule
        
