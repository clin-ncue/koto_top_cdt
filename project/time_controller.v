/* 
   Top CDT Design
   time_controller block
   C. Lin, 2018.03.27, ver 3
   
   - 2018.04.22 bug fixed: 
     The et & veto alignment pattern is identical as the delta trigger and thus the timing will be aligned again.
     Now the pattern recognition part will be disabled once it was seized. 
     
     Modified the SPILL_ON_TIME = 12501500, after issuing delta trigger 500 clocks later
 
   - 2018.05.14 ver 4
     Use delta trigger to align.
     
   - 2019.11.14 ver 5
     Extend veto bits from 16 to 32. 
 
*/


/*
   status_xxxx: means for monitoring the status of system
                it can only be reset when live is off.

*/

module time_controller
#( parameter DELAY_ALIGN_TRIG = 12500000 ,
   parameter MAX_LOCAL_ALIGN_TIME = 12500500 ,
   parameter MAX_GET_DC_ERR_TIME = 12501000 ,
   parameter MAX_GLOBAL_ALIGN_TIME = 12501500 ,
   parameter SPILL_ON_TIME  = 12502000 ,
   parameter SPILL_OFF_TIME = 350000000 
 )
// other variables
(
  clk               , // system clock
  
  // input
  in_live           , // live input ( 1  bit )
  in_et             , // 17-bits et ( 16-bits raw + 1-bit is_et )
  in_veto0          , // 16-bits veto
  in_veto1          ,
  tlk_err           ,
  dc_err            ,
  
  // register
  delay_raw         , 
  delta_et_thre     ,
  delta_veto_ptn    ,
  
  spill_off_time    ,
  
  bypass_local_align_err,
  bypass_global_align_err,
 
  // output
  status_tlk_err    ,
  status_local_align_err  ,
  status_global_align_err ,
  status_dc_err     ,
  
  status_delay_et_align_ptn ,
  status_delay_veto0_align_ptn ,
  status_delay_veto1_align_ptn ,
  
  status_delay_et_delta_ptn ,
  status_delay_veto0_delta_ptn ,
  status_delay_veto1_delta_ptn ,
  
  out_adc           , // trigger line to adc
  out_veto          , // veto output
  out_et            ,  
  out_spill         , // spill-on or not (for other blocks)
  out_ena_trig      ,
  out_ena_delta     , 
  timestamp      
 
);

input wire         clk;

// input
input wire         in_live;
input wire [16 :0] in_et;
input wire [15 :0] in_veto0;
input wire [15 :0] in_veto1;    

input wire         tlk_err;
input wire         dc_err;

// register
input wire [8  :0] delay_raw;
input wire [15 :0] delta_et_thre;
input wire [31 :0] delta_veto_ptn;
input wire [31 :0] spill_off_time;

input wire         bypass_local_align_err;
input wire         bypass_global_align_err;

// output
output reg         status_tlk_err;
output reg         status_local_align_err;
output reg         status_dc_err;
output reg         status_global_align_err;

output reg [8  :0] status_delay_et_align_ptn;
output reg [8  :0] status_delay_veto0_align_ptn;
output reg [8  :0] status_delay_veto1_align_ptn;

output reg [8  :0] status_delay_et_delta_ptn;
output reg [8  :0] status_delay_veto0_delta_ptn;
output reg [8  :0] status_delay_veto1_delta_ptn;

output reg         out_adc;
output reg         out_spill;

output reg [31: 0] out_veto;
output reg [16: 0] out_et;

output reg         out_ena_trig;
output reg         out_ena_delta;

output reg [31 :0] timestamp;  

// internal variable
reg                pre_live;
reg                spill_on;

reg        [9  :0] et_cnt;
reg        [9  :0] veto_cnt;

reg        [16 :0] et_tmp0;
reg        [16 :0] et_tmp1;
reg        [16 :0] et_tmp2;

reg        [15 :0] veto0_tmp0;
reg        [15 :0] veto0_tmp1;
reg        [15 :0] veto0_tmp2;

reg        [15 :0] veto1_tmp0;
reg        [15 :0] veto1_tmp1;
reg        [15 :0] veto1_tmp2;

reg        [8  :0] align_trig_cnt;
reg        [8  :0] delta_trig_cnt;

reg                rena_et;
reg                rena_veto0;
reg                rena_veto1;

reg        [8:  0] raddr_start_et;
reg        [8:  0] raddr_start_veto0;
reg        [8:  0] raddr_start_veto1;

reg        [8  :0] delay_et;

reg                is_get_et_0xfefe;
reg                is_get_veto0_0xfefe;
reg                is_get_veto1_0xfefe;

reg                is_et_align;
reg                is_veto0_align;
reg                is_veto1_align;

reg                is_bad_spill;


// include
reg        [8  :0] raddr_et;
reg        [8  :0] raddr_veto0;
reg        [8  :0] raddr_veto1;

reg        [8  :0] waddr_et;
reg        [8  :0] waddr_veto0;
reg        [8  :0] waddr_veto1;

wire       [16 :0] q_wire_et;
wire       [15 :0] q_wire_veto0;
wire       [15 :0] q_wire_veto1;

et_raw_mem _etmem(clk,in_et,raddr_et,waddr_et,1'b1,q_wire_et);
//veto32_mem _vetomem(clk,in_veto,raddr_veto,waddr_veto,1'b1,q_wire_veto);

raw_mem    _veto0mem(clk,in_veto0,raddr_veto0,waddr_veto0,1'b1,q_wire_veto0);
raw_mem    _veto1mem(clk,in_veto1,raddr_veto1,waddr_veto1,1'b1,q_wire_veto1);

always @(posedge clk)
begin

   ////////////////////////////////////
   // keep resetting during live off //
   ////////////////////////////////////

   if( in_live == 1'b0 )
      begin
         status_tlk_err = 1'b0;
         status_local_align_err = 1'b0;
         status_global_align_err = 1'b0; 
         status_dc_err = 1'b0;
           
         status_delay_et_align_ptn = 0;
         status_delay_veto0_align_ptn = 0;
         status_delay_veto1_align_ptn = 0;
         
         status_delay_et_delta_ptn = 0;
         status_delay_veto0_delta_ptn = 0;
         status_delay_veto1_delta_ptn = 0;
         
         is_bad_spill = 1'b0;
         is_get_et_0xfefe = 1'b0;
         is_get_veto0_0xfefe = 1'b0;
         is_get_veto1_0xfefe = 1'b0;
         
         is_et_align = 1'b0;
         is_veto0_align = 1'b0;
         is_veto1_align = 1'b0;
         
         out_ena_delta = 1'b0; 
         out_ena_trig = 1'b0;  
         
         out_spill = 1'b0;
         
         rena_et = 1'b0;
         rena_veto0 = 1'b0;
         rena_veto1 = 1'b0;
         
         waddr_et = 1;
         waddr_veto0 = 1;
         waddr_veto1 = 1;
         
         raddr_et = 0;
         raddr_veto0 = 0;
         raddr_veto1 = 0;
         
         et_tmp0 = 0;
         et_tmp1 = 0;
         et_tmp2 = 0;
         
         veto0_tmp0 = 0;
         veto0_tmp1 = 0;
         veto0_tmp2 = 0;
         
         veto1_tmp0 = 0;
         veto1_tmp1 = 0;
         veto1_tmp2 = 0;
         
         align_trig_cnt = 9'b1_1111_1111;
         delta_trig_cnt = 9'b1_1111_1111;
         
         timestamp = 0;
      end

   ///////////////////////////////
   ///// keep initialization /////
   ///////////////////////////////

   out_et = 0;
   out_veto = 0;
   
   out_adc = 1'b0;

   if( in_live == 1'b1 )
      begin 
         timestamp = timestamp + 1'b1;
   
         et_tmp2 = et_tmp1;
         et_tmp1 = et_tmp0;
         et_tmp0 = 17'b0_0000_0000_0000_0000;
   
         veto0_tmp2 = veto0_tmp1;
         veto0_tmp1 = veto0_tmp0;
         veto0_tmp0 = 16'b0000_0000_0000_0000;
         
         veto1_tmp2 = veto1_tmp1;
         veto1_tmp1 = veto1_tmp0;
         veto1_tmp0 = 16'b0000_0000_0000_0000;
         
         waddr_et    = waddr_et   + 1'b1;
         waddr_veto0 = waddr_veto0 + 1'b1;
         waddr_veto1 = waddr_veto1 + 1'b1;
         
      end
           
/* //////////////////////////////////////////////////////////////////////////////
    After lasting live on for 0.1 sec, start checking TLK error bits. 
    If there is error, disable all trigger function! 

    If not, alignment trigger : 1010 will be issued, align_cnt starts to count!
    (align_cnt starts from 0)

*/ //////////////////////////////////////////////////////////////////////////////
  
   if( timestamp == DELAY_ALIGN_TRIG )
      begin
         if( tlk_err == 1'b0 )
            begin
               align_trig_cnt = 0;
               out_adc = 1'b1;
            end
         else
            begin
                // get TLK error!!! //
                //// disable everything ///
                status_tlk_err = 1'b1;
                is_bad_spill = 1'b1;
            end
      end
      
   if( align_trig_cnt == 2 )
      out_adc = 1'b1;   

/* //////////////////////////////////////////////////////////////////////////////
    After sending alignment trigger, alignment pattern 0x0000 - 0xfefe - 0x0000
    ET & veto will be aligned accordingly.  
    
*/ //////////////////////////////////////////////////////////////////////////////

   ////////////////////////////
   /// pattern recongnition ///
   ////////////////////////////
     
   if( is_bad_spill == 1'b0 && 
      (is_get_et_0xfefe == 1'b0 || is_get_veto0_0xfefe == 1'b0 || is_get_veto1_0xfefe ==1'b0 ) 
      )
      begin
   
         //// ET ////
         et_tmp0 = in_et;
         if(    et_tmp0 == 17'b0_0000_0000_0000_0000
             && et_tmp1 == 17'b1_1111_1110_1111_1110
             && et_tmp2 == 17'b0_0000_0000_0000_0000 )
            begin
                status_delay_et_align_ptn = align_trig_cnt;
                is_get_et_0xfefe = 1'b1;
            end
   
         //// VETO 0 ////    
         veto0_tmp0 = in_veto0;
         if(    veto0_tmp0 == 16'b0000_0000_0000_0000
             && veto0_tmp1 == 16'b1111_1110_1111_1110
             && veto0_tmp2 == 16'b0000_0000_0000_0000 )
            begin
               status_delay_veto0_align_ptn = align_trig_cnt;
               is_get_veto0_0xfefe = 1'b1;
            end  

         veto1_tmp0 = in_veto1;
         if(    veto1_tmp0 == 16'b0000_0000_0000_0000
             && veto1_tmp1 == 16'b1111_1110_1111_1110
             && veto1_tmp2 == 16'b0000_0000_0000_0000 )
            begin
               status_delay_veto1_align_ptn = align_trig_cnt;
               is_get_veto1_0xfefe = 1'b1;
            end  

      end

   /////////////////////////////////////////////////////////////////
   /// protection: if top CDT did not receive alignment pattern  ///
   ///             within 500 clocks, report an error.           ///
   /////////////////////////////////////////////////////////////////
    
   if(     timestamp == MAX_LOCAL_ALIGN_TIME 
       &&( is_get_et_0xfefe == 1'b0 || is_get_veto0_0xfefe == 1'b0 || is_get_veto1_0xfefe == 1'b0 ) 
     ) 
      begin
         status_local_align_err = 1'b1;
         is_bad_spill =  (bypass_local_align_err) ? 1'b0 : 1'b1;
      end

/* //////////////////////////////////////////////////////////////////////////////
    DC error should be received within 1000 clocks after sending an alignment 
    trigger. (MAX_GET_DC_ERR_TIME = 12501000)
    
    if there is no DC error, a delta trigger will be issued.
    delta trigger: 1001
    
    
*/ //////////////////////////////////////////////////////////////////////////////

   if(    timestamp == MAX_GET_DC_ERR_TIME )
      begin
         if( dc_err == 1'b1 )
            begin
               status_dc_err = 1'b1;
               is_bad_spill = (bypass_local_align_err) ? 1'b0 : 1'b1;
            end
         else
            begin
               status_dc_err = 1'b0;
               out_ena_trig = 1'b0;
               out_ena_delta = 1'b1;
               out_adc = 1'b1;
               delta_trig_cnt = 0;
            end
      end

   if( delta_trig_cnt == 3 )
      out_adc = 1'b1;

/* //////////////////////////////////////////////////////////////////////////////
    After sending delta trigger
    ET and veto will be aligned accordingly.  
   
*/ //////////////////////////////////////////////////////////////////////////////

   ////////////////////////////
   /// pattern recongnition ///
   ////////////////////////////
   
   if(      is_bad_spill == 1'b0 
       && ( is_et_align == 1'b0 || is_veto0_align == 1'b0 || is_veto1_align == 1'b0  ) 
       && is_get_et_0xfefe == 1'b1 
       && is_get_veto0_0xfefe == 1'b1
       && is_get_veto1_0xfefe == 1'b1 
       && timestamp >  MAX_GET_DC_ERR_TIME 
     )
      begin
   
         //// ET ////     
         et_tmp0 = in_et;
         if(    et_tmp0 == 17'b0_0000_0000_0000_0000
             && et_tmp1[16] == 1'b1
             && et_tmp1[15:0] > delta_et_thre
             && et_tmp2 == 17'b0_0000_0000_0000_0000 )
            begin
                raddr_start_et = waddr_et - 3;
                status_delay_et_delta_ptn = delta_trig_cnt;
                is_et_align = 1'b1;
            end
   
         //// VETO 0 //// 
         veto0_tmp0 = in_veto0;
         if(    veto0_tmp0 == 16'b0000_0000_0000_0000
             && (veto0_tmp1 & delta_veto_ptn[15:0]) == delta_veto_ptn[15:0]
             && veto0_tmp2 == 16'b0000_0000_0000_0000 )
            begin
               raddr_start_veto0 = waddr_veto0 - 3;
               status_delay_veto0_delta_ptn = delta_trig_cnt;
               is_veto0_align = 1'b1;
            end  


         //// VETO 1 //// 
         veto1_tmp0 = in_veto1;
         if(    veto1_tmp0 == 16'b0000_0000_0000_0000
             && (veto1_tmp1 & delta_veto_ptn[31:16]) == delta_veto_ptn[31:16]
             && veto1_tmp2 == 16'b0000_0000_0000_0000 )
            begin
               raddr_start_veto1 = waddr_veto1 - 3;
               status_delay_veto1_delta_ptn = delta_trig_cnt;
               is_veto1_align = 1'b1;
            end 
      end

   /////////////////////////////////////////////////////////////////
   /// protection: if top CDT did not receive alignment pattern  ///
   ///             within 500 clocks, report an error.           ///
   /////////////////////////////////////////////////////////////////
    
   if(     timestamp == MAX_GLOBAL_ALIGN_TIME 
       &&( is_et_align == 1'b0 || is_veto0_align == 1'b0 || is_veto1_align == 1'b0 ) 
     ) 
      begin
         status_global_align_err = 1'b1;
         if( bypass_global_align_err == 1'b0 )
            begin
               is_bad_spill = 1'b1;
            end
      end

/* //////////////////////////////////////////////////////////////////////////////
    Spill ON is always at SPILL_ON_TIME  = 12501500.
    Top CDT will enable all trigger decision blocks if no error.
    
    Spill OFF is always at SPILL_OFF_TIME = 350000000.
    
    
*/ //////////////////////////////////////////////////////////////////////////////

   if( timestamp == SPILL_ON_TIME && is_bad_spill == 1'b0 )
      begin
         out_spill = 1'b1;
         out_ena_trig = 1'b1;
      end

   if( timestamp == spill_off_time && is_bad_spill == 1'b0 )
      begin
         out_spill = 1'b0;
      end

/* //////////////////////////////////////////////////////////////////////////////
    Read aligned ET & veto from memory!
 
*/ //////////////////////////////////////////////////////////////////////////////

   if( delta_trig_cnt == delay_raw )
      begin
         rena_et = 1'b1;
         rena_veto0 = 1'b1;
         rena_veto1 = 1'b1;
          
         raddr_et    = raddr_start_et;
         raddr_veto0 = raddr_start_veto0;
         raddr_veto1 = raddr_start_veto1; 
      end

   if( rena_et==1'b1 )
      begin
         out_et   = q_wire_et;
         raddr_et = raddr_et + 1'b1;
      end

   if( rena_veto0==1'b1 )
      begin
         out_veto[15:0] = q_wire_veto0;
         raddr_veto0 = raddr_veto0 + 1'b1;
      end

   if( rena_veto1==1'b1 )
      begin
         out_veto[31:16] = q_wire_veto1;
         raddr_veto1 = raddr_veto1 + 1'b1;
      end

   ///////////////////
   //// KEEP LAST ////
   ///////////////////
   
   if( align_trig_cnt < 510 )
      align_trig_cnt = align_trig_cnt + 1;
       
   if( delta_trig_cnt < 510 )
      delta_trig_cnt = delta_trig_cnt + 1;
       
end

endmodule