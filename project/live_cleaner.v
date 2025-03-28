/* 
   Top CDT Design
   C. Lin, 2018.05.29
*/

module live_cleaner
#( parameter MIN_ON_PERIOD  = 437500000 ,
   parameter MIN_OFF_PERIOD = 125000000
  )
///
( 
   clk               , // system clock
   rst               ,
   in_live           ,
   out_live          
);

input  wire         clk;
input  wire         rst;
input  wire         in_live;
output reg          out_live;

reg        [7  :0]  pipeline;
reg        [31 :0]  on_cnt;
reg        [31 :0]  off_cnt;
reg                 ban;

always @(posedge clk)
begin

   if( rst )
      begin
         pipeline = 0;
         on_cnt = 32'hffffffff;
         off_cnt = 32'hffffffff;
         out_live = 1'b0;
         ban = 1'b0;
      end

    pipeline = pipeline << 1;
    pipeline[0] = in_live;   
        
    if( on_cnt < MIN_ON_PERIOD  )
       begin
          on_cnt = on_cnt + 1;
          ban = 1'b1;
       end
    else if( pipeline == 8'b0000_1111 && ban == 1'b0 )
       begin
          on_cnt = 0;
          out_live = 1'b1;
       end
    else
      ban = 1'b0;
       
    if( off_cnt < MIN_OFF_PERIOD )
       begin
          off_cnt = off_cnt + 1;
          ban = 1'b1;
       end
    else if( pipeline == 8'b1111_0000 && ban == 1'b0 )
       begin
          off_cnt = 0;
          out_live = 1'b0;
       end
    else
       ban = 1'b0;
   
end

endmodule