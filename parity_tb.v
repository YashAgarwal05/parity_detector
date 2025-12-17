module parity_tab();
reg clk,data;
wire [5:0]out;
wire state,newstate;
parity_detector uut(.clk(clk),.data(data),.out(out),.state(state),.newstate(newstate));
initial clk=0;
always #5 clk=~clk;
initial begin
data=0;
#10 data=1;
#10 data=0;
#10 data=1;
#10 data=1;
#10 data=1;
#10 data=1;
#10 data=0;
#10 data=1;
#10 data=0;
#10 data=0;
#10 data=0;
#10 data=1;
#10 data=1;
#10 data=0;
#10 data=1;
#10 data=0;
#10 data=1;
#10 data=1;
#10 data=0;
#10 $finish;
end
endmodule