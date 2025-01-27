module mux3(
  input [31:0] inp1, inp2, inp3,
  input [1:0] sel,
  output reg [31:0] out
);
  always@(*)
    begin
      case(sel)
        2'b00 : out = inp1;
        2'b01 : out = inp2;
        2'b10 : out = inp3;
      endcase
    end
  
endmodule  
  
