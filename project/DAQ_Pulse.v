module DAQ_Pulse(
	clk,
	rst,
	live,
	spill,
	binsize,
	trig,
	
	q
);

input wire clk;
input wire rst;
input wire live;
input wire spill;
input wire [31:0] binsize;
input wire trig;

output reg [31:0] q = 32'b0;

reg [31:0] data;
reg [15:0] nhits = 16'b0;
reg [8:0] nspills = 9'b0;
reg [31:0] counter = 32'b0;
reg [7:0] ibin;

reg live_reg;
reg spill_reg;
reg [1:0] pipe_trig;
reg [1:0] pipe_live;

always @(posedge clk)
begin
	
	if(rst)
	begin
		ibin = 8'b0;
		nspills = 9'b0;
		nhits = 13'b0;
		counter = 32'b0;
	end
	
	pipe_trig = pipe_trig << 1;
	pipe_trig[0] = trig;
	
	pipe_live = pipe_live << 1;
	pipe_live[0] = live;
	
	live_reg = live;
	spill_reg = spill;
	
	if(counter==binsize)
	begin
		q[31:0] = {live_reg,spill_reg,nspills[8:0],ibin[7:0],nhits[12:0]};
		
		nhits = 16'b0;
		counter = 32'b0;
		ibin = ibin + 1'b1;	
	end
	
	nhits = (pipe_trig[0]==1'b1 && pipe_trig[1]==1'b0 && nhits<13'b1111111111110)? nhits + 1'b1 : nhits;
	nspills = (pipe_live[0]==1'b1 && pipe_live[1]==1'b0)? nspills+1'b1 : nspills;
	counter = counter + 1'b1;
end

endmodule




