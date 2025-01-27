`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/19/2025 12:04:55 AM
// Design Name: 
// Module Name: AHB-Lite_AES128
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
module AHB_Lite_AES128
#(parameter ADDR_WIDTH = 32,
            DATA_WIDTH = 32,
            HBURST_WIDTH = 3,
            HPROT_WIDTH = 4)
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
output reg               HREADYOUT,
output reg               HRESP,
// Data
output reg [DATA_WIDTH-1:0]  HRDATA
);

// Address decoding for AES registers
localparam KEY0_ADDR   = 32'h4000_0000;
localparam KEY1_ADDR   = 32'h4000_0004;
localparam KEY2_ADDR   = 32'h4000_0008;
localparam KEY3_ADDR   = 32'h4000_000C;
localparam TEXT0_ADDR  = 32'h4000_0010;
localparam TEXT1_ADDR  = 32'h4000_0014;
localparam TEXT2_ADDR  = 32'h4000_0018;
localparam TEXT3_ADDR  = 32'h4000_001C;
localparam CTRL_ADDR   = 32'h4000_0020;
localparam CIPHER0_ADDR = 32'h4000_0024;
localparam CIPHER1_ADDR = 32'h4000_0028;
localparam CIPHER2_ADDR = 32'h4000_002C;
localparam CIPHER3_ADDR = 32'h4000_0030;
localparam DONE_STATUS = 32'h4000_0034;

// Signals to AES Core
wire [127:0] aes_key;        // 128-bit Key
wire [127:0] aes_plaintext;  // 128-bit Plaintext
wire [127:0]aes_ciphertext; // 128-bit Ciphertext
reg         start;          // Start Signal to AES Core
wire        done;
// Instantiate AES128 Core for encryption    
AES128 #() uut (
.clk_i(HCLK),
.rst_n_i(HRESETn),
.start(start),
.plaintext_i(aes_plaintext),
.key_i(aes_key),
.data_ready_o(done),
//.busy_o(),
//.valid_o(),
.ciphertext_o(aes_ciphertext)   
 );
 reg [31:0] key_regs[3:0];        // 32-bit key registers
 reg [31:0] plaintext_regs[3:0]; // 32-bit plaintext registers
 
// wire [31:0] BASE_ADDR = 32'h4000_0000; // Base Address

 // Register read/write logic
 always @(posedge HCLK or negedge HRESETn) begin
     HRESP <= 1'b0;
     HREADYOUT <= 1'b1; // always ready
     if (!HRESETn) begin
         key_regs[0] <= 32'd0;
         key_regs[1] <= 32'd0;
         key_regs[2] <= 32'd0;
         key_regs[3] <= 32'd0;
         plaintext_regs[0] <= 32'd0;
         plaintext_regs[1] <= 32'd0;
         plaintext_regs[2] <= 32'd0;
         plaintext_regs[3] <= 32'd0;
         HRDATA <= 32'd0;
         HRESP <= 1'b0;
         HREADYOUT <= 1'b1;
         start <= 1'b0;
     end else if (HSELx && HREADY) begin
         if (HWRITE) begin
              HREADYOUT <= 1'b1;
             // Write to registers
             case (HADDR)                       
                 KEY0_ADDR:  key_regs[0] <= HWDATA;
                 KEY1_ADDR:  key_regs[1] <= HWDATA;
                 KEY2_ADDR:  key_regs[2] <= HWDATA;
                 KEY3_ADDR:  key_regs[3] <= HWDATA;
                 TEXT0_ADDR: plaintext_regs[0] <= HWDATA;
                 TEXT1_ADDR: plaintext_regs[1] <= HWDATA;
                 TEXT2_ADDR: plaintext_regs[2] <= HWDATA;
                 TEXT3_ADDR: plaintext_regs[3] <= HWDATA;
                 CTRL_ADDR:  start <= HWDATA[0]; // Start encryption
                 default: ;
             endcase
         end else begin
              HREADYOUT <= 1'b1;  
             // Read from registers
             case (HADDR)                    
                 KEY0_ADDR:     HRDATA <= key_regs[0];
                 KEY1_ADDR:     HRDATA <= key_regs[1];
                 KEY2_ADDR:     HRDATA <= key_regs[2];
                 KEY3_ADDR:     HRDATA <= key_regs[3];
                 TEXT0_ADDR:    HRDATA <= plaintext_regs[0];
                 TEXT1_ADDR:    HRDATA <= plaintext_regs[1];
                 TEXT2_ADDR:    HRDATA <= plaintext_regs[2];
                 TEXT3_ADDR:    HRDATA <= plaintext_regs[3];
                 CIPHER0_ADDR:  HRDATA <= aes_ciphertext[31:0];
                 CIPHER1_ADDR:  HRDATA <= aes_ciphertext[63:32];
                 CIPHER2_ADDR:  HRDATA <= aes_ciphertext[95:64];
                 CIPHER3_ADDR:  HRDATA <= aes_ciphertext[127:96];
                 DONE_STATUS:   HRDATA <= {{30{1'b0}}, done};
                 default:       HRDATA <= 32'd0;
             endcase
         end
     end
 end

 // Concatenate key and plaintext when all words are written
assign aes_key = {key_regs[3], key_regs[2], key_regs[1], key_regs[0]};
assign aes_plaintext = {plaintext_regs[3], plaintext_regs[2], plaintext_regs[1], plaintext_regs[0]};

endmodule




