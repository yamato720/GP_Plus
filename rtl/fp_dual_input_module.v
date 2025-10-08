`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/10/07 19:57:05
// Design Name: 
// Module Name: fp_dual_input_module
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


module fp_dual_input_module
#(
    parameter RST_MAX   =   8'd255      ,
    parameter SUM_START =   8'd64       
)
(
    input   wire            aclk        ,
    input   wire            aresetn     ,
    input   wire    [31:0]  in_A        ,
    input   wire    [31:0]  in_B        ,
    input   wire            finish      ,
    input   wire            in_valid    ,
    input   wire            in_acc_sign ,
    
    output  reg             out_acc_sign,
    output  reg             sendable    ,
    output  reg             clock_en    ,
    output  reg             save_sign   ,
    output  reg             sum_clock_en,
    
    output  reg     [31:0]  out_01_A    ,
    output  reg     [31:0]  out_01_B    ,
    output  reg     [31:0]  out_02_A    ,
    output  reg     [31:0]  out_02_B    ,
    output  reg     [31:0]  out_03_A    ,
    output  reg     [31:0]  out_03_B    ,
    output  reg     [31:0]  out_04_A    ,
    output  reg     [31:0]  out_04_B    ,
    output  reg     [31:0]  out_05_A    ,
    output  reg     [31:0]  out_05_B    ,
    output  reg     [31:0]  out_06_A    ,
    output  reg     [31:0]  out_06_B    ,
    output  reg     [31:0]  out_07_A    ,
    output  reg     [31:0]  out_07_B    ,
    output  reg     [31:0]  out_08_A    ,
    output  reg     [31:0]  out_08_B    ,
    output  reg     [31:0]  out_09_A    ,
    output  reg     [31:0]  out_09_B    ,
    output  reg     [31:0]  out_10_A    ,
    output  reg     [31:0]  out_10_B    ,
    output  reg     [31:0]  out_11_A    ,
    output  reg     [31:0]  out_11_B    ,
    output  reg     [31:0]  out_12_A    ,
    output  reg     [31:0]  out_12_B    ,
    output  reg     [31:0]  out_13_A    ,
    output  reg     [31:0]  out_13_B    ,
    output  reg     [31:0]  out_14_A    ,
    output  reg     [31:0]  out_14_B    ,
    output  reg     [31:0]  out_15_A    ,
    output  reg     [31:0]  out_15_B    ,
    output  reg     [31:0]  out_16_A    ,
    output  reg     [31:0]  out_16_B    
    
);











endmodule
