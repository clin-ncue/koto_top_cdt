/* 
   Top CDT Design
   trig_type_lv1b block
   C. Lin, 2018.03.22, ver 1
   
*/

module et_err_sim_trig
#( parameter NEVENTS = 2048
  )
//
(
// input 
  clk               , // system clock
  
  // inputs after alignment and judgement of et
  in_live           , // reset
  user_ena            , 
  trig_to_adc       ,
  
  out_rena          ,
  out_raddr         
);

input wire         clk;

// inputs
input wire         in_live;
input wire         user_ena;
input wire         trig_to_adc;

// output
output reg         out_rena;
output reg [11 :0] out_raddr;

//
reg                is_tlk_err_issued;
reg                is_dc_err_issued;
reg        [11 :0] cnt;
reg        [1  :0] iheader;
reg        [2  :0] header_word;

reg                got_trig_pulse;
reg                got_align_trig;

always @(posedge clk)
begin
 
   if( in_live == 1'b0 )
      begin
         out_rena = 1'b0;
         cnt = 0;
         is_tlk_err_issued = 1'b0;
         is_dc_err_issued = 1'b0;
         iheader = 3;
         header_word = 0;
         got_trig_pulse = 1'b0;
         got_align_trig = 1'b0;
      end
   
   if( user_ena == 1'b1 && in_live == 1'b1 )
      begin
      
         if( iheader == 3 && got_trig_pulse == 1'b1 )
            begin
               if( header_word == 3'b010 )
                  got_align_trig = 1'b1;
               else
                  got_align_trig = 1'b0;
                  
               got_trig_pulse = 1'b0;
            end
      
         if( is_dc_err_issued == 1'b0 && got_align_trig == 1'b1 )
            begin
               if( cnt < NEVENTS + NEVENTS )
                  begin
                     out_rena = 1'b1;
                     out_raddr = cnt;
                     cnt = cnt + 1;
                  end
                  
               if( cnt == 0 )
                  begin
                     out_rena = 1'b0;
                     is_dc_err_issued = 1'b1;
                  end
            end
            
      
         if( iheader < 3 )
           begin
              header_word[iheader] = trig_to_adc;    
              iheader = iheader + 1;
           end
      
         if( cnt < NEVENTS && is_tlk_err_issued == 1'b0 )
            begin
               out_rena = 1'b1;
               out_raddr = cnt;
               cnt = cnt + 1;              
            end
         else if( cnt == NEVENTS && is_tlk_err_issued == 1'b0 )
            begin
               is_tlk_err_issued = 1'b1;
               out_rena = 1'b0;
            end
         else if(    trig_to_adc == 1'b1 && got_trig_pulse == 1'b0 
                  && is_tlk_err_issued == 1'b1 )
            begin
               got_trig_pulse = 1'b1;
               iheader = 0;
            end
       
      end
      
end

endmodule