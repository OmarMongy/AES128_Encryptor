`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/22/2025 11:39:29 PM
// Design Name: 
// Module Name: Decoder_AHB_Lite
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
module Decoder_AHB_Lite
#(parameter ADDR_WIDTH = 32)
(
input      [ADDR_WIDTH-1:0]   HADDR,   // addr
output reg                    HSELx1, // memory
output reg                    HSELx2 // AES128
);
always@(*) begin
    HSELx1 = 1'b0;
    HSELx2 = 1'b0;
        case(HADDR[31:28])
            4'h0: HSELx1 = 1'b1;  // Memory Addr. Space 0x00000000 to 0x0000FFFF   
            4'h4: HSELx2 = 1'b1; // AES128 Addr. Space 0x40000000 to 0x4000FFFF        
        endcase 
end
endmodule
