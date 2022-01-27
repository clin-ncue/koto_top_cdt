module my_or( In1, In2, Out );

    input wire [38:0] In1; 
    input wire [38:0] In2;
    
    output reg [38:0] Out;


    always @( In1, In2 ) begin
        if( In1 )
            Out <= In1 || In2;
        else
            Out <= In2;
    end

endmodule