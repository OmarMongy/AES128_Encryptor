`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/24/2025 06:54:21 AM
// Design Name: 
// Module Name: AHB_Lite_MEM
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
module AHB_Lite_MEM
#(parameter ADDR_WIDTH = 32,
            DATA_WIDTH = 32,
            HBURST_WIDTH = 3,
            HPROT_WIDTH = 4)
         // parameter MEM_FILE = "")
(
// Global Signals
input                    HCLK,
input                    HRESETn, //This is the only active LOW signal.
// Select
input                    HSELx,
// Address and Control Signals
input [ADDR_WIDTH-1:0]   HADDR,
input                    HWRITE,
input [2:0]              HSIZE,
input [HBURST_WIDTH-1:0] HBURST, 
input [HPROT_WIDTH-1:0]  HPROT, //Protection control signal, which provides information about the access type.
input [1:0]              HTRANS,
input                    HMASTLOCK,
input                    HREADY,
// Data
input [DATA_WIDTH-1:0]   HWDATA,
// Transfer response
output reg                   HREADYOUT,
output reg                   HRESP,
// Data
output reg [DATA_WIDTH-1:0]  HRDATA,
//Additional Signal to the MEM => wmask
input [3:0] wmask
);
wire [DATA_WIDTH-1:0]  r_data;
reg  [DATA_WIDTH-1:0]  w_data;
reg  [ADDR_WIDTH-1:0]  addr;
reg                    wr_ena;
// Memory instantiation
   Memory #(        
    .MEM_FILE("Data.mem"),
    .SIZE(1024)
) D_mem_unit (
    .clk(HCLK),
    .mem_addr(addr),
    .mem_rdata(r_data),
    .mem_wrena(wr_ena),
    .mem_wdata(w_data)
);
always@(posedge HCLK, negedge HRESETn) begin
    if(!HRESETn)
        begin
           HREADYOUT <= 1'b1;
           HRESP <= 1'b0; // OKAY no error
           HRDATA <= 32'd0; 
        end
    else
        begin
            if(HSELx & HREADY & !HWRITE)
                begin
                  HREADYOUT <= 1'b1;
                  HRESP <= 1'b0; // OKAY no error
                  addr <= HADDR; // addr
                  wr_ena <= 1'b0; //read 
                  HRDATA <= r_data;
                end
            else if(HSELx & HREADY & HWRITE)    
                begin
                  HREADYOUT <= 1'b1;
                  HRESP <= 1'b0; // OKAY no error
                  addr <= HADDR; // addr
                  wr_ena <= 1'b1; //wire 
                  w_data <= HWDATA;               
                end
        end    
end
endmodule


