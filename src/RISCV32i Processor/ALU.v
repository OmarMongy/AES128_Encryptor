module ALU(
    input  [31:0] inp1, inp2,
    input  [2:0]  sel,
    output reg [31:0] out,
    output zero_flag
    );
    
    always @(*) begin
        case(sel)
            3'b000: out = inp1 + inp2 ;           // add (lw , sw)
            3'b001: out = inp1 - inp2 ;           // sub (beq)
            3'b010: out = inp1 & inp2 ;           // and
            3'b011: out = inp1 | inp2 ;           // or
            3'b101: out = (inp1 < inp2) ? 32'd1 : 32'd0 ; //slt      
            default: out = 32'b0 ;     
        endcase
    end 
    
assign zero_flag = out == 32'd0;
    
endmodule

