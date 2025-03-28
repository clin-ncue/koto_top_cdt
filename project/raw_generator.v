/* 
   Top CDT Design
   C. Lin, 2018.04.14, ver 1
   
   04.22 modified:
   - Added delta trigger response.  
      
*/

module raw_generator
////////
// Fixed parameter for sending simualted raw data after getting sending align pattern 
#( parameter DELAY_SEND_RAW = 30 
  )
//
(
// input 
  clk               , // system clock
  
  in_live           , // reset
  in_adc_trig       ,
  user_ena          ,
  
  sim_latency       ,

// output 
  out_raw           ,
  
  out_rena          ,
  out_raddr         
);

input wire         clk;

// inputs
input wire         in_live;
input wire         in_adc_trig;
input wire         user_ena;

input wire [8  :0] sim_latency;

// output
output reg [15 :0] out_raw;

output reg         out_rena;
output reg [11 :0] out_raddr;

reg        [8  :0] cnt;
reg        [2  :0] pulse_cnt;

reg                got_pulse;
reg                got_align_trig;
reg                got_delta_trig;

reg        [3  :0] pipeline;

reg                is_align_ptn_send;
reg                is_delta_ptn_send;


always @(posedge clk)
begin
 
   if( in_live == 1'b0 )
      begin
         out_rena = 1'b0;
         out_raddr = 12'b1111_1111_1111;
         cnt = 0;
         pulse_cnt = 0;
         got_pulse = 1'b0;
         got_align_trig = 1'b0;
         got_delta_trig = 1'b0;
         is_align_ptn_send = 1'b0;
         is_delta_ptn_send = 1'b0;
      end

   if( in_live == 1'b1 && user_ena == 1'b1 )
      begin

      out_raw = 0;

/*
   After sending delta function (simulate the response of delta trigger), 
   the simulated raw data written in memory will be readout repeatedly after
   a certain time interval DELAY_SEND_RAW: 30 clocks.
*/     
    
      if( is_delta_ptn_send == 1'b1 )
         begin
            if( cnt < DELAY_SEND_RAW )
               cnt = cnt + 1;
            else if( cnt == DELAY_SEND_RAW )
               begin
                  out_rena = 1'b1;
                  out_raddr = out_raddr + 1;
               end
         end
      
/*
   Simulate the latency for align and delta trigger
*/   

      if( got_align_trig == 1'b1 && is_align_ptn_send == 1'b0 )
         begin
            if( cnt < sim_latency )
               cnt = cnt + 1;
            else if( cnt == sim_latency )
               begin
                  out_raw = 16'b1111_1110_1111_1110;
                  is_align_ptn_send = 1'b1;
                  cnt = 0;
               end
         end
      
      if( got_delta_trig == 1'b1 && is_delta_ptn_send == 1'b0 )
         begin
            if( cnt < sim_latency )
               cnt = cnt + 1;
            else if( cnt == sim_latency )
               begin
                  out_raw = 16'b1111_1110_1111_1110;
                  is_delta_ptn_send = 1'b1;
                  cnt = 0;
               end
         end

/*
   Check trigger pulse.
*/  
      if( got_align_trig == 1'b0 || got_delta_trig == 1'b0 )
         begin

            pipeline = pipeline << 1;
            pipeline[0] = in_adc_trig;

            if( pipeline == 4'b1010 && got_pulse == 1'b0 )
               begin
                  got_pulse = 1'b1;
                  got_align_trig = 1'b1;
               end
      
            if( pipeline == 4'b1001 && got_pulse == 1'b0 )
               begin
                  got_pulse = 1'b1;
                  got_delta_trig = 1'b1;
               end

           if( pulse_cnt == 4 )
               begin
                  pulse_cnt = 0;
                  got_pulse = 1'b0;
               end

           if( got_pulse == 1'b1 )
               pulse_cnt = pulse_cnt + 1;
            

         end


      end  // END of user_ena


end

endmodule