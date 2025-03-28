/* 
   Top CDT Design
   lv1b_pipeline block
   C. Lin, 2018.03.28
   
   2018.04.24 
   - Remove trigger type pipeline from lv1b
   - Add trigger tag control part
   
   2025.03.28
   - Remove pedestal suppression (ps) logic.
   - Expand # of internal triggers from 8 to 16. 
   
*/

module lv1b_pipeline
// const parameter
#( parameter PIPE = 256 
  )
// arguments
(
// input 
  clk               , // system clock
  
  in_live           ,
  in_lv1b_req       ,
  in_int_raw        ,
  in_int_scaled     , 
  in_ext            ,
  in_delta          ,
  
  in_et_raw         ,
  in_veto_raw       ,
  in_nclus          ,
  in_timestamp      , 
   
  delay_lv1         , // delay of lv1
  lv2_full          ,
  
// output
  out_lv1           , // send to ADC via LVDS
  out_lv1_inhibit   , // send signal to inform lv1a blocking plv1 issuing
  out_trig_tag      , // transmit to trigger tag ADC
  lv1_cnt           ,
  lv2_rej_cnt       ,
  out_early_lv1     

);

// input
input wire          clk;

input wire          in_live;
input wire          in_lv1b_req;
input wire  [15 :0] in_int_raw;
input wire  [15 :0] in_int_scaled;
input wire  [3  :0] in_ext;
input wire          in_delta;
input wire  [15 :0] in_et_raw;
input wire  [31 :0] in_veto_raw;
input wire  [3  :0] in_nclus;
input wire  [31 :0] in_timestamp;

input wire  [7  :0] delay_lv1;
input wire          lv2_full;

// output
output reg          out_lv1;
output reg          out_lv1_inhibit;
output reg          out_early_lv1;
output reg  [15 :0] out_trig_tag;
output reg  [19 :0] lv1_cnt;
output reg  [31 :0] lv2_rej_cnt;


// variables 
reg        [PIPE-1:0] pipeline; // for lv1

   //// ps related ////
reg                  is_ps; 
reg          [15: 0] ps_cont;

   //// counter ////
reg          [9 : 0] cnt;
reg          [3 : 0] ps_cont_idx;

   //// tag board ////
reg                  tag_req;
reg         [3   :0] tag_cnt;
reg         [9   :0] tag_id;

   //// //// //// /////
reg                  pre_live;

////////////////////////////////////////////
always @(posedge clk)
begin

  if( in_live == 1'b0 )
     begin
        pipeline = 0;
        
        tag_req = 1'b0; 
        tag_cnt = 0;
        tag_id = 0;
               
        cnt = 0;    
     end
 
  if( pre_live == 1'b0 && in_live == 1'b1 )
     begin
        lv1_cnt = 0;
        lv2_rej_cnt = 0;
     end

   /////////// lv1 pipeline //////////////

   pipeline = pipeline << 1;
   pipeline[0] = 1'b0;
   out_early_lv1 = 1'b0;
   
   if(    in_lv1b_req == 1'b1 
       && (in_int_scaled > 0 || in_ext > 0 || in_delta == 1'b1 ) 
     )
      begin
         if( lv2_full == 1'b1 )
            lv2_rej_cnt = lv2_rej_cnt + 1;
         else
            pipeline[0] = 1'b1;
      end

   if( pipeline[0] == 1'b1 )
      begin
         tag_req = 1'b1;
         tag_cnt = 0;
         out_early_lv1 = 1'b1;
         
         tag_id = cnt;
         cnt = cnt + 1;     
      end
     
   
/* //////////////////////////////////////////////////////////////////////////////////
   Trigger tag board treatment

   Once a lv1 request is obtained, the trigger data will be sequentially sent to 
   trigger tag ADC. Following is the arrangement of the words (16 bits for 1 word):
    
   0: [15: 0] Header 0xeeee
   1: [9 : 0] Event ID based on lv1 counting
   2: [15: 0] ET raw
   3: [15: 0] Veto raw
   4: [15: 0] First 16 bits of the timestamp
   5: [15: 0] Last 16 bits of the timestamp
   6: [7 : 0] Raw trigger bits
      [15: 8] Scaled trigger bits
   7: [3 : 0] n-cluster
      [7 : 4] external trigger type
      [8]     delta trigger
      [9]     pedestal suppression bit // this bit is omitted after 2025.03.28
      
   All the data should be transmitted within 20 clocks (less than the gate requirement).

*/ /////////////////////////////////////////////////////////////////////////////////
   
   out_trig_tag = 16'b0000_0000_0000_0000;
   
   if( tag_req == 1'b1 )
      begin
         
         case ( tag_cnt )
            0: out_trig_tag = 16'b1110_1110_1110_1110;
            1: out_trig_tag = tag_id;
            2: out_trig_tag = in_veto_raw[15: 0];
            3: out_trig_tag = in_veto_raw[31:16];
            4: out_trig_tag = in_timestamp[15: 0];
            5: out_trig_tag = in_timestamp[31:16];
            //
            // 6: out_trig_tag = { in_int_scaled , in_int_raw };
            // (updated after 2025.03.28)
            //
            6: out_trig_tag = in_int_scaled;
            // 
            // 7: out_trig_tag = { 7'b000_0000 ,is_ps ,in_delta ,in_ext ,in_nclus };
            // (updated after 2025.03.28)
            //
            7: out_trig_tag = { 7'b000_0000 ,1'b0 ,in_delta ,in_ext ,in_nclus };
            8: out_trig_tag = in_et_raw;
            9: out_trig_tag = in_int_raw;
            default: out_trig_tag = 16'b0000_0000_0000_0000;
         endcase

         if( tag_cnt == 10 )
            begin
               tag_cnt = 0;
               tag_req = 1'b0;
            end
         else
            tag_cnt = tag_cnt + 1;

      end
   
/* /////////////////////////////////////////////////////////////////////////////////  
   Inhibition rule:
   
   To avoid plv1 overlaid with lv1, an inhibition signal will be sent to lv1a pipeline
   to block plv1 trigger issuing. This signal will last for 8 clocks and start from 
   4 clocks before issuing the lv1.
   
   "4" is the length of the trigger pulse

*/ /////////////////////////////////////////////////////////////////////////////////
   
   out_lv1_inhibit = 1'b0; 
   if( pipeline[ (delay_lv1-4) +: 8] )
      out_lv1_inhibit = 1'b1;     

// send lv1 trigger
   out_lv1 = 1'b0;   
   if( pipeline[delay_lv1] == 1'b1 )
      begin
         out_lv1 = 1'b1;
         lv1_cnt = lv1_cnt + 1;
      end
               
   /////////////////
   /// KEEP LAST ///
   /////////////////

   pre_live = in_live;
   
end

endmodule
