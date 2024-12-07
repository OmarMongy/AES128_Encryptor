`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/30/2024 02:41:01 PM
// Design Name: 
// Module Name: RoundFunction
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
module RoundFunction
#(parameter WIDTH = 128)
(
input                  clk_i,
input                  rst_n_i,
input                  data_valid_i,
input      [WIDTH-1:0] data_i,
input      [WIDTH-1:0] key_i,
output reg [WIDTH-1:0] data_o
);

wire [WIDTH-1:0] s_box_o;
wire [WIDTH-1:0] mix_col_o;
wire [WIDTH-1:0] sft_rw_o;
reg  [WIDTH-1:0] temp;

ByteSub BS(/*.clk_i(clk_i), .rst_n_i(rst_n_i),*/ .data_i(data_i), .data_o(s_box_o));

ShiftRow SR(/*.clk_i(clk_i), .rst_n_i(rst_n_i),*/.data_i(s_box_o), .data_o(sft_rw_o));

MixColumn MC(/*.clk_i(clk_i), .rst_n_i(rst_n_i),*/ .data_i(sft_rw_o), .data_o(mix_col_o));

always@(posedge clk_i, negedge rst_n_i)
    begin
        if(!rst_n_i)
        temp <= 1'b0;
        else if(data_valid_i)
        temp <= 1'b1;
        else
        temp <= temp;
    end 
    
always@(posedge clk_i, negedge rst_n_i)
    begin
        if(!rst_n_i)
        data_o <= 128'd0;
        else if(temp)
        data_o <= mix_col_o ^ key_i;
        else
        data_o <= data_o;
     end
endmodule



