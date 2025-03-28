/* 
   Top CDT Design
   trig_type_lv1b block
   C. Lin, 2018.03.22, ver 1
   
*/

module trig_type_lv1b
// other variables
(
// input 
  clk               , // system clock
  
  in_live           ,
  in_ena            ,
  in_lv1b_req       , 
  in_lv1a           ,
  in_nclus          , 
  
  // trig_type
  user_nclus        ,
  user_prescale_p   ,
  user_prescale_q   ,
  user_ena          ,
  
  // output
  out_lv1b_raw      ,
  out_lv1b_scaled   ,
  scaled_cnt        
     
);

input wire         clk;

// inputs
input wire         in_live;
input wire         in_ena;
input wire         in_lv1a;
input wire         in_lv1b_req;
input wire [3 :0]  in_nclus;

// register
input wire [9 :0]  user_nclus;
input wire [15:0]  user_prescale_p;
input wire [15:0]  user_prescale_q;
input wire         user_ena;

// output
output reg         out_lv1b_raw;
output reg         out_lv1b_scaled;
output reg [31:0]  scaled_cnt;

reg        [11:0]  prescale_cnt;
reg        [3 :0]  nclus;

reg                pre_live;

reg is_trig;

always @(posedge clk)
begin
 
   if( pre_live == 1'b0 && in_live==1'b1 )
      begin
         scaled_cnt = 0;
         prescale_cnt = 0;
      end

// check whether it satisfies any trigger type
   is_trig = 0;
   
   if( in_nclus > 8 )
      nclus = 9;
   else
      nclus = in_nclus;
   
   if(    in_ena == 1'b1 && user_ena == 1'b1 && in_lv1b_req == 1'b1
       && in_lv1a == 1'b1 && user_nclus[nclus] == 1'b1 
     )
      is_trig = 1;

// trigger issuing
   out_lv1b_raw = 1'b0;
   out_lv1b_scaled = 1'b0;
   
   if( is_trig == 1'b1 )
      begin
         out_lv1b_raw = 1'b1;
         if(  prescale_cnt < user_prescale_p )
             begin
                scaled_cnt = scaled_cnt + 1;
                out_lv1b_scaled = 1'b1;
             end
         
         if( prescale_cnt < user_prescale_q - 1 )
            prescale_cnt = prescale_cnt + 1;
         else
            prescale_cnt = 0;
          
      end
      
   pre_live = in_live;
      
end

endmodule