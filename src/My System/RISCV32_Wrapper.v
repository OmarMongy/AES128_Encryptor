//`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////////
//// Company: 
//// Engineer: 
//// 
//// Create Date: 01/18/2025 11:46:30 PM
//// Design Name: 
//// Module Name: FemtoRV32_Wrapper
//// Project Name: 
//// Target Devices: 
//// Tool Versions: 
//// Description: 
//// 
//// Dependencies: 
//// 
//// Revision:
//// Revision 0.01 - File Created
//// Additional Comments:
//// 
////////////////////////////////////////////////////////////////////////////////////
module RISCV32_Wrapper
#(parameter ADDR_WIDTH = 32,
            DATA_WIDTH = 32,
            HBURST_WIDTH = 3,
            HPROT_WIDTH = 4)
(
// Global Signals
input                     HCLK,
input                     HRESETn, //This is the only active LOW signal.
// Transfer response
input                     HREADY,
input                     HRESP,
// Data
input [DATA_WIDTH-1:0]    HRDATA,
// Address and Control Signals
output reg [ADDR_WIDTH-1:0]   HADDR,
output reg                    HWRITE, //When HIGH this signal indicates a write transfer and when LOW a read transfer.
output reg [2:0]              HSIZE,
output reg [HBURST_WIDTH-1:0] HBURST, 
output reg [HPROT_WIDTH-1:0]  HPROT, //Protection control signal, which provides information about the access type.
output reg [1:0]              HTRANS,
output reg                    HMASTLOCK,
// Data
output reg [DATA_WIDTH-1:0]   HWDATA
);
wire wr_ena, interrupt;
wire [ADDR_WIDTH-1:0] addr;
wire [DATA_WIDTH-1:0] w_data;
reg [DATA_WIDTH-1:0]  r_data;
reg [2:0] p_state, n_state;
//reg [ADDR_WIDTH-1:0] addr_reg;
reg stall;
// RISC-V Processor instantiation
RISCV32i pcore(.clk(HCLK), .reset(HRESETn),
                .addr(addr), .w_data(w_data),
                .r_data(r_data), .interrupt(interrupt),
                .wr_ena(wr_ena), .stall(stall));
                
localparam IDLE  = 2'b00;
localparam ADDR       = 2'b01;
localparam READ_DATA  = 2'b10;
localparam WRITE_DATA = 2'b11;
always@(posedge HCLK, negedge HRESETn) begin
    if(!HRESETn)
        begin
            p_state <= IDLE;
        end
    else
        begin
            p_state <= n_state;
        end              
end

always @(*) begin
    HADDR  = addr;
    case (p_state)
        IDLE: begin
            HADDR      = addr;
            HWRITE     = 1'd0;
            HSIZE      = 3'd0;
            HBURST     = 3'd0;
            HPROT      = 4'd0;
            HTRANS     = 2'd0;
            HMASTLOCK  = 1'd0;
            HWDATA     = 32'd0;  
            
            if(interrupt)
                begin n_state = ADDR; stall = 1'b1 ;end
            else
                begin n_state = IDLE; stall = 1'b0; end
        end

        ADDR: begin
            HADDR  = addr;
//            HTRANS = 2'b10; // NONSEQ Transfer
            stall = 1'b1;
            if (wr_ena) begin
                begin n_state = WRITE_DATA;
                        HTRANS = 2'b10;
                           HWRITE = 1'b1;end
            end else begin
                n_state = READ_DATA;
                    HTRANS = 2'b10;
                        HWRITE = 1'b0;
            end
        end

        READ_DATA: begin
            stall = 1'b1;
            r_data = HRDATA;
            if(HREADY)
                begin n_state = IDLE; stall = 1'b0; end
            else
                n_state = READ_DATA;   
        end

        WRITE_DATA: begin
            stall = 1'b1;
            HWDATA = w_data;
            if(HREADY)     
                begin n_state = IDLE; stall = 1'b0; end
            else
                n_state = WRITE_DATA;    
        end
        default: n_state = IDLE;
    endcase
end
endmodule
