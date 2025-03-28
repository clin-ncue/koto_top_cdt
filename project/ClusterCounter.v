module ClusterCounter( clk, reset, array_in, nturn_out, array_out);

parameter mapsize = 38;
input wire clk;
input wire reset;
input wire [mapsize:0] array_in;

output reg [mapsize:0] array_out = 0;
output reg [5:0] nturn_out;


reg [mapsize:0] array0 = 0;
reg [mapsize:0] array1 = 0;
reg [mapsize:0] array2 = 0;  
reg [mapsize:0] array3 = 0;   
reg [mapsize:0] array4 = 0;
reg [mapsize:0] array5 = 0;  

reg [5:0] nturn = 0;
reg self_reset = 0;
reg send = 0; 
reg joint_start = 0;
reg count_start = 0;
reg A, B, C, D;

always @( posedge clk ) 
begin

	integer i;
	array5 = array4;
	array4 = array3;		
	array3 = array2;
	array2 = array1;
	array1 = array_in;	
	
	if( reset || self_reset )
	begin
		array1 = 0;
		array2 = 0;
		array3 = 0;
		array4 = 0;
		array5 = 0;
		nturn = 0;
		nturn_out = 0;
		self_reset = 0;
		joint_start = 0;
		count_start = 0;
	end

	// joint start
	if(array3==39'b101010101010101010101010101010101010101)
	begin
		joint_start = 1;
	end
	// joint stop
	if(array1==39'b010101010101010101010101010101010101010)
	begin
		joint_start = 0;
	end	
	
	// count start
	if(array5==39'b101010101010101010101010101010101010101)
	begin
		nturn = 0;
		count_start = 1;
	end
	// count stop
	if(array3==39'b010101010101010101010101010101010101010)
	begin
		nturn_out = nturn;	
		count_start = 0;
		self_reset = 1;
	end
	
	// end
	if(array2==39'b010101010101010101010101010101010101010)
	begin
	    joint_start = 0;
	    count_start = 0;
		nturn_out = nturn;
		self_reset = 1;
	end
	
	// joint 
	if(joint_start==1)
	begin
		for(i=1;i<=mapsize-1;i=i+1)
		begin
			// joint adjacent blocks
			if( array1[i]==1'b1 && array2[i+1]==1'b1 )
			begin
				array1[i+1] = 1'b1;
				array2[i] = 1'b1;
			end
			if( array1[i+1]==1'b1 && array2[i]==1'b1 )
			begin
				array1[i] = 1'b1;
				array2[i+1] = 1'b1;
			end		
		end
	end	
	
//		array_out = array2;
	
	if(count_start==1)
	begin
		for(i=1;i<=mapsize-1;i=i+1)
		begin			
			// counting 
			// C D
			// A B		
			A = array3[i]; 
			B = array3[i+1];
			C = array4[i];
			D = array4[i+1];
			// 0 0    1 1 
			// 0 0 or 1 1  (weight = 0)
			// continue
			// 1 0
			// 0 0  (weight = 1)
			if( A == 1'b1 && B == 1'b0 && C == 1'b0 && D == 1'b0)
			begin
				nturn = nturn + 1'b1;
			end
			else if( A == 1'b0 && B == 1'b1 && C == 1'b0 && D == 1'b0)
			begin
				nturn = nturn + 1'b1;
			end	
			else if( A == 1'b0 && B == 1'b0 && C == 1'b1 && D == 1'b0)
			begin
				nturn = nturn + 1'b1;
			end			 
			else if( A == 1'b0 && B == 1'b0 && C == 1'b0 && D == 1'b1)
			begin
				nturn = nturn + 1'b1;
			end	
			else 
			begin
				nturn = nturn;
			end;
			/*		
			// 1 1 
			// 1 0  (weight = -1)
			
			else if( A == 0 && B == 1 && C == 1 && D == 1)
			begin
				nturn = nturn - 1'b1;
			end
			else if( A == 1 && B == 0 && C == 1 && D == 1)
			begin
				nturn = nturn - 1'b1;
			end	
			else if( A == 1 && B == 1 && C == 0 && D == 1)
			begin
				nturn = nturn - 1'b1;
			end			 
			else if( A == 1 && B == 1 && C == 1 && D == 0)
			begin
				nturn = nturn - 1'b1;
			end	
			*/	
			/*
			else
			begin
				nturn = nturn;
			end		
			*/
		end
	end 

	


	// send
	if(array3==39'b101010101010101010101010101010101010101)
	begin
		send = 1;
	end
	if(send)
	begin
		array_out = array3;
	end	
	if(array3==39'b010101010101010101010101010101010101010)
	begin
		send = 0;
	end



end // of always

endmodule