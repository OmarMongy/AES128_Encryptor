`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/14/2025 11:05:31 PM
// Design Name: 
// Module Name: SoC
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
module top_SoC(
input   global_clk,
input   global_rst_n
);
localparam DATA_WIDTH = 32;
localparam ADDR_WIDTH = 32;
localparam HBURST_WIDTH = 3;
localparam HPROT_WIDTH = 4;

wire [DATA_WIDTH-1:0] r_data;
wire aes_sel, mem_sel;
wire [ADDR_WIDTH-1:0]   HADDR;
wire                    HWRITE;
wire [2:0]              HSIZE;
wire [HBURST_WIDTH-1:0] HBURST; 
wire [HPROT_WIDTH-1:0]  HPROT; //Protection control signal, which provides information about the access type.
wire [1:0]              HTRANS;
wire                    HMASTLOCK;
wire                    HRESP;
wire                    HREADY;
// Data
wire [DATA_WIDTH-1:0]   HWDATA;
// Transfer response
wire                    HREADYOUTx1, HREADYOUTx2;
wire                    HRESPx1, HRESPx2;
// Data
wire [DATA_WIDTH-1:0]   HRDATAx1, HRDATAx2;

Decoder_AHB_Lite dec(.HADDR(HADDR),
                     .HSELx1(mem_sel),
                     .HSELx2(aes_sel));
                     
Multiplexor_AHB_Lite mux(.HRDATAx1(HRDATAx1), 
                         .HREADYOUTx1(HREADYOUTx1),
                         .HRESPx1(HRESPx1),
                         .HSELx1(mem_sel),
                         .HRDATAx2(HRDATAx2),
                         .HREADYOUTx2(HREADYOUTx2),
                         .HRESPx2(HRESPx2),
                         .HSELx2(aes_sel),
                         .HRDATA(r_data),
                         .HREADY(HREADY),
                         .HRESP(HRESP));
                         
AHB_Lite_MEM slave_1_mem(.HCLK(global_clk),
                         .HRESETn(global_rst_n),
                         .HSELx(mem_sel),
                         .HADDR(HADDR),
                         .HWRITE(HWRITE),
                         .HSIZE(HSIZE),
                         .HBURST(HBURST),
                         .HPROT(HPROT),
                         .HTRANS(HTRANS),
                         .HMASTLOCK(HMASTLOCK),
                         .HREADY(HREADY),
                         .HWDATA(HWDATA),
                         .HREADYOUT(HREADYOUTx1),
                         .HRESP(HRESPx1),
                         .HRDATA(HRDATAx1));

AHB_Lite_AES128 slave_2_aes128(
                         .HCLK(global_clk),
                         .HRESETn(global_rst_n),
                         .HSELx(aes_sel),
                         .HADDR(HADDR),
                         .HWRITE(HWRITE),
                         .HSIZE(HSIZE),
                         .HBURST(HBURST),
                         .HPROT(HPROT),
                         .HTRANS(HTRANS),
                         .HMASTLOCK(HMASTLOCK),
                         .HREADY(HREADY),
                         .HWDATA(HWDATA),
                         .HREADYOUT(HREADYOUTx2),
                         .HRESP(HRESPx2),
                         .HRDATA(HRDATAx2));

RISCV32_Wrapper master(
                         .HCLK(global_clk),
                         .HRESETn(global_rst_n),
                         .HADDR(HADDR),
                         .HWRITE(HWRITE),
                         .HSIZE(HSIZE),
                         .HBURST(HBURST),
                         .HPROT(HPROT),
                         .HTRANS(HTRANS),
                         .HMASTLOCK(HMASTLOCK),
                         .HREADY(HREADY),
                         .HWDATA(HWDATA),
                         .HRESP(HRESP),
                         .HRDATA(r_data));                         
endmodule

