/* 
   C. Lin, 2018.04.21
   
   v2: 2018.05.09 
   Start after reading 18 empty bits
*/

module lvds_cnt_debugger
#( parameter LENGTH = 18 )
///
(
// input 
   clk               , // system clock
   in_lvds           ,
   syst_rst          ,
   user_ena          ,
     
// output
   err_cnt       ,
   
);

input  wire         clk;
input  wire         in_lvds;
input  wire         syst_rst;
input  wire         user_ena;

output reg  [7  :0] err_cnt;

reg                 cnt;
reg         [7  :0] num_cnt;
reg                 got_input;

reg         [17 :0] pipeline;

reg         [15 :0] num1;
reg         [15 :0] num2;
reg                 is_done;
reg                 start;

always @(posedge clk)
begin

   if( syst_rst )
      begin
         err_cnt = 10'b11_1111_1111;
         pipeline = 0;
         num1 = 0;
         num2 = 0;
         num_cnt = 10'b11_1111_1111;
         is_done = 1'b0;
         got_input = 1'b0;
         pipeline = 18'b11_1111_1111_1111_1111;
         start = 1'b0;
      end

   if( pipeline == 18'b00_0000_0000_0000_0000 )
      begin
         start = 1'b1;
      end

   if( user_ena == 1'b1 && is_done == 1'b0 && start == 1'b1 )
      begin
         
         if( got_input == 1'b0 && pipeline[17:16] == 2'b11 )
            begin
               
               num1 = pipeline[15:0];
               
               if( num1 - num2 != 1 )
                  err_cnt = err_cnt + 1; 
               
               num2 = num1;
               num_cnt = num_cnt + 1;
               
               got_input = 1'b1;
               cnt = 0;
               
            end
             
         if( got_input == 1'b1 && cnt < LENGTH )
            cnt = cnt + 1;

         if( cnt == LENGTH )
            got_input = 1'b0;

         if( num_cnt == 250 )
            is_done = 1'b1;
         
      end
      
      pipeline = pipeline << 1;
      pipeline[0] = in_lvds;
      
  
end

endmodule