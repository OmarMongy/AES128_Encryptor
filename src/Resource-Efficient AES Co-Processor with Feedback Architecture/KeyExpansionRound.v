`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Omar Ashraf Abd El Mongy
// 
// Create Date: 11/30/2024 11:59:12 PM
// Design Name: 
// Module Name: KeyExpansion
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
module KeyExpansionRound
#(parameter WIDTH = 128)
(
input                      clk_i,
input                      rst_n_i,

input      [WIDTH-1:0]     key_i,
input      [(WIDTH/4)-1:0] rcon_i,
output reg [WIDTH-1:0]     key_o
);

function [7:0] byte_o;
input    [7:0] byte_i;
        begin
            case(byte_i)
                // first row
                8'h00: byte_o = 8'h63;
                8'h01: byte_o = 8'h7c;
                8'h02: byte_o = 8'h77;
                8'h03: byte_o = 8'h7b;
                8'h04: byte_o = 8'hf2;
                8'h05: byte_o = 8'h6b;
                8'h06: byte_o = 8'h6f;
                8'h07: byte_o = 8'hc5;
                8'h08: byte_o = 8'h30;
                8'h09: byte_o = 8'h01;
                8'h0a: byte_o = 8'h67;
                8'h0b: byte_o = 8'h2b;
                8'h0c: byte_o = 8'hfe;
                8'h0d: byte_o = 8'hd7;
                8'h0e: byte_o = 8'hab;
                8'h0f: byte_o = 8'h76;
                // secound row
                8'h10: byte_o = 8'hca;
                8'h11: byte_o = 8'h82;
                8'h12: byte_o = 8'hc9;
                8'h13: byte_o = 8'h7d;
                8'h14: byte_o = 8'hfa;
                8'h15: byte_o = 8'h59;
                8'h16: byte_o = 8'h47;
                8'h17: byte_o = 8'hf0;
                8'h18: byte_o = 8'had;
                8'h19: byte_o = 8'hd4;
                8'h1a: byte_o = 8'ha2;
                8'h1b: byte_o = 8'haf;
                8'h1c: byte_o = 8'h9c;
                8'h1d: byte_o = 8'ha4;
                8'h1e: byte_o = 8'h72;
                8'h1f: byte_o = 8'hc0;
                // third row
                8'h20: byte_o = 8'hb7;
                8'h21: byte_o = 8'hfd;
                8'h22: byte_o = 8'h93;
                8'h23: byte_o = 8'h26;
                8'h24: byte_o = 8'h36;
                8'h25: byte_o = 8'h3f;
                8'h26: byte_o = 8'hf7;
                8'h27: byte_o = 8'hcc;
                8'h28: byte_o = 8'h34;
                8'h29: byte_o = 8'ha5;
                8'h2a: byte_o = 8'he5;
                8'h2b: byte_o = 8'hf1;
                8'h2c: byte_o = 8'h71;
                8'h2d: byte_o = 8'hd8;
                8'h2e: byte_o = 8'h31;
                8'h2f: byte_o = 8'h15;
                // fourth row
                8'h30: byte_o = 8'h04;
                8'h31: byte_o = 8'hc7;
                8'h32: byte_o = 8'h23;
                8'h33: byte_o = 8'hc3;
                8'h34: byte_o = 8'h18;
                8'h35: byte_o = 8'h96;
                8'h36: byte_o = 8'h05;
                8'h37: byte_o = 8'h9a;
                8'h38: byte_o = 8'h07;
                8'h39: byte_o = 8'h12;
                8'h3a: byte_o = 8'h80;
                8'h3b: byte_o = 8'he2;
                8'h3c: byte_o = 8'heb;
                8'h3d: byte_o = 8'h27;
                8'h3e: byte_o = 8'hb2;
                8'h3f: byte_o = 8'h75;
                // fifth row
                8'h40: byte_o = 8'h09;
                8'h41: byte_o = 8'h83;
                8'h42: byte_o = 8'h2c;
                8'h43: byte_o = 8'h1a;
                8'h44: byte_o = 8'h1b;
                8'h45: byte_o = 8'h6e;
                8'h46: byte_o = 8'h5a;
                8'h47: byte_o = 8'ha0;
                8'h48: byte_o = 8'h52;
                8'h49: byte_o = 8'h3b;
                8'h4a: byte_o = 8'hd6;
                8'h4b: byte_o = 8'hb3;
                8'h4c: byte_o = 8'h29;
                8'h4d: byte_o = 8'he3;
                8'h4e: byte_o = 8'h2f;
                8'h4f: byte_o = 8'h84;
                // sixth row
                8'h50: byte_o = 8'h53;
                8'h51: byte_o = 8'hd1;
                8'h52: byte_o = 8'h00;
                8'h53: byte_o = 8'hed;
                8'h54: byte_o = 8'h20;
                8'h55: byte_o = 8'hfc;
                8'h56: byte_o = 8'hb1;
                8'h57: byte_o = 8'h5b;
                8'h58: byte_o = 8'h6a;
                8'h59: byte_o = 8'hcb;
                8'h5a: byte_o = 8'hbe;
                8'h5b: byte_o = 8'h39;
                8'h5c: byte_o = 8'h4a;
                8'h5d: byte_o = 8'hac;
                8'h5e: byte_o = 8'h58;
                8'h5f: byte_o = 8'hcf;
                // seventh row
                8'h60: byte_o = 8'hd0;
                8'h61: byte_o = 8'hef;
                8'h62: byte_o = 8'haa;
                8'h63: byte_o = 8'hfb;
                8'h64: byte_o = 8'h43;
                8'h65: byte_o = 8'h4d;
                8'h66: byte_o = 8'h33;
                8'h67: byte_o = 8'h85;
                8'h68: byte_o = 8'h45;
                8'h69: byte_o = 8'hf9;
                8'h6a: byte_o = 8'h02;
                8'h6b: byte_o = 8'h7f;
                8'h6c: byte_o = 8'h50;
                8'h6d: byte_o = 8'h3c;
                8'h6e: byte_o = 8'h9f;
                8'h6f: byte_o = 8'ha8;
                // eighth row
                8'h70: byte_o = 8'h51;
                8'h71: byte_o = 8'ha3;
                8'h72: byte_o = 8'h40;
                8'h73: byte_o = 8'h8f;
                8'h74: byte_o = 8'h92;
                8'h75: byte_o = 8'h9d;
                8'h76: byte_o = 8'h38;
                8'h77: byte_o = 8'hf5;
                8'h78: byte_o = 8'hbc;
                8'h79: byte_o = 8'hb6;
                8'h7a: byte_o = 8'hda;
                8'h7b: byte_o = 8'h21;
                8'h7c: byte_o = 8'h10;
                8'h7d: byte_o = 8'hff;
                8'h7e: byte_o = 8'hf3;
                8'h7f: byte_o = 8'hd2;
                // ninth row
                8'h80: byte_o = 8'hcd;
                8'h81: byte_o = 8'h0c;
                8'h82: byte_o = 8'h13;
                8'h83: byte_o = 8'hec;
                8'h84: byte_o = 8'h5f;
                8'h85: byte_o = 8'h97;
                8'h86: byte_o = 8'h44;
                8'h87: byte_o = 8'h17;
                8'h88: byte_o = 8'hc4;
                8'h89: byte_o = 8'ha7;
                8'h8a: byte_o = 8'h7e;
                8'h8b: byte_o = 8'h3d;
                8'h8c: byte_o = 8'h64;
                8'h8d: byte_o = 8'h5d;
                8'h8e: byte_o = 8'h19;
                8'h8f: byte_o = 8'h73;
                // tenth row
                8'h90: byte_o = 8'h60;
                8'h91: byte_o = 8'h81;
                8'h92: byte_o = 8'h4f;
                8'h93: byte_o = 8'hdc;
                8'h94: byte_o = 8'h22;
                8'h95: byte_o = 8'h2a;
                8'h96: byte_o = 8'h90;
                8'h97: byte_o = 8'h88;
                8'h98: byte_o = 8'h46;
                8'h99: byte_o = 8'hee;
                8'h9a: byte_o = 8'hb8;
                8'h9b: byte_o = 8'h14;
                8'h9c: byte_o = 8'hde;
                8'h9d: byte_o = 8'h5e;
                8'h9e: byte_o = 8'h0b;
                8'h9f: byte_o = 8'hdb;
                // eleventh row
                8'ha0: byte_o = 8'he0;
                8'ha1: byte_o = 8'h32;
                8'ha2: byte_o = 8'h3a;
                8'ha3: byte_o = 8'h0a;
                8'ha4: byte_o = 8'h49;
                8'ha5: byte_o = 8'h06;
                8'ha6: byte_o = 8'h24;
                8'ha7: byte_o = 8'h5c;
                8'ha8: byte_o = 8'hc2;
                8'ha9: byte_o = 8'hd3;
                8'haa: byte_o = 8'hac;
                8'hab: byte_o = 8'h62;
                8'hac: byte_o = 8'h91;
                8'had: byte_o = 8'h95;
                8'hae: byte_o = 8'he4;
                8'haf: byte_o = 8'h79;
                // twelfth row
                8'hb0: byte_o = 8'he7;
                8'hb1: byte_o = 8'hc8;
                8'hb2: byte_o = 8'h37;
                8'hb3: byte_o = 8'h6d;
                8'hb4: byte_o = 8'h8d;
                8'hb5: byte_o = 8'hd5;
                8'hb6: byte_o = 8'h4e;
                8'hb7: byte_o = 8'ha9;
                8'hb8: byte_o = 8'h6c;
                8'hb9: byte_o = 8'h56;
                8'hba: byte_o = 8'hf4;
                8'hbb: byte_o = 8'hea;
                8'hbc: byte_o = 8'h65;
                8'hbd: byte_o = 8'h7a;
                8'hbe: byte_o = 8'hae;
                8'hbf: byte_o = 8'h08; 
                // thirteenth row
                8'hc0: byte_o = 8'hba;
                8'hc1: byte_o = 8'h78;   
                8'hc2: byte_o = 8'h25;   
                8'hc3: byte_o = 8'h2e;   
                8'hc4: byte_o = 8'h1c;   
                8'hc5: byte_o = 8'ha6;   
                8'hc6: byte_o = 8'hb4;   
                8'hc7: byte_o = 8'hc6;   
                8'hc8: byte_o = 8'he8;   
                8'hc9: byte_o = 8'hdd;   
                8'hca: byte_o = 8'h74;   
                8'hcb: byte_o = 8'h1f;   
                8'hcc: byte_o = 8'h4b;   
                8'hcd: byte_o = 8'hbd;   
                8'hce: byte_o = 8'h8b;   
                8'hcf: byte_o = 8'h8a;   
                // fourteenth row
                8'hd0: byte_o = 8'h70; 
                8'hd1: byte_o = 8'h3e;
                8'hd2: byte_o = 8'hb5;
                8'hd3: byte_o = 8'h66;
                8'hd4: byte_o = 8'h48;
                8'hd5: byte_o = 8'h03;
                8'hd6: byte_o = 8'hf6;
                8'hd7: byte_o = 8'h0e;
                8'hd8: byte_o = 8'h61;
                8'hd9: byte_o = 8'h35;
                8'hda: byte_o = 8'h57;
                8'hdb: byte_o = 8'hb9;
                8'hdc: byte_o = 8'h86;
                8'hdd: byte_o = 8'hc1;
                8'hde: byte_o = 8'h1d;
                8'hdf: byte_o = 8'h9e;
                // fifteenth row
                8'he0: byte_o = 8'he1; 
                8'he1: byte_o = 8'hf8;
                8'he2: byte_o = 8'h98;
                8'he3: byte_o = 8'h11;
                8'he4: byte_o = 8'h69;
                8'he5: byte_o = 8'hd9;
                8'he6: byte_o = 8'h8e;
                8'he7: byte_o = 8'h94;
                8'he8: byte_o = 8'h9b;
                8'he9: byte_o = 8'h1e;
                8'hea: byte_o = 8'h87;
                8'heb: byte_o = 8'he9;
                8'hec: byte_o = 8'hce;
                8'hed: byte_o = 8'h55;
                8'hee: byte_o = 8'h28;
                8'hef: byte_o = 8'hdf;
                // sixteenth row
                8'hf0: byte_o = 8'h8c;
                8'hf1: byte_o = 8'ha1; 
                8'hf2: byte_o = 8'h89; 
                8'hf3: byte_o = 8'h0d; 
                8'hf4: byte_o = 8'hbf; 
                8'hf5: byte_o = 8'he6; 
                8'hf6: byte_o = 8'h42; 
                8'hf7: byte_o = 8'h68; 
                8'hf8: byte_o = 8'h41; 
                8'hf9: byte_o = 8'h99; 
                8'hfa: byte_o = 8'h2d; 
                8'hfb: byte_o = 8'h0f; 
                8'hfc: byte_o = 8'hb0; 
                8'hfd: byte_o = 8'h54; 
                8'hfe: byte_o = 8'hbb; 
                8'hff: byte_o = 8'h16;                           
            endcase
        end
endfunction      

// Declare individual bytes
wire [7:0] data_i_15 = key_i[127:120];
wire [7:0] data_i_14 = key_i[119:112];
wire [7:0] data_i_13 = key_i[111:104];
wire [7:0] data_i_12 = key_i[103:96];
wire [7:0] data_i_11 = key_i[95:88];
wire [7:0] data_i_10 = key_i[87:80];
wire [7:0] data_i_9  = key_i[79:72];
wire [7:0] data_i_8  = key_i[71:64];
wire [7:0] data_i_7  = key_i[63:56];
wire [7:0] data_i_6  = key_i[55:48];
wire [7:0] data_i_5  = key_i[47:40];
wire [7:0] data_i_4  = key_i[39:32];
wire [7:0] data_i_3  = key_i[31:24];
wire [7:0] data_i_2  = key_i[23:16];
wire [7:0] data_i_1  = key_i[15:8];
wire [7:0] data_i_0  = key_i[7:0];

wire [31:0] word_0_ki, word_1_ki, word_2_ki, word_3_ki;
wire [31:0] word_0_ko, word_1_ko, word_2_ko, word_3_ko;

assign word_0_ki = {data_i_15, data_i_14, data_i_13, data_i_12};
assign word_1_ki = {data_i_11, data_i_10, data_i_9, data_i_8};
assign word_2_ki = {data_i_7, data_i_6, data_i_5, data_i_4};
assign word_3_ki = {data_i_3, data_i_2, data_i_1, data_i_0};

assign word_0_ko = (word_0_ki) ^  ({byte_o(word_3_ki[23:16]), byte_o(word_3_ki[15:8]), byte_o(word_3_ki[7:0]), byte_o(word_3_ki[31:24])}) ^ (rcon_i);
assign word_1_ko = (word_1_ki) ^ (word_0_ko);
assign word_2_ko = (word_2_ki) ^ (word_1_ko);
assign word_3_ko = (word_3_ki) ^ (word_2_ko);

always@(posedge clk_i, negedge rst_n_i)
 begin
    if(!rst_n_i)
        key_o = 128'd0;
    else
        key_o = {word_0_ko, word_1_ko, word_2_ko, word_3_ko};    
 end
endmodule




