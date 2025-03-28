/* 
   Top CDT Design
   C. Lin
   
   2019.11.15
   - veto bit extension
*/

module trig_type_lv1a_delta
(
// input 
  clk               , // system clock
  
  // inputs
  in_et             , // et input     ( 17 bits )
  in_veto           , // veto input   ( 32 bits )
  in_live           , // reset signal ( 1  bit  )
  in_ena            , // enable       ( 1  bit  )
  
  // register
  user_ena          , 
  delta_et_thre     ,
  delta_veto_ptn    ,
 
  // output
  out_lv1a          , 
  et_raw            ,
  veto_raw          ,
  ndelta            ,
  delay_et          ,
  delay_veto        
   
);

input wire         clk;

// inputs
input wire [16 :0] in_et;
input wire         in_live;
input wire [31 :0] in_veto;
input wire         in_ena;

// reg
input wire         user_ena;
input wire [15 :0] delta_et_thre;
input wire [31 :0] delta_veto_ptn;

// output
output reg         out_lv1a;
output reg [15 :0] et_raw;
output reg [31 :0] veto_raw;
output reg [15 :0] ndelta;
output reg [8  :0] delay_et;
output reg [8  :0] delay_veto;

// variables 
reg                is_trig;
reg                ena;

reg                pre_live;

reg        [16 :0] et_raw_tmp0;
reg        [16 :0] et_raw_tmp1;
reg        [16 :0] et_raw_tmp2;

reg        [31 :0] veto_raw_tmp0;
reg        [31 :0] veto_raw_tmp1;
reg        [31 :0] veto_raw_tmp2;

reg                got_et;
reg                got_veto;

reg        [8  :0] tmp_delay_et;
reg        [8  :0] tmp_delay_veto;

reg                is_send;

reg        [8  :0] cnt; 

////////////////////////////////////////////
always @(posedge clk)
begin
 
// keep resetting during live off
   if( in_live == 1'b0 )
      begin
         ena = 1'b0;
         
         et_raw_tmp0 = 17'b0;
         et_raw_tmp1 = 17'b0;
         et_raw_tmp2 = 17'b0;
         
         veto_raw_tmp0 = 32'b0;
         veto_raw_tmp1 = 32'b0;
         veto_raw_tmp2 = 32'b0;
         
         is_send = 1'b0;
         cnt = 0;
      end

   if( pre_live == 1'b0 && in_live == 1'b1 )
      begin
         et_raw = 0;
         veto_raw = 0;
         ndelta = 0;
         delay_et = 0;
         delay_veto = 0;
      end

   et_raw_tmp2 = et_raw_tmp1;
   et_raw_tmp1 = et_raw_tmp0;
   et_raw_tmp0 = in_et;
   
   veto_raw_tmp2 = veto_raw_tmp1;
   veto_raw_tmp1 = veto_raw_tmp0;
   veto_raw_tmp0 = in_veto;  

// check whether it satisfies any trigger type
   is_trig = 1'b0;
   got_et = 1'b0;
   got_veto = 1'b0;
   
   if( in_ena == 1'b1 )
      begin
   
      //// ET delta pattern
      if( delta_et_thre==0 
          || ( et_raw_tmp2 == 17'b0_0000_0000_0000_0000
            && et_raw_tmp1[16] == 1'b1
            && et_raw_tmp1[15:0] > delta_et_thre
            && et_raw_tmp0 == 17'b0_0000_0000_0000 )
        )
         begin
            got_et = 1'b1;
            tmp_delay_et = cnt;
            et_raw = et_raw_tmp1[15:0];
         end
      
      //// VETO delta pattern
      if ( veto_raw_tmp2 == 32'b0000_0000_0000_0000_0000_0000_0000_0000
          && (veto_raw_tmp1 & delta_veto_ptn) == delta_veto_ptn
          && veto_raw_tmp0 == 32'b0000_0000_0000_0000_0000_0000_0000_0000
        )
         begin
            got_veto = 1'b1;
            tmp_delay_veto = cnt;
            veto_raw = veto_raw_tmp1[31:0];
         end
         
      if( got_et == 1'b1 && got_veto == 1'b1 )
         begin
            ndelta = ndelta + 1;
            
            if( user_ena == 1'b1 )
               begin
                  is_trig = 1'b1;
               end  
         end
      
      if( cnt < 510 )
         cnt = cnt + 1;
       
   // trigger issuing
      out_lv1a = 1'b0;
      if( is_trig == 1 && is_send == 1'b0 )
         begin
            out_lv1a = 1'b1;   
            is_send = 1'b1;
            delay_et = tmp_delay_et;
            delay_veto = tmp_delay_veto;
         end

   end

   /////////////////
   /// KEEP LAST ///
   /////////////////

   pre_live = in_live;

end

endmodule