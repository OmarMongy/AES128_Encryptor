`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2023 03:08:55 PM
// Design Name: 
// Module Name: Main_Decoder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module Main_Decoder(
  input zero,
  input [6:0] op,
  output PCSrc,
  output reg [1:0] ResultSrc,
  output reg MemWrite,
  output reg ALUSrc,
  output reg [1:0] immSrc,
  output reg RegWrite,
  output reg [1:0] ALUOp
  );
  
  reg Branch, jump;
  
  always@(*) begin
         
         RegWrite = 1'b0;
         immSrc = 2'b00;
         ALUSrc = 1'b0;
         MemWrite = 1'b0;
         ResultSrc = 2'b00;
         Branch = 1'b0;
         ALUOp = 2'b00;
         jump = 1'b0;
         
  case(op)
    7'b0000011: begin
         RegWrite = 1'b1;
         immSrc = 2'b00;
         ALUSrc = 1'b1;
         MemWrite = 1'b0;
         ResultSrc = 2'b01;
         Branch = 1'b0;
         ALUOp = 2'b00;
         jump = 1'b0;
    end
    
    7'b0100011: begin
         RegWrite = 1'b0;
         immSrc = 2'b01;
         ALUSrc = 1'b1;
         MemWrite = 1'b1;
         ResultSrc = 2'bxx;
         Branch = 1'b0;
         ALUOp = 2'b00;
         jump = 1'b0;
    end
    
    7'b0110011: begin
         RegWrite = 1'b1;
         immSrc = 2'bxx;
         ALUSrc = 1'b0;
         MemWrite = 1'b0;
         ResultSrc = 2'b00;
         Branch = 1'b0;
         ALUOp = 2'b10;
         jump = 1'b0;
    end
    
    7'b1100011: begin
         RegWrite = 1'b0;
         immSrc = 2'b10;
         ALUSrc = 1'b0;
         MemWrite = 1'b0;
         ResultSrc = 2'bxx;
         Branch = 1'b1;
         ALUOp = 2'b01;
         jump = 1'b0;
    end
    7'b0010011: begin
         RegWrite = 1'b1;
         immSrc = 2'b00;
         ALUSrc = 1'b1;
         MemWrite = 1'b0;
         ResultSrc = 2'b00;
         Branch = 1'b0;
         ALUOp = 2'b10;
         jump = 1'b0;
    end
    
    7'b1101111: begin
         RegWrite = 1'b1;
         immSrc = 2'b11;
         ALUSrc = 1'bx;
         MemWrite = 1'b0;
         ResultSrc = 2'b10;
         Branch = 1'b0;
         ALUOp = 2'bxx;
         jump = 1'b1;
    end
    
    default: begin
         RegWrite = 1'b0;
         immSrc = 2'b00;
         ALUSrc = 1'b0;
         MemWrite = 1'b0;
         ResultSrc = 2'b00;
         Branch = 1'b0;
         ALUOp = 2'b00;
         jump = 1'b0;
    end
    
  endcase  
  end
  
  assign PCSrc = ((Branch&zero)|jump);

endmodule
