`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/22/2025 11:47:51 PM
// Design Name: 
// Module Name: Multiplexor_AHB_Lite
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
module Multiplexor_AHB_Lite
#(parameter DATA_WIDTH = 32)
(
// memory signals
input  [DATA_WIDTH-1:0]  HRDATAx1,
input                    HREADYOUTx1,
input                    HRESPx1,
input                    HSELx1,
// AES128 signals
input  [DATA_WIDTH-1:0]  HRDATAx2,
input                    HREADYOUTx2,
input                    HRESPx2,
input                    HSELx2,
// slave slected data to master
output reg [DATA_WIDTH-1:0]  HRDATA,
output reg                   HREADY,
output reg                   HRESP
);
always@(*) begin
    HRDATA = 32'd0; HREADY = 1'b0; HRESP = 1'b0;
    case({HSELx2, HSELx1})
        2'b01: begin HRDATA = HRDATAx1; HREADY = HREADYOUTx1; HRESP = HRESPx1; end
        2'b10: begin HRDATA = HRDATAx2; HREADY = HREADYOUTx2; HRESP = HRESPx2; end
    endcase
end
    
endmodule






