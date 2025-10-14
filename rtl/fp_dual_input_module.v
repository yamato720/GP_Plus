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


reg             counter_add ;
reg     [4:0]   counter     ;
reg     [7:0]   counter_rst ;

always@(posedge aclk or negedge aresetn)
    if(aresetn == 1'b0)
        counter <= 5'd0;
    else if(counter_rst == RST_MAX - 1)
        counter <= 5'd0;
    else if(finish == 1'b1)
        counter <= 5'd16;
    else if(counter < 5'd16 && counter_add == 1'b1)
        counter <= counter + 1'b1;
    else
        counter <= counter;

always@(posedge aclk or negedge aresetn)
    if(aresetn == 1'b0)
        counter_add <= 1'b0;
    else
        counter_add <= in_valid;
        
always@(posedge aclk or negedge aresetn)
    if(aresetn == 1'b0)
        counter_rst <= 8'd0;
    else if(counter_rst == RST_MAX)
        counter_rst <= 8'd0;
    else if(counter == 5'd16)
        counter_rst <= counter_rst + 1'b1;
    else
        counter_rst <= counter_rst;

always@(posedge aclk or negedge aresetn)
    if(aresetn == 1'b0)
        begin
            out_01_A    <=  32'd0;
            out_01_B    <=  32'd0;
            out_02_A    <=  32'd0;
            out_02_B    <=  32'd0;
            out_03_A    <=  32'd0;
            out_03_B    <=  32'd0;
            out_04_A    <=  32'd0;
            out_04_B    <=  32'd0;
            out_05_A    <=  32'd0;
            out_05_B    <=  32'd0;
            out_06_A    <=  32'd0;
            out_06_B    <=  32'd0;
            out_07_A    <=  32'd0;
            out_07_B    <=  32'd0;
            out_08_A    <=  32'd0;
            out_08_B    <=  32'd0;
            out_09_A    <=  32'd0;
            out_09_B    <=  32'd0;
            out_10_A    <=  32'd0;
            out_10_B    <=  32'd0;
            out_11_A    <=  32'd0;
            out_11_B    <=  32'd0;
            out_12_A    <=  32'd0;
            out_12_B    <=  32'd0;
            out_13_A    <=  32'd0;
            out_13_B    <=  32'd0;
            out_14_A    <=  32'd0;
            out_14_B    <=  32'd0;
            out_15_A    <=  32'd0;
            out_15_B    <=  32'd0;
            out_16_A    <=  32'd0;
            out_16_B    <=  32'd0;
        end
    else if(counter_rst == RST_MAX - 1)
        begin
            out_01_A    <=  32'd0;
            out_01_B    <=  32'd0;
            out_02_A    <=  32'd0;
            out_02_B    <=  32'd0;
            out_03_A    <=  32'd0;
            out_03_B    <=  32'd0;
            out_04_A    <=  32'd0;
            out_04_B    <=  32'd0;
            out_05_A    <=  32'd0;
            out_05_B    <=  32'd0;
            out_06_A    <=  32'd0;
            out_06_B    <=  32'd0;
            out_07_A    <=  32'd0;
            out_07_B    <=  32'd0;
            out_08_A    <=  32'd0;
            out_08_B    <=  32'd0;
            out_09_A    <=  32'd0;
            out_09_B    <=  32'd0;
            out_10_A    <=  32'd0;
            out_10_B    <=  32'd0;
            out_11_A    <=  32'd0;
            out_11_B    <=  32'd0;
            out_12_A    <=  32'd0;
            out_12_B    <=  32'd0;
            out_13_A    <=  32'd0;
            out_13_B    <=  32'd0;
            out_14_A    <=  32'd0;
            out_14_B    <=  32'd0;
            out_15_A    <=  32'd0;
            out_15_B    <=  32'd0;
            out_16_A    <=  32'd0;
            out_16_B    <=  32'd0;
        end
    else if(in_valid == 1'b1)
        case(counter)
        5'd0    :
                    begin
                        out_01_A    <=  in_A    ;
                        out_01_B    <=  in_B    ;
                        out_02_A    <=  out_02_A;
                        out_02_B    <=  out_02_B;
                        out_03_A    <=  out_03_A;
                        out_03_B    <=  out_03_B;
                        out_04_A    <=  out_04_A;
                        out_04_B    <=  out_04_B;
                        out_05_A    <=  out_05_A;
                        out_05_B    <=  out_05_B;
                        out_06_A    <=  out_06_A;
                        out_06_B    <=  out_06_B;
                        out_07_A    <=  out_07_A;
                        out_07_B    <=  out_07_B;
                        out_08_A    <=  out_08_A;
                        out_08_B    <=  out_08_B;
                        out_09_A    <=  out_09_A;
                        out_09_B    <=  out_09_B;
                        out_10_A    <=  out_10_A;
                        out_10_B    <=  out_10_B;
                        out_11_A    <=  out_11_A;
                        out_11_B    <=  out_11_B;
                        out_12_A    <=  out_12_A;
                        out_12_B    <=  out_12_B;
                        out_13_A    <=  out_13_A;
                        out_13_B    <=  out_13_B;
                        out_14_A    <=  out_14_A;
                        out_14_B    <=  out_14_B;
                        out_15_A    <=  out_15_A;
                        out_15_B    <=  out_15_B;
                        out_16_A    <=  out_16_A;
                        out_16_B    <=  out_16_B;
                    end
        5'd1    :
                    begin
                        out_01_A    <=  out_01_A;
                        out_01_B    <=  out_01_B;
                        out_02_A    <=  in_A    ;
                        out_02_B    <=  in_B    ;
                        out_03_A    <=  out_03_A;
                        out_03_B    <=  out_03_B;
                        out_04_A    <=  out_04_A;
                        out_04_B    <=  out_04_B;
                        out_05_A    <=  out_05_A;
                        out_05_B    <=  out_05_B;
                        out_06_A    <=  out_06_A;
                        out_06_B    <=  out_06_B;
                        out_07_A    <=  out_07_A;
                        out_07_B    <=  out_07_B;
                        out_08_A    <=  out_08_A;
                        out_08_B    <=  out_08_B;
                        out_09_A    <=  out_09_A;
                        out_09_B    <=  out_09_B;
                        out_10_A    <=  out_10_A;
                        out_10_B    <=  out_10_B;
                        out_11_A    <=  out_11_A;
                        out_11_B    <=  out_11_B;
                        out_12_A    <=  out_12_A;
                        out_12_B    <=  out_12_B;
                        out_13_A    <=  out_13_A;
                        out_13_B    <=  out_13_B;
                        out_14_A    <=  out_14_A;
                        out_14_B    <=  out_14_B;
                        out_15_A    <=  out_15_A;
                        out_15_B    <=  out_15_B;
                        out_16_A    <=  out_16_A;
                        out_16_B    <=  out_16_B;
                    end
        5'd2    :
                    begin
                        out_01_A    <=  out_01_A;
                        out_01_B    <=  out_01_B;
                        out_02_A    <=  out_02_A;
                        out_02_B    <=  out_02_B;
                        out_03_A    <=  in_A    ;
                        out_03_B    <=  in_B    ;
                        out_04_A    <=  out_04_A;
                        out_04_B    <=  out_04_B;
                        out_05_A    <=  out_05_A;
                        out_05_B    <=  out_05_B;
                        out_06_A    <=  out_06_A;
                        out_06_B    <=  out_06_B;
                        out_07_A    <=  out_07_A;
                        out_07_B    <=  out_07_B;
                        out_08_A    <=  out_08_A;
                        out_08_B    <=  out_08_B;
                        out_09_A    <=  out_09_A;
                        out_09_B    <=  out_09_B;
                        out_10_A    <=  out_10_A;
                        out_10_B    <=  out_10_B;
                        out_11_A    <=  out_11_A;
                        out_11_B    <=  out_11_B;
                        out_12_A    <=  out_12_A;
                        out_12_B    <=  out_12_B;
                        out_13_A    <=  out_13_A;
                        out_13_B    <=  out_13_B;
                        out_14_A    <=  out_14_A;
                        out_14_B    <=  out_14_B;
                        out_15_A    <=  out_15_A;
                        out_15_B    <=  out_15_B;
                        out_16_A    <=  out_16_A;
                        out_16_B    <=  out_16_B;
                    end
        5'd3    :
                    begin
                        out_01_A    <=  out_01_A;
                        out_01_B    <=  out_01_B;
                        out_02_A    <=  out_02_A;
                        out_02_B    <=  out_02_B;
                        out_03_A    <=  out_03_A;
                        out_03_B    <=  out_03_B;
                        out_04_A    <=  in_A    ;
                        out_04_B    <=  in_B    ;
                        out_05_A    <=  out_05_A;
                        out_05_B    <=  out_05_B;
                        out_06_A    <=  out_06_A;
                        out_06_B    <=  out_06_B;
                        out_07_A    <=  out_07_A;
                        out_07_B    <=  out_07_B;
                        out_08_A    <=  out_08_A;
                        out_08_B    <=  out_08_B;
                        out_09_A    <=  out_09_A;
                        out_09_B    <=  out_09_B;
                        out_10_A    <=  out_10_A;
                        out_10_B    <=  out_10_B;
                        out_11_A    <=  out_11_A;
                        out_11_B    <=  out_11_B;
                        out_12_A    <=  out_12_A;
                        out_12_B    <=  out_12_B;
                        out_13_A    <=  out_13_A;
                        out_13_B    <=  out_13_B;
                        out_14_A    <=  out_14_A;
                        out_14_B    <=  out_14_B;
                        out_15_A    <=  out_15_A;
                        out_15_B    <=  out_15_B;
                        out_16_A    <=  out_16_A;
                        out_16_B    <=  out_16_B;
                    end
        5'd4    :
                    begin
                        out_01_A    <=  out_01_A;
                        out_01_B    <=  out_01_B;
                        out_02_A    <=  out_02_A;
                        out_02_B    <=  out_02_B;
                        out_03_A    <=  out_03_A;
                        out_03_B    <=  out_03_B;
                        out_04_A    <=  out_04_A;
                        out_04_B    <=  out_04_B;
                        out_05_A    <=  in_A    ;
                        out_05_B    <=  in_B    ;
                        out_06_A    <=  out_06_A;
                        out_06_B    <=  out_06_B;
                        out_07_A    <=  out_07_A;
                        out_07_B    <=  out_07_B;
                        out_08_A    <=  out_08_A;
                        out_08_B    <=  out_08_B;
                        out_09_A    <=  out_09_A;
                        out_09_B    <=  out_09_B;
                        out_10_A    <=  out_10_A;
                        out_10_B    <=  out_10_B;
                        out_11_A    <=  out_11_A;
                        out_11_B    <=  out_11_B;
                        out_12_A    <=  out_12_A;
                        out_12_B    <=  out_12_B;
                        out_13_A    <=  out_13_A;
                        out_13_B    <=  out_13_B;
                        out_14_A    <=  out_14_A;
                        out_14_B    <=  out_14_B;
                        out_15_A    <=  out_15_A;
                        out_15_B    <=  out_15_B;
                        out_16_A    <=  out_16_A;
                        out_16_B    <=  out_16_B;
                    end
        5'd5    :
                    begin
                        out_01_A    <=  out_01_A;
                        out_01_B    <=  out_01_B;
                        out_02_A    <=  out_02_A;
                        out_02_B    <=  out_02_B;
                        out_03_A    <=  out_03_A;
                        out_03_B    <=  out_03_B;
                        out_04_A    <=  out_04_A;
                        out_04_B    <=  out_04_B;
                        out_05_A    <=  out_05_A;
                        out_05_B    <=  out_05_B;
                        out_06_A    <=  in_A    ;
                        out_06_B    <=  in_B    ;
                        out_07_A    <=  out_07_A;
                        out_07_B    <=  out_07_B;
                        out_08_A    <=  out_08_A;
                        out_08_B    <=  out_08_B;
                        out_09_A    <=  out_09_A;
                        out_09_B    <=  out_09_B;
                        out_10_A    <=  out_10_A;
                        out_10_B    <=  out_10_B;
                        out_11_A    <=  out_11_A;
                        out_11_B    <=  out_11_B;
                        out_12_A    <=  out_12_A;
                        out_12_B    <=  out_12_B;
                        out_13_A    <=  out_13_A;
                        out_13_B    <=  out_13_B;
                        out_14_A    <=  out_14_A;
                        out_14_B    <=  out_14_B;
                        out_15_A    <=  out_15_A;
                        out_15_B    <=  out_15_B;
                        out_16_A    <=  out_16_A;
                        out_16_B    <=  out_16_B;
                    end
        5'd6    :
                    begin
                        out_01_A    <=  out_01_A;
                        out_01_B    <=  out_01_B;
                        out_02_A    <=  out_02_A;
                        out_02_B    <=  out_02_B;
                        out_03_A    <=  out_03_A;
                        out_03_B    <=  out_03_B;
                        out_04_A    <=  out_04_A;
                        out_04_B    <=  out_04_B;
                        out_05_A    <=  out_05_A;
                        out_05_B    <=  out_05_B;
                        out_06_A    <=  out_06_A;
                        out_06_B    <=  out_06_B;
                        out_07_A    <=  in_A    ;
                        out_07_B    <=  in_B    ;
                        out_08_A    <=  out_08_A;
                        out_08_B    <=  out_08_B;
                        out_09_A    <=  out_09_A;
                        out_09_B    <=  out_09_B;
                        out_10_A    <=  out_10_A;
                        out_10_B    <=  out_10_B;
                        out_11_A    <=  out_11_A;
                        out_11_B    <=  out_11_B;
                        out_12_A    <=  out_12_A;
                        out_12_B    <=  out_12_B;
                        out_13_A    <=  out_13_A;
                        out_13_B    <=  out_13_B;
                        out_14_A    <=  out_14_A;
                        out_14_B    <=  out_14_B;
                        out_15_A    <=  out_15_A;
                        out_15_B    <=  out_15_B;
                        out_16_A    <=  out_16_A;
                        out_16_B    <=  out_16_B;
                    end
        5'd7    :
                    begin
                        out_01_A    <=  out_01_A;
                        out_01_B    <=  out_01_B;
                        out_02_A    <=  out_02_A;
                        out_02_B    <=  out_02_B;
                        out_03_A    <=  out_03_A;
                        out_03_B    <=  out_03_B;
                        out_04_A    <=  out_04_A;
                        out_04_B    <=  out_04_B;
                        out_05_A    <=  out_05_A;
                        out_05_B    <=  out_05_B;
                        out_06_A    <=  out_06_A;
                        out_06_B    <=  out_06_B;
                        out_07_A    <=  out_07_A;
                        out_07_B    <=  out_07_B;
                        out_08_A    <=  in_A    ;
                        out_08_B    <=  in_B    ;
                        out_09_A    <=  out_09_A;
                        out_09_B    <=  out_09_B;
                        out_10_A    <=  out_10_A;
                        out_10_B    <=  out_10_B;
                        out_11_A    <=  out_11_A;
                        out_11_B    <=  out_11_B;
                        out_12_A    <=  out_12_A;
                        out_12_B    <=  out_12_B;
                        out_13_A    <=  out_13_A;
                        out_13_B    <=  out_13_B;
                        out_14_A    <=  out_14_A;
                        out_14_B    <=  out_14_B;
                        out_15_A    <=  out_15_A;
                        out_15_B    <=  out_15_B;
                        out_16_A    <=  out_16_A;
                        out_16_B    <=  out_16_B;
                    end
        5'd8    :
                    begin
                        out_01_A    <=  out_01_A;
                        out_01_B    <=  out_01_B;
                        out_02_A    <=  out_02_A;
                        out_02_B    <=  out_02_B;
                        out_03_A    <=  out_03_A;
                        out_03_B    <=  out_03_B;
                        out_04_A    <=  out_04_A;
                        out_04_B    <=  out_04_B;
                        out_05_A    <=  out_05_A;
                        out_05_B    <=  out_05_B;
                        out_06_A    <=  out_06_A;
                        out_06_B    <=  out_06_B;
                        out_07_A    <=  out_07_A;
                        out_07_B    <=  out_07_B;
                        out_08_A    <=  out_08_A;
                        out_08_B    <=  out_08_B;
                        out_09_A    <=  in_A    ;
                        out_09_B    <=  in_B    ;
                        out_10_A    <=  out_10_A;
                        out_10_B    <=  out_10_B;
                        out_11_A    <=  out_11_A;
                        out_11_B    <=  out_11_B;
                        out_12_A    <=  out_12_A;
                        out_12_B    <=  out_12_B;
                        out_13_A    <=  out_13_A;
                        out_13_B    <=  out_13_B;
                        out_14_A    <=  out_14_A;
                        out_14_B    <=  out_14_B;
                        out_15_A    <=  out_15_A;
                        out_15_B    <=  out_15_B;
                        out_16_A    <=  out_16_A;
                        out_16_B    <=  out_16_B;
                    end
        5'd9    :
                    begin
                        out_01_A    <=  out_01_A;
                        out_01_B    <=  out_01_B;
                        out_02_A    <=  out_02_A;
                        out_02_B    <=  out_02_B;
                        out_03_A    <=  out_03_A;
                        out_03_B    <=  out_03_B;
                        out_04_A    <=  out_04_A;
                        out_04_B    <=  out_04_B;
                        out_05_A    <=  out_05_A;
                        out_05_B    <=  out_05_B;
                        out_06_A    <=  out_06_A;
                        out_06_B    <=  out_06_B;
                        out_07_A    <=  out_07_A;
                        out_07_B    <=  out_07_B;
                        out_08_A    <=  out_08_A;
                        out_08_B    <=  out_08_B;
                        out_09_A    <=  out_09_A;
                        out_09_B    <=  out_09_B;
                        out_10_A    <=  in_A    ;
                        out_10_B    <=  in_B    ;
                        out_11_A    <=  out_11_A;
                        out_11_B    <=  out_11_B;
                        out_12_A    <=  out_12_A;
                        out_12_B    <=  out_12_B;
                        out_13_A    <=  out_13_A;
                        out_13_B    <=  out_13_B;
                        out_14_A    <=  out_14_A;
                        out_14_B    <=  out_14_B;
                        out_15_A    <=  out_15_A;
                        out_15_B    <=  out_15_B;
                        out_16_A    <=  out_16_A;
                        out_16_B    <=  out_16_B;
                    end
        5'd10   :
                    begin
                        out_01_A    <=  out_01_A;
                        out_01_B    <=  out_01_B;
                        out_02_A    <=  out_02_A;
                        out_02_B    <=  out_02_B;
                        out_03_A    <=  out_03_A;
                        out_03_B    <=  out_03_B;
                        out_04_A    <=  out_04_A;
                        out_04_B    <=  out_04_B;
                        out_05_A    <=  out_05_A;
                        out_05_B    <=  out_05_B;
                        out_06_A    <=  out_06_A;
                        out_06_B    <=  out_06_B;
                        out_07_A    <=  out_07_A;
                        out_07_B    <=  out_07_B;
                        out_08_A    <=  out_08_A;
                        out_08_B    <=  out_08_B;
                        out_09_A    <=  out_09_A;
                        out_09_B    <=  out_09_B;
                        out_10_A    <=  out_10_A;
                        out_10_B    <=  out_10_B;
                        out_11_A    <=  in_A    ;
                        out_11_B    <=  in_B    ;
                        out_12_A    <=  out_12_A;
                        out_12_B    <=  out_12_B;
                        out_13_A    <=  out_13_A;
                        out_13_B    <=  out_13_B;
                        out_14_A    <=  out_14_A;
                        out_14_B    <=  out_14_B;
                        out_15_A    <=  out_15_A;
                        out_15_B    <=  out_15_B;
                        out_16_A    <=  out_16_A;
                        out_16_B    <=  out_16_B;
                    end
        5'd11    :
                    begin
                        
                        out_01_A    <=  out_01_A;
                        out_01_B    <=  out_01_B;
                        out_02_A    <=  out_02_A;
                        out_02_B    <=  out_02_B;
                        out_03_A    <=  out_03_A;
                        out_03_B    <=  out_03_B;
                        out_04_A    <=  out_04_A;
                        out_04_B    <=  out_04_B;
                        out_05_A    <=  out_05_A;
                        out_05_B    <=  out_05_B;
                        out_06_A    <=  out_06_A;
                        out_06_B    <=  out_06_B;
                        out_07_A    <=  out_07_A;
                        out_07_B    <=  out_07_B;
                        out_08_A    <=  out_08_A;
                        out_08_B    <=  out_08_B;
                        out_09_A    <=  out_09_A;
                        out_09_B    <=  out_09_B;
                        out_10_A    <=  out_10_A;
                        out_10_B    <=  out_10_B;
                        out_11_A    <=  out_11_A;
                        out_11_B    <=  out_11_B;
                        out_12_A    <=  in_A    ;
                        out_12_B    <=  in_B    ;
                        out_13_A    <=  out_13_A;
                        out_13_B    <=  out_13_B;
                        out_14_A    <=  out_14_A;
                        out_14_B    <=  out_14_B;
                        out_15_A    <=  out_15_A;
                        out_15_B    <=  out_15_B;
                        out_16_A    <=  out_16_A;
                        out_16_B    <=  out_16_B;
                    end
        5'd12    :
                    begin
                        out_01_A    <=  out_01_A;
                        out_01_B    <=  out_01_B;
                        out_02_A    <=  out_02_A;
                        out_02_B    <=  out_02_B;
                        out_03_A    <=  out_03_A;
                        out_03_B    <=  out_03_B;
                        out_04_A    <=  out_04_A;
                        out_04_B    <=  out_04_B;
                        out_05_A    <=  out_05_A;
                        out_05_B    <=  out_05_B;
                        out_06_A    <=  out_06_A;
                        out_06_B    <=  out_06_B;
                        out_07_A    <=  out_07_A;
                        out_07_B    <=  out_07_B;
                        out_08_A    <=  out_08_A;
                        out_08_B    <=  out_08_B;
                        out_09_A    <=  out_09_A;
                        out_09_B    <=  out_09_B;
                        out_10_A    <=  out_10_A;
                        out_10_B    <=  out_10_B;
                        out_11_A    <=  out_11_A;
                        out_11_B    <=  out_11_B;
                        out_12_A    <=  out_12_A;
                        out_12_B    <=  out_12_B;
                        out_13_A    <=  in_A    ;
                        out_13_B    <=  in_B    ;
                        out_14_A    <=  out_14_A;
                        out_14_B    <=  out_14_B;
                        out_15_A    <=  out_15_A;
                        out_15_B    <=  out_15_B;
                        out_16_A    <=  out_16_A;
                        out_16_B    <=  out_16_B;
                    end
        5'd13    :
                    begin
                        out_01_A    <=  out_01_A;
                        out_01_B    <=  out_01_B;
                        out_02_A    <=  out_02_A;
                        out_02_B    <=  out_02_B;
                        out_03_A    <=  out_03_A;
                        out_03_B    <=  out_03_B;
                        out_04_A    <=  out_04_A;
                        out_04_B    <=  out_04_B;
                        out_05_A    <=  out_05_A;
                        out_05_B    <=  out_05_B;
                        out_06_A    <=  out_06_A;
                        out_06_B    <=  out_06_B;
                        out_07_A    <=  out_07_A;
                        out_07_B    <=  out_07_B;
                        out_08_A    <=  out_08_A;
                        out_08_B    <=  out_08_B;
                        out_09_A    <=  out_09_A;
                        out_09_B    <=  out_09_B;
                        out_10_A    <=  out_10_A;
                        out_10_B    <=  out_10_B;
                        out_11_A    <=  out_11_A;
                        out_11_B    <=  out_11_B;
                        out_12_A    <=  out_12_A;
                        out_12_B    <=  out_12_B;
                        out_13_A    <=  out_13_A;
                        out_13_B    <=  out_13_B;
                        out_14_A    <=  in_A    ;
                        out_14_B    <=  in_B    ;
                        out_15_A    <=  out_15_A;
                        out_15_B    <=  out_15_B;
                        out_16_A    <=  out_16_A;
                        out_16_B    <=  out_16_B;
                    end
        5'd14    :
                    begin
                        out_01_A    <=  out_01_A;
                        out_01_B    <=  out_01_B;
                        out_02_A    <=  out_02_A;
                        out_02_B    <=  out_02_B;
                        out_03_A    <=  out_03_A;
                        out_03_B    <=  out_03_B;
                        out_04_A    <=  out_04_A;
                        out_04_B    <=  out_04_B;
                        out_05_A    <=  out_05_A;
                        out_05_B    <=  out_05_B;
                        out_06_A    <=  out_06_A;
                        out_06_B    <=  out_06_B;
                        out_07_A    <=  out_07_A;
                        out_07_B    <=  out_07_B;
                        out_08_A    <=  out_08_A;
                        out_08_B    <=  out_08_B;
                        out_09_A    <=  out_09_A;
                        out_09_B    <=  out_09_B;
                        out_10_A    <=  out_10_A;
                        out_10_B    <=  out_10_B;
                        out_11_A    <=  out_11_A;
                        out_11_B    <=  out_11_B;
                        out_12_A    <=  out_12_A;
                        out_12_B    <=  out_12_B;
                        out_13_A    <=  out_13_A;
                        out_13_B    <=  out_13_B;
                        out_14_A    <=  out_14_A;
                        out_14_B    <=  out_14_B;
                        out_15_A    <=  in_A    ;
                        out_15_B    <=  in_B    ;
                        out_16_A    <=  out_16_A;
                        out_16_B    <=  out_16_B;
                    end
        5'd15    :
                    begin
                        out_01_A    <=  out_01_A;
                        out_01_B    <=  out_01_B;
                        out_02_A    <=  out_02_A;
                        out_02_B    <=  out_02_B;
                        out_03_A    <=  out_03_A;
                        out_03_B    <=  out_03_B;
                        out_04_A    <=  out_04_A;
                        out_04_B    <=  out_04_B;
                        out_05_A    <=  out_05_A;
                        out_05_B    <=  out_05_B;
                        out_06_A    <=  out_06_A;
                        out_06_B    <=  out_06_B;
                        out_07_A    <=  out_07_A;
                        out_07_B    <=  out_07_B;
                        out_08_A    <=  out_08_A;
                        out_08_B    <=  out_08_B;
                        out_09_A    <=  out_09_A;
                        out_09_B    <=  out_09_B;
                        out_10_A    <=  out_10_A;
                        out_10_B    <=  out_10_B;
                        out_11_A    <=  out_11_A;
                        out_11_B    <=  out_11_B;
                        out_12_A    <=  out_12_A;
                        out_12_B    <=  out_12_B;
                        out_13_A    <=  out_13_A;
                        out_13_B    <=  out_13_B;
                        out_14_A    <=  out_14_A;
                        out_14_B    <=  out_14_B;
                        out_15_A    <=  out_15_A;
                        out_15_B    <=  out_15_B;
                        out_16_A    <=  in_A    ;
                        out_16_B    <=  in_B    ;
                    end
        default :
                    begin
                        out_01_A    <=  out_01_A;
                        out_01_B    <=  out_01_B;
                        out_02_A    <=  out_02_A;
                        out_02_B    <=  out_02_B;
                        out_03_A    <=  out_03_A;
                        out_03_B    <=  out_03_B;
                        out_04_A    <=  out_04_A;
                        out_04_B    <=  out_04_B;
                        out_05_A    <=  out_05_A;
                        out_05_B    <=  out_05_B;
                        out_06_A    <=  out_06_A;
                        out_06_B    <=  out_06_B;
                        out_07_A    <=  out_07_A;
                        out_07_B    <=  out_07_B;
                        out_08_A    <=  out_08_A;
                        out_08_B    <=  out_08_B;
                        out_09_A    <=  out_09_A;
                        out_09_B    <=  out_09_B;
                        out_10_A    <=  out_10_A;
                        out_10_B    <=  out_10_B;
                        out_11_A    <=  out_11_A;
                        out_11_B    <=  out_11_B;
                        out_12_A    <=  out_12_A;
                        out_12_B    <=  out_12_B;
                        out_13_A    <=  out_13_A;
                        out_13_B    <=  out_13_B;
                        out_14_A    <=  out_14_A;
                        out_14_B    <=  out_14_B;
                        out_15_A    <=  out_15_A;
                        out_15_B    <=  out_15_B;
                        out_16_A    <=  out_16_A;
                        out_16_B    <=  out_16_B;
                    end
        endcase
    else
        begin
            out_01_A    <=  out_01_A;
            out_01_B    <=  out_01_B;
            out_02_A    <=  out_02_A;
            out_02_B    <=  out_02_B;
            out_03_A    <=  out_03_A;
            out_03_B    <=  out_03_B;
            out_04_A    <=  out_04_A;
            out_04_B    <=  out_04_B;
            out_05_A    <=  out_05_A;
            out_05_B    <=  out_05_B;
            out_06_A    <=  out_06_A;
            out_06_B    <=  out_06_B;
            out_07_A    <=  out_07_A;
            out_07_B    <=  out_07_B;
            out_08_A    <=  out_08_A;
            out_08_B    <=  out_08_B;
            out_09_A    <=  out_09_A;
            out_09_B    <=  out_09_B;
            out_10_A    <=  out_10_A;
            out_10_B    <=  out_10_B;
            out_11_A    <=  out_11_A;
            out_11_B    <=  out_11_B;
            out_12_A    <=  out_12_A;
            out_12_B    <=  out_12_B;
            out_13_A    <=  out_13_A;
            out_13_B    <=  out_13_B;
            out_14_A    <=  out_14_A;
            out_14_B    <=  out_14_B;
            out_15_A    <=  out_15_A;
            out_15_B    <=  out_15_B;
            out_16_A    <=  out_16_A;
            out_16_B    <=  out_16_B;
        end
        
        

always@(posedge aclk or negedge aresetn)
    if(aresetn == 1'b0)
        out_acc_sign <= 1'b0;
    else if(counter_rst == 8'd1)
        out_acc_sign <= in_acc_sign;
    else
        out_acc_sign <= out_acc_sign;

        
always@(posedge aclk or negedge aresetn)
    if(aresetn == 1'b0)
        sendable <= 1'b0;
    else if(counter_rst == 8'd0 || counter_rst == RST_MAX)
        sendable <= 1'b1;
    else
        sendable <= 1'b0;
        
always@(posedge aclk or negedge aresetn)
    if(aresetn == 1'b0)
        clock_en <= 1'b0;
    else if(counter_rst == 8'd0 || counter_rst == RST_MAX)
        clock_en <= 1'b0;
    else
        clock_en <= 1'b1;
        
always@(posedge aclk or negedge aresetn)
    if(aresetn == 1'b0)
        save_sign <= 1'b0;
    else if(counter_rst == 8'd1)
        save_sign <= 1'b1;
    else
        save_sign <= 1'b0;
        
always@(posedge aclk or negedge aresetn)
    if(aresetn == 1'b0)
        sum_clock_en <= 1'b0;
    else if(counter_rst < SUM_START || counter_rst == RST_MAX)
        sum_clock_en <= 1'b0;
    else
        sum_clock_en <= 1'b1;












endmodule
