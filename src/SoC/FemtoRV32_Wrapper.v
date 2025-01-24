`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/18/2025 11:46:30 PM
// Design Name: 
// Module Name: FemtoRV32_Wrapper
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
module FemtoRV32_Wrapper
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
wire rw_ena;
reg  r_busy, w_busy;
wire [3:0] wmask;
wire [DATA_WIDTH-1:0] addr, w_data;
reg[DATA_WIDTH-1:0]   r_data;

// RISC-V Processor instantiation
FemtoRV32 pcore(.clk(HCLK), .reset(HRESETn),
                .mem_addr(addr), .mem_wdata(w_data),
                .mem_wmask(wmask), .mem_rdata(r_data),
                .mem_rstrb(rw_ena), .mem_rbusy(r_busy),
                .mem_wbusy(r_busy));
                
reg [1:0] p_state, n_state;
localparam IDLE  = 2'b00;
localparam READ  = 2'b01;
localparam WRITE = 2'b11;

always@(posedge HCLK, negedge HRESETn) begin
    if(!HRESETn)
        p_state <= IDLE;
    else
        p_state <= n_state;                
end

always@(*) begin
    HADDR = 32'd0;
    HWRITE = 1'd0;
    HSIZE = 3'd0;
    HBURST = 3'd0;
    HPROT = 4'd0;
    HTRANS = 2'd0;
    HMASTLOCK = 1'd0;
    HWDATA = 32'd0;
    r_busy = 1'b0;
    w_busy = 1'b0;
    r_data = 32'd0;
        case(p_state)
            IDLE:
                begin
                    HADDR = 32'd0;
                    HWRITE = 1'd0;
                    HSIZE = 3'd0;
                    HBURST = 3'd0;
                    HPROT = 4'd0;
                    HTRANS = 2'd0;
                    HMASTLOCK = 1'd0;
                    HWDATA = 32'd0;
                    r_busy = 1'b0;
                    w_busy = 1'b0;
                        if(rw_ena)
                            n_state = READ;
                        else    
                            n_state = WRITE;   
                end
            READ:
                begin
                        if(HREADY == 1'b1 && rw_ena == 1'b1)
                            begin
                                HADDR = addr;
                                r_data = HRDATA;
                                HWRITE = 1'd0; 
                                r_busy = 1'b0;
                            end    
                        else if (HREADY == 1'b0 && rw_ena == 1'b1)
                            begin
                                HADDR = addr;
                                r_busy = 1'b1;
                                HWRITE = 1'd0;
                                r_data = 32'd0;
                            end
                        else
                            n_state = IDLE;
                end            
            WRITE:
                begin
                    if(HREADY == 1'b1 && rw_ena == 1'b0)
                        begin
                            HADDR = addr;
                            HWDATA = w_data;
                            HWRITE = 1'd1; 
                            w_busy = 1'b0;                       
                        end
                    
                    else if (HREADY == 1'b0 && rw_ena == 1'b0)
                        begin
                            HADDR = addr;
                            HWDATA = w_data;
                            HWRITE = 1'd0; 
                            w_busy = 1'b1;                       
                        end
                    else
                        n_state = IDLE;                                         
                end                                             
        endcase
end                     
endmodule

