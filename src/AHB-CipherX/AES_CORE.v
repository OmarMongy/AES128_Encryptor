`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Omar Ashraf Abd El Mongy
// 
// Create Date: 12/09/2024 08:56:45 PM
// Design Name: 
// Module Name: aes_core
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
module AES_CORE
#(parameter WIDTH = 128)
 (
    input  wire        HCLK,
    input  wire        HRESETn,
    input  wire        HSEL,
    input  wire [31:0] HADDR,
    input  wire        HWRITE,
    input  wire        HREADY,
    input  wire [31:0] HWDATA,
    output wire [31:0] HRDATA,
    output wire        HRESP
);
wire [127:0] aes_key, aes_plaintext, aes_ciphertext;
wire         aes_start, aes_done;

AES_AHB_INTERFACE ahb_interface (
.HCLK(HCLK),
.HRESETn(HRESETn),
.HSEL(HSEL),
.HADDR(HADDR),
.HWRITE(HWRITE),
.HREADY(HREADY),
.HWDATA(HWDATA),
.HRDATA(HRDATA),
.HRESP(HRESP),
.DONE(aes_done),
.aes_key(aes_key),
.aes_plaintext(aes_plaintext),
.aes_ciphertext(aes_ciphertext),
.start(aes_start)
    );
AES128 #(WIDTH) uut (
.clk_i(HCLK),
.rst_n_i(HRESETn),
.start(aes_start),
.plaintext_i(aes_plaintext),
.key_i(aes_key),
.data_ready_o(aes_done),
.ciphertext_o(aes_ciphertext)   
 );
endmodule
