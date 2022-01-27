/* 
   Top CDT Design
   trig_type_lv1a block
   C. Lin, 2018.03.27, ver 3
   
   * log
   v1: add switch "AND"."OR"
   v2: remove prescale
   
   04.22 modify raw_cnt reset timing
   - Since run controll would read out "raw_cnt" during live off, it's better
     to keep the number until the moment live comes back.
     
   19.11.24
   - Remove raw trigger count
*/

module trig_type_lv1a
(
// input 
  clk               , // system clock
  
  // inputs
  in_et             , // et input     ( 1  bit  )
  in_veto           , // veto input   ( 16 bits )
  in_live           , // reset signal ( 1  bit  )
  in_ena            , // enable       ( 1  bit  )
  in_spill          , // spill        ( 1  bit  ) 
  
  // register
  user_et           ,
  user_veto         ,
  user_veto_as_trig , 
  user_and_or       ,
  user_ena          ,
  user_spill_on     ,
  user_spill_off    ,
  user_prescale_p   ,
  user_prescale_q   ,
  user_et_thre      ,
 
 
  // output
  out_lv1a_raw      ,
  out_lv1a_scaled   ,
  scaled_cnt                 
              
);

input wire         clk;

// inputs
input wire [16 :0] in_et;
input wire         in_live;
input wire [31 :0] in_veto;
input wire         in_ena;
input wire         in_spill;
input wire [15 :0] user_prescale_p;
input wire [15 :0] user_prescale_q;

// reg
input wire         user_et;
input wire [31 :0] user_veto;
input wire [31 :0] user_veto_as_trig;
input wire         user_and_or;
input wire         user_ena;
input wire         user_spill_on;  
input wire         user_spill_off; 
input wire [15 :0] user_et_thre;

// output
output reg         out_lv1a_raw;
output reg         out_lv1a_scaled;
output reg [31 :0] scaled_cnt;

// variables 
reg                is_trig;
reg        [15 :0] prescale_cnt;
reg                pre_live;

reg                is_et;

////////////////////////////////////////////
always @(posedge clk)
begin

   if( in_live == 1'b0 )
      begin
         prescale_cnt = 0;
      end

   if( pre_live == 1'b0 && in_live == 1'b1 )
      begin
         scaled_cnt = 0;
      end

   is_et = ( in_et[16]==1'b1 && in_et[15:0] > user_et_thre ) ? 1'b1 : 1'b0;
 
// check whether it satisfies any trigger type
   is_trig = 1'b0;
   if(     user_ena == 1'b1 && in_ena == 1'b1
       && (    ( user_spill_on  == 1'b1 && in_spill== 1'b1 )
            || ( user_spill_off == 1'b1 && in_spill== 1'b0 ) 
          )
     )
      begin
   

      if( user_and_or == 1'b1 ) // internal AND
         begin
            if(    (user_et & is_et) == user_et 
                && (user_veto_as_trig & in_veto)== user_veto_as_trig
                && (user_veto & in_veto) == 32'b0
              )
               is_trig = 1'b1;
         end
      else                       // internal OR
        begin
            if( user_et == 1'b1 )
               begin
                  if(    ( is_et==1'b1 || (user_veto_as_trig & in_veto) > 32'b0 )
                      && (user_veto & in_veto) == 32'b0
                    )
                     is_trig = 1'b1;
               end
            else
               begin
                  if(    (user_veto_as_trig & in_veto) > 32'b0 
                      && (user_veto & in_veto) == 32'b0
                    )
                     is_trig = 1'b1;
               end
         end  
   end
       
// trigger issuing
   out_lv1a_raw = 0;
   out_lv1a_scaled = 0;
   
   if( is_trig == 1'b1 )
      begin
         out_lv1a_raw = 1'b1;
         if(  prescale_cnt < user_prescale_p )
            begin
                out_lv1a_scaled = 1'b1;
                scaled_cnt = scaled_cnt + 1;
            end
         
         if( prescale_cnt < user_prescale_q - 1 )
            prescale_cnt = prescale_cnt + 1;
         else
            prescale_cnt = 0;
                   
      end

   pre_live = in_live;

end

endmodule