`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/17/2018 10:36:30 PM
// Design Name: 
// Module Name: Kt_generation
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


module Kt_generation(
    input clk,
    input enable,
    input seed_DV,
    input[127:0] seed_data,
    input[127:0] plaintext,
    input RSTn,
    input flag,
    output[127:0] kt,
    output BSY
     );
     
     reg[127:0] kin;
     reg BSY;
     wire LFSR_done;
     reg[127:0] Din = 128'b0;
     reg Drdy =1;
     reg Krdy =1;
     reg EncDec =0;
     reg Kvld;
     reg Dvld;
     always @(!flag)
        begin
            LFSR(clk, enable, seed_DV, seed_data, kin, LFSR_done);
            AES_Comp(kin, Din, kt, Krdy, Drdy, EncDec, RSTn, enable, clk, BSY, Kvld, Dvld);    
         end
endmodule
