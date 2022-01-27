/* 
   Top CDT Design
   C. Lin, 2018.03.27, ver 3
  
   04.22 modify raw_cnt reset timing
   - Since run controll would read out "raw_cnt" during live off, it's better
     to keep the number until the moment live comes back.
   
*/

module trig_type_lv1a_ext
(
// input 
  clk               , // system clock
  
  // inputs
  in_ext            ,
  in_live           , 
  in_ena            , 
  in_spill          ,  
  
  // register
  user_ena          ,
  user_spill_on     ,
  user_spill_off    ,
 
  // output
  out_lv1a          , 
  raw_cnt           
              
);

input wire         clk;

// inputs
input wire         in_ext;
input wire         in_live;
input wire         in_ena;
input wire         in_spill;

// reg
input wire         user_ena;
input wire         user_spill_on;  
input wire         user_spill_off; 

// output
output reg         out_lv1a;
output reg [15 :0] raw_cnt;

// variables 
reg                is_trig;
reg                pre_live;

////////////////////////////////////////////
always @(posedge clk)
begin
 
// keep resetting during live off
   if( pre_live == 1'b0 && in_live == 1'b1 )
      begin
         raw_cnt = 0;
      end

// check whether it satisfies any trigger type
   is_trig = 1'b0;
   if(     user_ena == 1'b1 && in_ena == 1'b1
       &&  in_ext == 1'b1
       && (    ( user_spill_on  == 1 && in_spill==1 )
            || ( user_spill_off == 1 && in_spill==0 ) 
          )
     )
      begin
         is_trig = 1'b1;
      end
       
// trigger issuing
   out_lv1a = 1'b0;
   
   if( is_trig == 1 )
      begin
         raw_cnt = raw_cnt + 1;
         out_lv1a = 1'b1;   
      end
      
   pre_live = in_live;
      
end

endmodule