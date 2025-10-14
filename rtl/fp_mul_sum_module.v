`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/10/06 15:48:02
// Design Name: 
// Module Name: fp_mul_sum_module
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


module fp_mul_sum_module
#(
    parameter RST_MAX    = 8'd8   ,// 此时整个点积结束
    parameter SUM_START  = 8'd2     
)
(
    input   wire            aclk_1      ,
    input   wire            aclk_2      ,
    input   wire            aresetn     ,
    input   wire    [31:0]  in_A        ,
    input   wire    [31:0]  in_B        ,
    input   wire            finish      ,
    input   wire            in_valid    ,
    input   wire            in_acc_sign ,
    input   wire    [31:0]  custom_last ,
    input   wire            en_custom_last,
    
    output  wire    [31:0]  result_all  ,
    output  wire            sendable
);

wire    [31:0]  result_1_A  ;
wire    [31:0]  result_1_B  ;
wire    [31:0]  result_2_A  ;
wire    [31:0]  result_2_B  ;
wire    [31:0]  result_3_A  ;
wire    [31:0]  result_3_B  ;
wire    [31:0]  result_4_A  ;
wire    [31:0]  result_4_B  ;
wire    [31:0]  result_5_A  ;
wire    [31:0]  result_5_B  ;
wire    [31:0]  result_6_A  ;
wire    [31:0]  result_6_B  ;
wire    [31:0]  result_7_A  ;
wire    [31:0]  result_7_B  ;
wire    [31:0]  result_8_A  ;
wire    [31:0]  result_8_B  ;
                            
wire            acc_sign    ;
wire            clock_en_out;
wire            save_sign   ;

fp_mul_module#(
    .RST_MAX    (RST_MAX  ),
    .SUM_START  (SUM_START)
)
fp_mul_module_inst
(
    .aclk_1   (aclk_1      ),
    .aclk_2   (aclk_2      ),
    .aresetn  (aresetn     ),
    .in_A     (in_A       ),
    .in_B     (in_B       ),
    .finish   (finish     ),
    .in_valid    (in_valid   ),
    .in_acc_sign (in_acc_sign),
    
    .result_1_A  (result_1_A),
    .result_1_B  (result_1_B),
    .result_2_A  (result_2_A),
    .result_2_B  (result_2_B),
    .result_3_A  (result_3_A),
    .result_3_B  (result_3_B),
    .result_4_A  (result_4_A),
    .result_4_B  (result_4_B),
    .result_5_A  (result_5_A),
    .result_5_B  (result_5_B),
    .result_6_A  (result_6_A),
    .result_6_B  (result_6_B),
    .result_7_A  (result_7_A),
    .result_7_B  (result_7_B),
    .result_8_A  (result_8_A),
    .result_8_B  (result_8_B),
    
    .acc_sign    (acc_sign    ),
    .clock_en_out(clock_en_out),
    .sendable    (sendable    ),
    .save_sign   (save_sign   )    // clock_en上升沿时为1

);

fp_sum_module fp_sum_module_inst
(
    .aclk               (aclk_2      ),
    .aresetn            (aresetn     ),

    .in_11_A            (result_1_A),
    .in_11_B            (result_1_B),
    .in_12_A            (result_2_A),
    .in_12_B            (result_2_B),
    .in_13_A            (result_3_A),
    .in_13_B            (result_3_B),
    .in_14_A            (result_4_A),
    .in_14_B            (result_4_B),
    .in_15_A            (result_5_A),
    .in_15_B            (result_5_B),
    .in_16_A            (result_6_A),
    .in_16_B            (result_6_B),
    .in_17_A            (result_7_A),
    .in_17_B            (result_7_B),
    .in_18_A            (result_8_A),
    .in_18_B            (result_8_B),
            
            
    .acc_sign           (acc_sign),
    .custom_last        (custom_last   ),
    .en_custom_last     (en_custom_last),
    .clock_en           (clock_en_out),
    .save_sign          (save_sign),
        
    .result_all         (result_all)
    
    
);

endmodule
