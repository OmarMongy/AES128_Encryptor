module Adder(
    input  [31:0] inp1,
    input  [31:0] inp2,
    output [31:0] sum
    );
    
    assign sum = inp1 + inp2 ;
    
endmodule
