module AddHeader( clk, rst, ini_val, dv, cnt_out );

	parameter count_length = 47;

    input wire clk, rst;
    input wire [7:0] ini_val; 
     
    output reg [7:0] cnt_out = 0; // count up to 256 ADCs
    output reg dv;
	
	reg [7:0] cnt_data = 0;

    always @( posedge clk ) begin
        if( rst )
			begin
            cnt_data <= 0;
            dv <= 0;
            end
        else
			begin
            cnt_data <= cnt_data + 1;
			if(cnt_data<count_length+1)
				begin
				cnt_out <= cnt_data+ini_val;
				dv <= 1;
				end
				else
				begin
				cnt_out <= 200;
				dv <= 0;
				end
			end
    end

endmodule