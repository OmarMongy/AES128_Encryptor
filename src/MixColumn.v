`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2024 12:30:57 AM
// Design Name: 
// Module Name: MixColumn
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
module MixColumn
#(parameter WIDTH = 128)
(
input      [WIDTH-1:0] data_i,
output     [WIDTH-1:0] data_o
);

// E-Table 
function [7:0] Ebyte_out;
   input [31:0]Ebyte_in;
     reg [7:0] Ebyte_in_reg;
   
    begin
        // Adjust input value
        if (Ebyte_in > 8'hFF)
            Ebyte_in_reg = Ebyte_in - 8'hFF;
        else
            Ebyte_in_reg = Ebyte_in;
        // Return corresponding output
        case (Ebyte_in_reg)
        8'h00: Ebyte_out = 8'h01;
        8'h01: Ebyte_out = 8'h03;
        8'h02: Ebyte_out = 8'h05;
        8'h03: Ebyte_out = 8'h0F;
        8'h04: Ebyte_out = 8'h11;
        8'h05: Ebyte_out = 8'h33;
        8'h06: Ebyte_out = 8'h55;
        8'h07: Ebyte_out = 8'hFF;
        8'h08: Ebyte_out = 8'h1A;
        8'h09: Ebyte_out = 8'h2E;
        8'h0A: Ebyte_out = 8'h72;
        8'h0B: Ebyte_out = 8'h96;
        8'h0C: Ebyte_out = 8'hA1;
        8'h0D: Ebyte_out = 8'hF8;
        8'h0E: Ebyte_out = 8'h13;
        8'h0F: Ebyte_out = 8'h35;
        
        8'h10: Ebyte_out = 8'h5F;
        8'h11: Ebyte_out = 8'hE1;
        8'h12: Ebyte_out = 8'h38;
        8'h13: Ebyte_out = 8'h48;
        8'h14: Ebyte_out = 8'hD8;
        8'h15: Ebyte_out = 8'h73;
        8'h16: Ebyte_out = 8'h95;
        8'h17: Ebyte_out = 8'hA4;
        8'h18: Ebyte_out = 8'hF7;
        8'h19: Ebyte_out = 8'h02;
        8'h1A: Ebyte_out = 8'h06;
        8'h1B: Ebyte_out = 8'h0A;
        8'h1C: Ebyte_out = 8'h1E;
        8'h1D: Ebyte_out = 8'h22;
        8'h1E: Ebyte_out = 8'h66;
        8'h1F: Ebyte_out = 8'hAA;
        
        8'h20: Ebyte_out = 8'hE5;
        8'h21: Ebyte_out = 8'h34;
        8'h22: Ebyte_out = 8'h5C;
        8'h23: Ebyte_out = 8'hE4;
        8'h24: Ebyte_out = 8'h37;
        8'h25: Ebyte_out = 8'h59;
        8'h26: Ebyte_out = 8'hEB;
        8'h27: Ebyte_out = 8'h26;
        8'h28: Ebyte_out = 8'h6A;
        8'h29: Ebyte_out = 8'hBE;
        8'h2A: Ebyte_out = 8'hD9;
        8'h2B: Ebyte_out = 8'h70;
        8'h2C: Ebyte_out = 8'h90;
        8'h2D: Ebyte_out = 8'hAB;
        8'h2E: Ebyte_out = 8'hE6;
        8'h2F: Ebyte_out = 8'h31;
        
        8'h30: Ebyte_out = 8'h53;
        8'h31: Ebyte_out = 8'hF5;
        8'h32: Ebyte_out = 8'h04;
        8'h33: Ebyte_out = 8'h0C;
        8'h34: Ebyte_out = 8'h14;
        8'h35: Ebyte_out = 8'h3C;
        8'h36: Ebyte_out = 8'h44;
        8'h37: Ebyte_out = 8'hCC;
        8'h38: Ebyte_out = 8'h4F;
        8'h39: Ebyte_out = 8'hD1;
        8'h3A: Ebyte_out = 8'h68;
        8'h3B: Ebyte_out = 8'hB8;
        8'h3C: Ebyte_out = 8'hD3;
        8'h3D: Ebyte_out = 8'h6E;
        8'h3E: Ebyte_out = 8'hB2;
        8'h3F: Ebyte_out = 8'hCD;
        
        8'h40: Ebyte_out = 8'h4C;
        8'h41: Ebyte_out = 8'hD4;
        8'h42: Ebyte_out = 8'h67;
        8'h43: Ebyte_out = 8'hA9;
        8'h44: Ebyte_out = 8'hE0;
        8'h45: Ebyte_out = 8'h3B;
        8'h46: Ebyte_out = 8'h4D;
        8'h47: Ebyte_out = 8'hD7;
        8'h48: Ebyte_out = 8'h62;
        8'h49: Ebyte_out = 8'hA6;
        8'h4A: Ebyte_out = 8'hF1;
        8'h4B: Ebyte_out = 8'h08;
        8'h4C: Ebyte_out = 8'h18;
        8'h4D: Ebyte_out = 8'h28;
        8'h4E: Ebyte_out = 8'h78;
        8'h4F: Ebyte_out = 8'h88;
        
        8'h50: Ebyte_out = 8'h83;
        8'h51: Ebyte_out = 8'h9E;
        8'h52: Ebyte_out = 8'hB9;
        8'h53: Ebyte_out = 8'hD0;
        8'h54: Ebyte_out = 8'h6B;
        8'h55: Ebyte_out = 8'hBD;
        8'h56: Ebyte_out = 8'hDC;
        8'h57: Ebyte_out = 8'h7F;
        8'h58: Ebyte_out = 8'h81;
        8'h59: Ebyte_out = 8'h98;
        8'h5A: Ebyte_out = 8'hB3;
        8'h5B: Ebyte_out = 8'hCE;
        8'h5C: Ebyte_out = 8'h49;
        8'h5D: Ebyte_out = 8'hDB;
        8'h5E: Ebyte_out = 8'h76;
        8'h5F: Ebyte_out = 8'h9A;
        
        8'h60: Ebyte_out = 8'hB5;
        8'h61: Ebyte_out = 8'hC4;
        8'h62: Ebyte_out = 8'h57;
        8'h63: Ebyte_out = 8'hF9;
        8'h64: Ebyte_out = 8'h10;
        8'h65: Ebyte_out = 8'h30;
        8'h66: Ebyte_out = 8'h50;
        8'h67: Ebyte_out = 8'hF0;
        8'h68: Ebyte_out = 8'h0B;
        8'h69: Ebyte_out = 8'h1D;
        8'h6A: Ebyte_out = 8'h27;
        8'h6B: Ebyte_out = 8'h69;
        8'h6C: Ebyte_out = 8'hBB;
        8'h6D: Ebyte_out = 8'hD6;
        8'h6E: Ebyte_out = 8'h61;
        8'h6F: Ebyte_out = 8'hA3;
        
        8'h70: Ebyte_out = 8'hFE;
        8'h71: Ebyte_out = 8'h19;
        8'h72: Ebyte_out = 8'h2B;
        8'h73: Ebyte_out = 8'h7D;
        8'h74: Ebyte_out = 8'h87;
        8'h75: Ebyte_out = 8'h92;
        8'h76: Ebyte_out = 8'hAD;
        8'h77: Ebyte_out = 8'hEC;
        8'h78: Ebyte_out = 8'h2F;
        8'h79: Ebyte_out = 8'h71;
        8'h7A: Ebyte_out = 8'h93;
        8'h7B: Ebyte_out = 8'hAE;
        8'h7C: Ebyte_out = 8'hE9;
        8'h7D: Ebyte_out = 8'h20;
        8'h7E: Ebyte_out = 8'h60;
        8'h7F: Ebyte_out = 8'hA0;
        
        8'h80: Ebyte_out = 8'hFB;
        8'h81: Ebyte_out = 8'h16;
        8'h82: Ebyte_out = 8'h3A;
        8'h83: Ebyte_out = 8'h4E;
        8'h84: Ebyte_out = 8'hD2;
        8'h85: Ebyte_out = 8'h6D;
        8'h86: Ebyte_out = 8'hB7;
        8'h87: Ebyte_out = 8'hC2;
        8'h88: Ebyte_out = 8'h5D;
        8'h89: Ebyte_out = 8'hE7;
        8'h8A: Ebyte_out = 8'h32;
        8'h8B: Ebyte_out = 8'h56;
        8'h8C: Ebyte_out = 8'hFA;
        8'h8D: Ebyte_out = 8'h15;
        8'h8E: Ebyte_out = 8'h3F;
        8'h8F: Ebyte_out = 8'h41;
        // BREAK 11/29//2024  ????? ???? ????? ??????
        8'h90: Ebyte_out = 8'hC3;
        8'h91: Ebyte_out = 8'h5E;
        8'h92: Ebyte_out = 8'hE2;
        8'h93: Ebyte_out = 8'h3D;
        8'h94: Ebyte_out = 8'h47;
        8'h95: Ebyte_out = 8'hC9;
        8'h96: Ebyte_out = 8'h40;
        8'h97: Ebyte_out = 8'hC0;
        8'h98: Ebyte_out = 8'h5B;
        8'h99: Ebyte_out = 8'hED;
        8'h9A: Ebyte_out = 8'h2C;
        8'h9B: Ebyte_out = 8'h74;
        8'h9C: Ebyte_out = 8'h9C;
        8'h9D: Ebyte_out = 8'hBF;
        8'h9E: Ebyte_out = 8'hDA;
        8'h9F: Ebyte_out = 8'h75;
        
        8'hA0: Ebyte_out = 8'h9F;
        8'hA1: Ebyte_out = 8'hBA;
        8'hA2: Ebyte_out = 8'hD5;
        8'hA3: Ebyte_out = 8'h64;
        8'hA4: Ebyte_out = 8'hAC;
        8'hA5: Ebyte_out = 8'hEF;
        8'hA6: Ebyte_out = 8'h2A;
        8'hA7: Ebyte_out = 8'h7E;
        8'hA8: Ebyte_out = 8'h82;
        8'hA9: Ebyte_out = 8'h9D;
        8'hAA: Ebyte_out = 8'hBC;
        8'hAB: Ebyte_out = 8'hDF;
        8'hAC: Ebyte_out = 8'h7A;
        8'hAD: Ebyte_out = 8'h8E;
        8'hAE: Ebyte_out = 8'h89;
        8'hAF: Ebyte_out = 8'h80;
        
        8'hB0: Ebyte_out = 8'h9B;
        8'hB1: Ebyte_out = 8'hB6;
        8'hB2: Ebyte_out = 8'hC1;
        8'hB3: Ebyte_out = 8'h58;
        8'hB4: Ebyte_out = 8'hE8;
        8'hB5: Ebyte_out = 8'h23;
        8'hB6: Ebyte_out = 8'h65;
        8'hB7: Ebyte_out = 8'hAF;
        8'hB8: Ebyte_out = 8'hEA;
        8'hB9: Ebyte_out = 8'h25;
        8'hBA: Ebyte_out = 8'h6F;
        8'hBB: Ebyte_out = 8'hB1;
        8'hBC: Ebyte_out = 8'hC8;
        8'hBD: Ebyte_out = 8'h43;
        8'hBE: Ebyte_out = 8'hC5;
        8'hBF: Ebyte_out = 8'h54;
        
        8'hC0: Ebyte_out = 8'hFC;
        8'hC1: Ebyte_out = 8'h1F;
        8'hC2: Ebyte_out = 8'h21;
        8'hC3: Ebyte_out = 8'h63;
        8'hC4: Ebyte_out = 8'hA5;
        8'hC5: Ebyte_out = 8'hF4;
        8'hC6: Ebyte_out = 8'h07;
        8'hC7: Ebyte_out = 8'h09;
        8'hC8: Ebyte_out = 8'h1B;
        8'hC9: Ebyte_out = 8'h2D;
        8'hCA: Ebyte_out = 8'h77;
        8'hCB: Ebyte_out = 8'h99;
        8'hCC: Ebyte_out = 8'hB0;
        8'hCD: Ebyte_out = 8'hCB;
        8'hCE: Ebyte_out = 8'h46;
        8'hCF: Ebyte_out = 8'hCA;
        
        8'hD0: Ebyte_out = 8'h45;
        8'hD1: Ebyte_out = 8'hCF;
        8'hD2: Ebyte_out = 8'h4A;
        8'hD3: Ebyte_out = 8'hDE;
        8'hD4: Ebyte_out = 8'h79;
        8'hD5: Ebyte_out = 8'h8B;
        8'hD6: Ebyte_out = 8'h86;
        8'hD7: Ebyte_out = 8'h91;
        8'hD8: Ebyte_out = 8'hA8;
        8'hD9: Ebyte_out = 8'hE3;
        8'hDA: Ebyte_out = 8'h3E;
        8'hDB: Ebyte_out = 8'h42;
        8'hDC: Ebyte_out = 8'hC6;
        8'hDD: Ebyte_out = 8'h51;
        8'hDE: Ebyte_out = 8'hF3;
        8'hDF: Ebyte_out = 8'h0E;
        
        8'hE0: Ebyte_out = 8'h12;
        8'hE1: Ebyte_out = 8'h36;
        8'hE2: Ebyte_out = 8'h5A;
        8'hE3: Ebyte_out = 8'hEE;
        8'hE4: Ebyte_out = 8'h29;
        8'hE5: Ebyte_out = 8'h7B;
        8'hE6: Ebyte_out = 8'h8D;
        8'hE7: Ebyte_out = 8'h8C;
        8'hE8: Ebyte_out = 8'h8F;
        8'hE9: Ebyte_out = 8'h8A;
        8'hEA: Ebyte_out = 8'h85;
        8'hEB: Ebyte_out = 8'h94;
        8'hEC: Ebyte_out = 8'hA7;
        8'hED: Ebyte_out = 8'hF2;
        8'hEE: Ebyte_out = 8'h0D;
        8'hEF: Ebyte_out = 8'h17;
        
        8'hF0: Ebyte_out = 8'h39;
        8'hF1: Ebyte_out = 8'h4B;
        8'hF2: Ebyte_out = 8'hDD;
        8'hF3: Ebyte_out = 8'h7C;
        8'hF4: Ebyte_out = 8'h84;
        8'hF5: Ebyte_out = 8'h97;
        8'hF6: Ebyte_out = 8'hA2;
        8'hF7: Ebyte_out = 8'hFD;
        8'hF8: Ebyte_out = 8'h1C;
        8'hF9: Ebyte_out = 8'h24;
        8'hFA: Ebyte_out = 8'h6C;
        8'hFB: Ebyte_out = 8'hB4;
        8'hFC: Ebyte_out = 8'hC7;
        8'hFD: Ebyte_out = 8'h52;
        8'hFE: Ebyte_out = 8'hF6;
        8'hFF: Ebyte_out = 8'h01;
        endcase
    end
endfunction

// L-Table
function [7:0] Lbyte_out;
input    [7:0] Lbyte_in;
begin
    case (Lbyte_in)
        8'h00: Lbyte_out = 8'h00;
        8'h01: Lbyte_out = 8'h00;
        8'h02: Lbyte_out = 8'h19;
        8'h03: Lbyte_out = 8'h01;
        8'h04: Lbyte_out = 8'h32;
        8'h05: Lbyte_out = 8'h02;
        8'h06: Lbyte_out = 8'h1A;
        8'h07: Lbyte_out = 8'hC6;
        8'h08: Lbyte_out = 8'h4B;
        8'h09: Lbyte_out = 8'hC7; // 
        8'h0A: Lbyte_out = 8'h1B;
        8'h0B: Lbyte_out = 8'h68;
        8'h0C: Lbyte_out = 8'h33;
        8'h0D: Lbyte_out = 8'hEE;
        8'h0E: Lbyte_out = 8'hDF;
        8'h0F: Lbyte_out = 8'h03;
        
        8'h10: Lbyte_out = 8'h64;
        8'h11: Lbyte_out = 8'h04;
        8'h12: Lbyte_out = 8'hE0;
        8'h13: Lbyte_out = 8'h0E;
        8'h14: Lbyte_out = 8'h34;
        8'h15: Lbyte_out = 8'h8D;
        8'h16: Lbyte_out = 8'h81;
        8'h17: Lbyte_out = 8'hEF;
        8'h18: Lbyte_out = 8'h4C;
        8'h19: Lbyte_out = 8'h71;
        8'h1A: Lbyte_out = 8'h08;
        8'h1B: Lbyte_out = 8'hC8;
        8'h1C: Lbyte_out = 8'hF8;
        8'h1D: Lbyte_out = 8'h69;
        8'h1E: Lbyte_out = 8'h1C;
        8'h1F: Lbyte_out = 8'hC1;
        
        8'h20: Lbyte_out = 8'h7D;
        8'h21: Lbyte_out = 8'hC2;
        8'h22: Lbyte_out = 8'h1D;
        8'h23: Lbyte_out = 8'hB5;
        8'h24: Lbyte_out = 8'hF9;
        8'h25: Lbyte_out = 8'hB9;
        8'h26: Lbyte_out = 8'h27;
        8'h27: Lbyte_out = 8'h6A;
        8'h28: Lbyte_out = 8'h4D;
        8'h29: Lbyte_out = 8'hE4;
        8'h2A: Lbyte_out = 8'hA6;
        8'h2B: Lbyte_out = 8'h72;
        8'h2C: Lbyte_out = 8'h9A;
        8'h2D: Lbyte_out = 8'hC9;
        8'h2E: Lbyte_out = 8'h09;
        8'h2F: Lbyte_out = 8'h78;
        
        8'h30: Lbyte_out = 8'h65;
        8'h31: Lbyte_out = 8'h2F;
        8'h32: Lbyte_out = 8'h8A;
        8'h33: Lbyte_out = 8'h05;
        8'h34: Lbyte_out = 8'h21;
        8'h35: Lbyte_out = 8'h0F;
        8'h36: Lbyte_out = 8'hE1;
        8'h37: Lbyte_out = 8'h24;
        8'h38: Lbyte_out = 8'h12;
        8'h39: Lbyte_out = 8'hF0;
        8'h3A: Lbyte_out = 8'h82;
        8'h3B: Lbyte_out = 8'h45;
        8'h3C: Lbyte_out = 8'h35;
        8'h3D: Lbyte_out = 8'h93;
        8'h3E: Lbyte_out = 8'hDA;
        8'h3F: Lbyte_out = 8'h8E;
        
        8'h40: Lbyte_out = 8'h96;
        8'h41: Lbyte_out = 8'h8F;
        8'h42: Lbyte_out = 8'hDB;
        8'h43: Lbyte_out = 8'hBD;
        8'h44: Lbyte_out = 8'h36;
        8'h45: Lbyte_out = 8'hD0;
        8'h46: Lbyte_out = 8'hCE;
        8'h47: Lbyte_out = 8'h94;
        8'h48: Lbyte_out = 8'h13;
        8'h49: Lbyte_out = 8'h5C;
        8'h4A: Lbyte_out = 8'hD2;
        8'h4B: Lbyte_out = 8'hF1;
        8'h4C: Lbyte_out = 8'h40;
        8'h4D: Lbyte_out = 8'h46;
        8'h4E: Lbyte_out = 8'h83;
        8'h4F: Lbyte_out = 8'h38;
        
        8'h50: Lbyte_out = 8'h66;
        8'h51: Lbyte_out = 8'hDD;
        8'h52: Lbyte_out = 8'hFD;
        8'h53: Lbyte_out = 8'h30;
        8'h54: Lbyte_out = 8'hBF;
        8'h55: Lbyte_out = 8'h06;
        8'h56: Lbyte_out = 8'h8B;
        8'h57: Lbyte_out = 8'h62;
        8'h58: Lbyte_out = 8'hB3;
        8'h59: Lbyte_out = 8'h25;
        8'h5A: Lbyte_out = 8'hE2;
        8'h5B: Lbyte_out = 8'h98;
        8'h5C: Lbyte_out = 8'h22;
        8'h5D: Lbyte_out = 8'h88;
        8'h5E: Lbyte_out = 8'h91;
        8'h5F: Lbyte_out = 8'h10;
        
        8'h60: Lbyte_out = 8'h7E;
        8'h61: Lbyte_out = 8'h6E;
        8'h62: Lbyte_out = 8'h48;
        8'h63: Lbyte_out = 8'hC3;
        8'h64: Lbyte_out = 8'hA3;
        8'h65: Lbyte_out = 8'hB6;
        8'h66: Lbyte_out = 8'h1E;
        8'h67: Lbyte_out = 8'h42;
        8'h68: Lbyte_out = 8'h3A;
        8'h69: Lbyte_out = 8'h6B;
        8'h6A: Lbyte_out = 8'h28;
        8'h6B: Lbyte_out = 8'h54;
        8'h6C: Lbyte_out = 8'hFA;
        8'h6D: Lbyte_out = 8'h85;
        8'h6E: Lbyte_out = 8'h3D;
        8'h6F: Lbyte_out = 8'hBA;
        
        8'h70: Lbyte_out = 8'h2B;
        8'h71: Lbyte_out = 8'h79;
        8'h72: Lbyte_out = 8'h0A;
        8'h73: Lbyte_out = 8'h15;
        8'h74: Lbyte_out = 8'h9B;
        8'h75: Lbyte_out = 8'h9F;
        8'h76: Lbyte_out = 8'h5E;
        8'h77: Lbyte_out = 8'hCA;
        8'h78: Lbyte_out = 8'h4E;
        8'h79: Lbyte_out = 8'hD4;
        8'h7A: Lbyte_out = 8'hAC;
        8'h7B: Lbyte_out = 8'hE5;
        8'h7C: Lbyte_out = 8'hF3;
        8'h7D: Lbyte_out = 8'h73;
        8'h7E: Lbyte_out = 8'hA7;
        8'h7F: Lbyte_out = 8'h57;
        
        8'h80: Lbyte_out = 8'hAF;
        8'h81: Lbyte_out = 8'h58;
        8'h82: Lbyte_out = 8'hA8;
        8'h83: Lbyte_out = 8'h50;
        8'h84: Lbyte_out = 8'hF4;
        8'h85: Lbyte_out = 8'hEA;
        8'h86: Lbyte_out = 8'hD6;
        8'h87: Lbyte_out = 8'h74;
        8'h88: Lbyte_out = 8'h4F; //
        8'h89: Lbyte_out = 8'hAE;
        8'h8A: Lbyte_out = 8'hE9;
        8'h8B: Lbyte_out = 8'hD5;
        8'h8C: Lbyte_out = 8'hE7;
        8'h8D: Lbyte_out = 8'hE6;
        8'h8E: Lbyte_out = 8'hAD;
        8'h8F: Lbyte_out = 8'hE8;
        
        8'h90: Lbyte_out = 8'h2C;
        8'h91: Lbyte_out = 8'hD7;
        8'h92: Lbyte_out = 8'h75;
        8'h93: Lbyte_out = 8'h7A;
        8'h94: Lbyte_out = 8'hEB;
        8'h95: Lbyte_out = 8'h16;
        8'h96: Lbyte_out = 8'h0B;
        8'h97: Lbyte_out = 8'hF5;
        8'h98: Lbyte_out = 8'h59;
        8'h99: Lbyte_out = 8'hCB;
        8'h9A: Lbyte_out = 8'h5F;
        8'h9B: Lbyte_out = 8'hB0;
        8'h9C: Lbyte_out = 8'h9C;
        8'h9D: Lbyte_out = 8'hA9;
        8'h9E: Lbyte_out = 8'h51;
        8'h9F: Lbyte_out = 8'hA0;
        
        8'hA0: Lbyte_out = 8'h7F;
        8'hA1: Lbyte_out = 8'h0C;
        8'hA2: Lbyte_out = 8'hF6;
        8'hA3: Lbyte_out = 8'h6F;
        8'hA4: Lbyte_out = 8'h17;
        8'hA5: Lbyte_out = 8'hC4;
        8'hA6: Lbyte_out = 8'h49;
        8'hA7: Lbyte_out = 8'hEC;
        8'hA8: Lbyte_out = 8'hD8;
        8'hA9: Lbyte_out = 8'h43;
        8'hAA: Lbyte_out = 8'h1F;
        8'hAB: Lbyte_out = 8'h2D;
        8'hAC: Lbyte_out = 8'hA4;
        8'hAD: Lbyte_out = 8'h76;
        8'hAE: Lbyte_out = 8'h7B;
        8'hAF: Lbyte_out = 8'hB7;
        
        8'hB0: Lbyte_out = 8'hCC;
        8'hB1: Lbyte_out = 8'hBB;
        8'hB2: Lbyte_out = 8'h3E;
        8'hB3: Lbyte_out = 8'h5A;
        8'hB4: Lbyte_out = 8'hFB;
        8'hB5: Lbyte_out = 8'h60;
        8'hB6: Lbyte_out = 8'hB1;
        8'hB7: Lbyte_out = 8'h86;
        8'hB8: Lbyte_out = 8'h3B;
        8'hB9: Lbyte_out = 8'h52;
        8'hBA: Lbyte_out = 8'hA1;
        8'hBB: Lbyte_out = 8'h6C;
        8'hBC: Lbyte_out = 8'hAA;
        8'hBD: Lbyte_out = 8'h55;
        8'hBE: Lbyte_out = 8'h29;
        8'hBF: Lbyte_out = 8'h9D;
        
        8'hC0: Lbyte_out = 8'h97;
        8'hC1: Lbyte_out = 8'hB2;
        8'hC2: Lbyte_out = 8'h87;
        8'hC3: Lbyte_out = 8'h90;
        8'hC4: Lbyte_out = 8'h61;
        8'hC5: Lbyte_out = 8'hBE;
        8'hC6: Lbyte_out = 8'hDC;
        8'hC7: Lbyte_out = 8'hFC;
        8'hC8: Lbyte_out = 8'hBC;
        8'hC9: Lbyte_out = 8'h95;
        8'hCA: Lbyte_out = 8'hCF;
        8'hCB: Lbyte_out = 8'hCD;
        8'hCC: Lbyte_out = 8'h37;
        8'hCD: Lbyte_out = 8'h3F;
        8'hCE: Lbyte_out = 8'h5B;
        8'hCF: Lbyte_out = 8'hD1;
        
        8'hD0: Lbyte_out = 8'h53;
        8'hD1: Lbyte_out = 8'h39;
        8'hD2: Lbyte_out = 8'h84;
        8'hD3: Lbyte_out = 8'h3C;
        8'hD4: Lbyte_out = 8'h41;
        8'hD5: Lbyte_out = 8'hA2;
        8'hD6: Lbyte_out = 8'h6D;
        8'hD7: Lbyte_out = 8'h47;
        8'hD8: Lbyte_out = 8'h14;
        8'hD9: Lbyte_out = 8'h2A;
        8'hDA: Lbyte_out = 8'h9E;
        8'hDB: Lbyte_out = 8'h5D;
        8'hDC: Lbyte_out = 8'h56;
        8'hDD: Lbyte_out = 8'hF2;
        8'hDE: Lbyte_out = 8'hD3;
        8'hDF: Lbyte_out = 8'hAB;
        
        8'hE0: Lbyte_out = 8'h44;
        8'hE1: Lbyte_out = 8'h11;
        8'hE2: Lbyte_out = 8'h92;
        8'hE3: Lbyte_out = 8'hD9;
        8'hE4: Lbyte_out = 8'h23;
        8'hE5: Lbyte_out = 8'h20;
        8'hE6: Lbyte_out = 8'h2E;
        8'hE7: Lbyte_out = 8'h89;
        8'hE8: Lbyte_out = 8'hB4;
        8'hE9: Lbyte_out = 8'h7C;
        8'hEA: Lbyte_out = 8'hB8;
        8'hEB: Lbyte_out = 8'h26;
        8'hEC: Lbyte_out = 8'h77;
        8'hED: Lbyte_out = 8'h99;
        8'hEE: Lbyte_out = 8'hE3;
        8'hEF: Lbyte_out = 8'hA5;
        
        8'hF0: Lbyte_out = 8'h67;
        8'hF1: Lbyte_out = 8'h4A;
        8'hF2: Lbyte_out = 8'hED;
        8'hF3: Lbyte_out = 8'hDE;
        8'hF4: Lbyte_out = 8'hC5;
        8'hF5: Lbyte_out = 8'h31;
        8'hF6: Lbyte_out = 8'hFE;
        8'hF7: Lbyte_out = 8'h18;
        8'hF8: Lbyte_out = 8'h0D;
        8'hF9: Lbyte_out = 8'h63;
        8'hFA: Lbyte_out = 8'h8C;
        8'hFB: Lbyte_out = 8'h80;
        8'hFC: Lbyte_out = 8'hC0;
        8'hFD: Lbyte_out = 8'hF7;
        8'hFE: Lbyte_out = 8'h70;
        8'hFF: Lbyte_out = 8'h07;
    endcase
end
endfunction

//Column Table 
wire[31:0] c1, c2, c3, c4;
assign c1 = 31'h02030101;
assign c2 = 31'h01020301;
assign c3 = 31'h01010203;
assign c4 = 31'h03010102;

wire [7:0] data_i_15 = data_i[127:120];
wire [7:0] data_i_14 = data_i[119:112];
wire [7:0] data_i_13 = data_i[111:104];
wire [7:0] data_i_12 = data_i[103:96];
wire [7:0] data_i_11 = data_i[95:88];
wire [7:0] data_i_10 = data_i[87:80];
wire [7:0] data_i_9  = data_i[79:72];
wire [7:0] data_i_8  = data_i[71:64];
wire [7:0] data_i_7  = data_i[63:56];
wire [7:0] data_i_6  = data_i[55:48];
wire [7:0] data_i_5  = data_i[47:40];
wire [7:0] data_i_4  = data_i[39:32];
wire [7:0] data_i_3  = data_i[31:24];
wire [7:0] data_i_2  = data_i[23:16];
wire [7:0] data_i_1  = data_i[15:8];
wire [7:0] data_i_0  = data_i[7:0];

wire [7:0] S00 =   Ebyte_out((Lbyte_out(data_i_15) + Lbyte_out(02)))
                 ^ Ebyte_out((Lbyte_out(data_i_14) + Lbyte_out(03)))
                 ^ Ebyte_out((Lbyte_out(data_i_13) + Lbyte_out(01)))
                 ^ Ebyte_out((Lbyte_out(data_i_12) + Lbyte_out(01)));
                 
wire [7:0] S01 =   Ebyte_out((Lbyte_out(data_i_11) + Lbyte_out(02)))
                 ^ Ebyte_out((Lbyte_out(data_i_10) + Lbyte_out(03)))
                 ^ Ebyte_out((Lbyte_out(data_i_9)  + Lbyte_out(01)))
                 ^ Ebyte_out((Lbyte_out(data_i_8)  + Lbyte_out(01)));
                 
wire [7:0] S02 =   Ebyte_out((Lbyte_out(data_i_7) + Lbyte_out(02)))
                 ^ Ebyte_out((Lbyte_out(data_i_6) + Lbyte_out(03)))
                 ^ Ebyte_out((Lbyte_out(data_i_5) + Lbyte_out(01)))
                 ^ Ebyte_out((Lbyte_out(data_i_4) + Lbyte_out(01))); 
                    
wire [7:0] S03 =   Ebyte_out((Lbyte_out(data_i_3) + Lbyte_out(02)))
                 ^ Ebyte_out((Lbyte_out(data_i_2) + Lbyte_out(03)))
                 ^ Ebyte_out((Lbyte_out(data_i_1) + Lbyte_out(01)))
                 ^ Ebyte_out((Lbyte_out(data_i_0) + Lbyte_out(01))); 
                 
wire [7:0] S10 =   Ebyte_out((Lbyte_out(data_i_15) + Lbyte_out(01)))
                 ^ Ebyte_out((Lbyte_out(data_i_14) + Lbyte_out(02)))
                 ^ Ebyte_out((Lbyte_out(data_i_13) + Lbyte_out(03)))
                 ^ Ebyte_out((Lbyte_out(data_i_12) + Lbyte_out(01)));
                 
wire [7:0] S11 =   Ebyte_out((Lbyte_out(data_i_11) + Lbyte_out(01)))
                 ^ Ebyte_out((Lbyte_out(data_i_10) + Lbyte_out(02)))
                 ^ Ebyte_out((Lbyte_out(data_i_9)  + Lbyte_out(03)))
                 ^ Ebyte_out((Lbyte_out(data_i_8)  + Lbyte_out(01)));
                   
wire [7:0] S12 =   Ebyte_out((Lbyte_out(data_i_7) + Lbyte_out(01)))
                 ^ Ebyte_out((Lbyte_out(data_i_6) + Lbyte_out(02)))
                 ^ Ebyte_out((Lbyte_out(data_i_5) + Lbyte_out(03)))
                 ^ Ebyte_out((Lbyte_out(data_i_4) + Lbyte_out(01))); 
                 
wire [7:0] S13 =   Ebyte_out((Lbyte_out(data_i_3) + Lbyte_out(01)))
                 ^ Ebyte_out((Lbyte_out(data_i_2) + Lbyte_out(02)))
                 ^ Ebyte_out((Lbyte_out(data_i_1) + Lbyte_out(03)))
                 ^ Ebyte_out((Lbyte_out(data_i_0) + Lbyte_out(01))); 

wire [7:0] S20 =   Ebyte_out((Lbyte_out(data_i_15) + Lbyte_out(01)))
                 ^ Ebyte_out((Lbyte_out(data_i_14) + Lbyte_out(01)))
                 ^ Ebyte_out((Lbyte_out(data_i_13) + Lbyte_out(02)))
                 ^ Ebyte_out((Lbyte_out(data_i_12) + Lbyte_out(03)));
                 
wire [7:0] S21 =   Ebyte_out((Lbyte_out(data_i_11) + Lbyte_out(01)))
                 ^ Ebyte_out((Lbyte_out(data_i_10) + Lbyte_out(01)))
                 ^ Ebyte_out((Lbyte_out(data_i_9)  + Lbyte_out(02)))
                 ^ Ebyte_out((Lbyte_out(data_i_8)  + Lbyte_out(03))); 
                  
wire [7:0] S22 =   Ebyte_out((Lbyte_out(data_i_7) + Lbyte_out(01)))
                 ^ Ebyte_out((Lbyte_out(data_i_6) + Lbyte_out(01)))
                 ^ Ebyte_out((Lbyte_out(data_i_5) + Lbyte_out(02)))
                 ^ Ebyte_out((Lbyte_out(data_i_4) + Lbyte_out(03)));
                  
wire [7:0] S23 =   Ebyte_out((Lbyte_out(data_i_3) + Lbyte_out(01)))
                 ^ Ebyte_out((Lbyte_out(data_i_2) + Lbyte_out(01)))
                 ^ Ebyte_out((Lbyte_out(data_i_1) + Lbyte_out(02)))
                 ^ Ebyte_out((Lbyte_out(data_i_0) + Lbyte_out(03))); 
                 
wire [7:0] S30 =   Ebyte_out((Lbyte_out(data_i_15) + Lbyte_out(03)))
                 ^ Ebyte_out((Lbyte_out(data_i_14) + Lbyte_out(01)))
                 ^ Ebyte_out((Lbyte_out(data_i_13) + Lbyte_out(01)))
                 ^ Ebyte_out((Lbyte_out(data_i_12) + Lbyte_out(02)));
                 
wire [7:0] S31 =   Ebyte_out((Lbyte_out(data_i_11) + Lbyte_out(03)))
                 ^ Ebyte_out((Lbyte_out(data_i_10) + Lbyte_out(01)))
                 ^ Ebyte_out((Lbyte_out(data_i_9)  + Lbyte_out(01)))
                 ^ Ebyte_out((Lbyte_out(data_i_8)  + Lbyte_out(02))); 
                  
wire [7:0] S32 =   Ebyte_out((Lbyte_out(data_i_7) + Lbyte_out(03)))
                 ^ Ebyte_out((Lbyte_out(data_i_6) + Lbyte_out(01)))
                 ^ Ebyte_out((Lbyte_out(data_i_5) + Lbyte_out(01)))
                 ^ Ebyte_out((Lbyte_out(data_i_4) + Lbyte_out(02)));
                  
wire [7:0] S33 =   Ebyte_out((Lbyte_out(data_i_3) + Lbyte_out(03)))
                 ^ Ebyte_out((Lbyte_out(data_i_2) + Lbyte_out(01)))
                 ^ Ebyte_out((Lbyte_out(data_i_1) + Lbyte_out(01)))
                 ^ Ebyte_out((Lbyte_out(data_i_0) + Lbyte_out(02))); 


/*always@(posedge clk_i, negedge rst_n_i)
    begin
        if(!rst_n_i)
        data_o = 128'd0;
        else
        data_o = {S00, S10, S20, S30,
                  S01, S11, S21, S31,
                  S02, S12, S22, S32,
                  S03, S13, S23, S33};              
    end */  
assign   data_o = {S00, S10, S20, S30,
                    S01, S11, S21, S31,
                    S02, S12, S22, S32,
                    S03, S13, S23, S33};                                                                                                                           
endmodule










