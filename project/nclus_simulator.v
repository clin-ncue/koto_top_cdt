/* 
   Top CDT Design
   C. Lin, 2018.04.23
      
   Cluster simulation
*/

module nclus_simulator
#( parameter PIPE = 128 )
(
// input 
  clk               , // system clock
  
  in_live           , 
  in_adc_trig       ,
  user_ena          ,
  user_nwords       ,
  
  sim_latency       ,

// output   
  out_rena          ,
  out_raddr         
);

input wire         clk;

// inputs
input wire         in_live;
input wire         in_adc_trig;
input wire         user_ena;
input wire [3  :0] user_nwords;

input wire [6  :0] sim_latency;

// output
output reg         out_rena;
output reg [11 :0] out_raddr;

reg        [2  :0] pulse_cnt;

reg                got_pulse;
reg                got_plv1_trig;

reg        [PIPE-1:0] pipeline;
reg        [3  :0] iaddr;

always @(posedge clk)
begin
 
   if( in_live == 1'b0 )
      begin
         out_rena = 1'b0;
         out_raddr = 12'b1111_1111_1111;
         pulse_cnt = 0;
         got_pulse = 1'b0;
         got_plv1_trig = 1'b0;
         iaddr = 0;
      end

   if( in_live == 1'b1 && user_ena == 1'b1 )
      begin

        pipeline = pipeline << 1;
        pipeline[0] = in_adc_trig;
        
        if( pipeline[ sim_latency +: 4 ] == 4'b1110 && got_pulse == 1'b0 )
           begin
              got_plv1_trig = 1'b1;
              got_pulse = 1'b1;
              pulse_cnt = 0;
           end
        
        if( got_pulse == 1'b1 )
           begin
              if( pulse_cnt < 3 )
                 pulse_cnt = pulse_cnt + 1;
              else 
                 got_pulse = 1'b0;
           end
        
        out_rena = 1'b0;
         
        if( got_plv1_trig == 1'b1 )
           begin
              if( iaddr < user_nwords )
                 begin
                    out_rena = 1'b1;
                    out_raddr = out_raddr + 1;
                    iaddr = iaddr + 1;
                 end
              else
                 begin
                    out_rena = 1'b0;
                    iaddr = 0;
                    got_plv1_trig = 1'b0;
                 end
           end
 

      end  // END of user_ena


end

endmodule