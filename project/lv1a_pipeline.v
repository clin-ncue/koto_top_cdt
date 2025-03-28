/* //////////////////////////////////////////////////////////////////////////////////////////////////
   Top CDT Design
   lv1a_pipeline block
   C. Lin, 2018.03.22
   
   2018.04.23
   - 8 internal trigger types, 4 external trigger lines, 1 delta trigger
   - Add timestamp, et_raw, veto_raw inputs for the pipeline 
     (for trigger tag board)
   
   2018.04.24
   - Remove "delay_plv1", which could be adjusted by "delay_raw" in time control block
   - Reduce pipeline down to 256 bits 
   - Reset statistics variables at the moment live comes back since the statistics data will be 
     readout during live off.
   - Add raw #clus distribution monitoring 
   - Add clus loop error:
     A "nclus_tag" memory block was used to check if the event was ever written in.
   - Add lv1b request signal ("out_lv1b_req") to lv1b type, which is the timing to read all the 
     output from lv1a pipeline block. 
     
   2025.03.27
   - Extend # of internal trigger from 8 to 16. 
   
*/ //////////////////////////////////////////////////////////////////////////////////////////////////

module lv1a_pipeline
// const parameter
#( parameter PIPE = 256 ,
   parameter GATE = 20  
  )
// arguments
(
// input 
  clk               , // system clock
  
  in_live           ,
  in_int_lv1a       ,
  in_ext_lv1a       ,
  in_delta_lv1a     ,
  
  in_nclus          , // from OFC
  in_timestamp      ,
  in_et_raw         ,
  in_veto_raw       ,
  
  in_lv1_inhibit    , // expecting time to issue lv1
  
  delay_lv1b_req    , // delay of lv1a to lv1b type block
  ena               ,
  
// output
  out_int_lv1a      ,
  out_ext_lv1a      ,
  out_delta_lv1a    ,

  out_nclus         , // 4 bits
  out_timestamp     ,
  out_et_raw        ,
  out_veto_raw      ,
  out_lv1b_req      ,
  
  out_plv1          , // output to trigger line

  lv1a_rej_cnt      ,
  lv1a_cnt          ,

  clus_err          ,
  clus_time_err     ,
  clus_delta_err    ,
  delay_plv1  


);

   ///////////
   // input //
   ///////////

input wire           clk;

input wire           in_live;

    //// trigger type inputs ////
input wire  [15  :0] in_int_lv1a;
input wire  [3   :0] in_ext_lv1a;
input wire           in_delta_lv1a;
input wire           ena;

    //// raw inputs ////
input wire  [15  :0] in_nclus;
input wire  [15  :0] in_et_raw;
input wire  [31  :0] in_veto_raw;
input wire  [31  :0] in_timestamp;

    //// inhibtion signal from lv1b pipeline
input wire           in_lv1_inhibit;

    //// user register
input wire  [7   :0] delay_lv1b_req;

   ////////////
   // output //
   ////////////
 
    //// trigger type outputs ////
output reg  [15  :0] out_int_lv1a;
output reg  [3   :0] out_ext_lv1a;
output reg           out_delta_lv1a;

    //// raw outputs ////
output reg  [3   :0] out_nclus;
output reg  [15  :0] out_et_raw;
output reg  [31  :0] out_veto_raw;
output reg  [31  :0] out_timestamp;

    //// to lv1b type ////
output reg           out_lv1b_req;

    //// trigger line ////
output reg           out_plv1;

    //// statistics ////
output reg  [31  :0] lv1a_rej_cnt;
output reg  [31  :0] lv1a_cnt;

    //// monitoring ////
output reg           clus_err;
output reg           clus_time_err;
output reg           clus_delta_err;
output reg  [8   :0] delay_plv1; 

   ////////////////
   // variables  //
   ////////////////

reg        [PIPE-1:0] pipeline;

reg        [9   :0]   in_plv1_cnt;
reg        [9   :0]   out_plv1_cnt;

reg                   pre_live;

reg        [1023:0]   tag;
reg        [8   :0]   cnt_delta;
reg                   get_first_clus;

/////////////////////////////////////////////////////////////////////////////////////////
/// function include
reg  [3 :0] nclus;
reg  [15:0] et_raw;
reg  [31:0] veto_raw;
reg  [31:0] trig_raw;
reg  [31:0] time_raw;

wire [3 :0] q_nclus;
wire [15:0] q_et;
wire [31:0] q_veto;
wire [31:0] q_trig;
wire [31:0] q_time;

reg  [9 :0] raddr;
reg         rden;
reg  [9 :0] waddr_nclus;
reg  [9 :0] waddr_raw;
reg         wena_nclus;
reg         wena_raw;

nclus_mem     _nclusmem ( clk ,nclus     ,raddr ,rden ,waddr_nclus ,wena_nclus ,q_nclus );
raw_mem_pipe  _etmem    ( clk ,et_raw    ,raddr ,rden ,waddr_raw   ,wena_raw   ,q_et    );
time_mem      _trigmem  ( clk ,trig_raw  ,raddr ,rden ,waddr_raw   ,wena_raw   ,q_trig  );
time_mem      _timemem  ( clk ,time_raw  ,raddr ,rden ,waddr_raw   ,wena_raw   ,q_time  );
time_mem      _vetomem  ( clk ,veto_raw  ,raddr ,rden ,waddr_raw   ,wena_raw   ,q_veto  );

///////////////////////////////////////////////////////////////////////////////////////////

always @(posedge clk)
begin


/// parameter resetting during live off ///
  if( in_live == 1'b0 )
     begin

        //// memory vars ////
		wena_nclus = 1'b0;
		wena_raw = 1'b0;
		
		//// internal variables ///
		in_plv1_cnt = 0;
		out_plv1_cnt = 0;
		pipeline = 0;
		
		tag = 0;
		delay_plv1 = 511;
	    cnt_delta = 511;
	   
	    get_first_clus = 1'b0;
	    
     end


/// statistics data reset at the moment live is on
   if( pre_live == 1'b0 && in_live == 1'b1 )
      begin
      
         //// clus moniroting ////
		 clus_err = 1'b0;
		 clus_time_err = 1'b0;
		 clus_delta_err = 1'b0;
      
         //// statistics ////
         lv1a_rej_cnt = 0;
         lv1a_cnt = 0;    
                    
      end

/*  ///////////////////////////////////////////////
   Memory writing:

   ******************************************************************************************
   **   NOTICE                                                                             **
   ******************************************************************************************
   **   All the event ID is counted based on pre-lv1, which is the "raddr" of the memory.  **
   **   The counter is reset when live is off.                                             **
   **   The ID of the first event is "0".                                                  **
   ******************************************************************************************
 
   (i) ncluster (from OFC)
 
       ///////////////////////////////////////////////////////
       ///  input format                                   ///
       ///  -- [9 : 0] ID                                  ///
       ///  -- [13:10] nclus                               ///
       ///  -- [15]    Validity (1: valid, 0: error)       ///
       ///////////////////////////////////////////////////////

   (ii) et_raw[15:0], veto_raw[15:0], timestamp[31:0], 
        trig: [7:0] lv1a, [11:8] ext [12] delta [15:13] empty

        "addr" is based on pre-lv1.
        
   
   Nclus monitoring system:
   - "nclus_tag" is implemented to identify whether the corresponding #clus based on pre-lv1 
     was obtained or not.
      * 1 : New data from OFC
      * 0 : Old data (did not refresh yet after reading it out previously) 
  
*//////////////////////////////////////////////////////////////

   /// Only when receving the valid cluster info, the memory writing is enabled.

   if( ena == 1'b1 && in_nclus[15] == 1'b1 )
      begin
		 wena_nclus  = 1'b1;
         waddr_nclus = in_nclus[9:0];
         tag[waddr_nclus] = 1'b1;
         nclus       = in_nclus[13:10];    
                  
         if( get_first_clus == 1'b0 )
            begin
               if( waddr_nclus != 0 )
                  clus_delta_err = 1'b1;
               
               get_first_clus = 1'b1;
               delay_plv1 = cnt_delta;
            end
         else
            begin
               if( pipeline[delay_plv1]==0 )
                  clus_time_err = 1'b1;
            end
             
      end 
   else
      begin
		 wena_nclus = 1'b0;
      end

    

/* ////////////////////////////////////////////////////////////////
    lv1a pipeline 
  
    Make judgement whether there is any lv1a request.
    Two possible refusion toward the request:
    
    (i)  Gate requirement
         - The 2nd trigger cannot come too close to the 1st one.
           It is driven by the parameter "GATE" = 20;

    (ii) Lv1 inhibition
         - If the time to issue the pre-lv1 is overlaid with lv1. 
           Lv1 has a higher priority 
         - The inhibition info is given from lv1b pipeline
         
*/ //////////////////////////////////////////////////////////////////

   pipeline = pipeline << 1;
   pipeline[0] = 1'b0;
   
   wena_raw = 1'b0;   
   
   if( in_int_lv1a > 0 || in_ext_lv1a > 0 || in_delta_lv1a == 1'b1 )
      begin
      
         if( pipeline[GATE-1:0] == 0 && in_lv1_inhibit == 1'b0 )
            begin
               lv1a_cnt = lv1a_cnt + 1;
               pipeline[0] = 1'b1;         
               
               ///// writing raw info in memory /////
               waddr_raw = in_plv1_cnt;
               wena_raw = 1'b1;
               et_raw = in_et_raw[15:0];
               veto_raw = in_veto_raw;
               trig_raw = { 11'h000 , in_delta_lv1a , in_ext_lv1a , in_int_lv1a };
               time_raw = in_timestamp;
             
            end
         else 
            lv1a_rej_cnt = lv1a_rej_cnt + 1;
      
      end

   //// add the counter after writing the memory ////
   if( pipeline[1] == 1'b1 )
      in_plv1_cnt = in_plv1_cnt + 1;

/* ///////////////////////
   plv1 issuing block
*/ ///////////////////////
   
   out_plv1 = 0;
   if( pipeline[2:0] > 0 )
      out_plv1 = 1;

/* ///////////////////////////////////////////////////////////////////////////
    Ready to send the trigger result to lv1b type block
    All of the variables were readout from memory (same latency).
    
    "out_lv1b_req", a one-clock signal to lv1b, is driven by "delay_lv1b_req"
    
*/ ////////////////////////////////////////////////////////////////////////////
 
   rden = 1'b0;
 
   if( pipeline[delay_lv1b_req-4 +: 4] > 0 )
      begin
         rden = 1'b1;
         raddr = out_plv1_cnt;
         
         out_nclus      = q_nclus;
         out_et_raw     = q_et;
         out_veto_raw   = q_veto;
         out_timestamp  = q_time;
         out_int_lv1a   = q_trig[15:0];
         out_ext_lv1a   = q_trig[19:16];
         out_delta_lv1a = q_trig[20];                      
      end

   out_lv1b_req = 1'b0;
   
   if( pipeline[delay_lv1b_req] == 1'b1 )
      begin
         out_lv1b_req = 1'b1;
         if( tag[raddr] == 1'b0 )
            clus_err = 1'b1;
            
         tag[raddr] = 1'b0;
         out_plv1_cnt = out_plv1_cnt + 1;           
      end  
  
  
   /////// calculate delay plv1 /////// 
   if( cnt_delta < 510 )
      cnt_delta = cnt_delta + 1;
   
   if( in_delta_lv1a == 1'b1 )
      cnt_delta = 0;
  
  
   /////////////////
   /// KEEP LAST ///      
   /////////////////
   
   pre_live = in_live; 
           
end

endmodule
