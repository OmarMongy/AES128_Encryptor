module ALU_Decoder(
    input  [2:0] funct3,
    input   funct7,
    input  [1:0] ALUOp,
    input  op, 
    output reg [2:0] ALUControl 
    );
    
    always @(*) begin
        ALUControl = 3'b001;
           
        case(ALUOp)      
          2'b00: ALUControl = 3'b000 ;
          2'b01: ALUControl = 3'b001 ;
          2'b10: begin
                 case(funct3)                
                   3'b000: begin
                           if({op,funct7} == 2'b11) 
                             ALUControl = 3'b001 ;     
                           else
                             ALUControl = 3'b000;
                           end
                   3'b010: ALUControl = 3'b101 ;   
                   3'b110: ALUControl = 3'b010 ;    
                   3'b111: ALUControl = 3'b011 ;    
                 default : ALUControl = 3'b001 ; 
                 endcase 
                 end  
        default : ALUControl = 3'b001;
        endcase
            end
       
   endmodule
