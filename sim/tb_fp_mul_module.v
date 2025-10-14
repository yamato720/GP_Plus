`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/10/09 01:35:22
// Design Name: 
// Module Name: tb_fp_mul_module
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


module tb_fp_mul_module(

    );



reg             aclk     ;
reg             aresetn   ;
reg     [31:0]  in_A        ;
reg     [31:0]  in_B        ;
reg             finish      ;
reg             in_valid    ;
reg             in_acc_sign ;
                            
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
wire            sendable    ;
wire            save_sign   ;


initial
    begin
        aclk     = 1'b0;
        aresetn   = 1'b0;
        in_A        = 32'd0;
        in_B        = 32'd0;
        finish      = 1'b0;
        in_valid    = 1'b0;
        in_acc_sign = 1'b0;
        // 1 具体值详见文档测试数据
        #30
        aresetn   = 1'b1;
        in_A        = 32'h41400000;
        in_B        = 32'h415D1EB8;
        in_valid    = 1'b1;
        #20
        in_valid    = 1'b0;
        // 2
        #20
        in_A        = 32'h42007DF4;
        in_B        = 32'h41BB3333;
        in_valid    = 1'b1;
        #20
        in_valid    = 1'b0;
        // 3
        #20
        in_A        = 32'hC146E148;
        in_B        = 32'hC2966666;
        in_valid    = 1'b1;
        #20
        in_valid    = 1'b0;
        // 4
        #20
        in_A        = 32'hC22C0000;
        in_B        = 32'h41E80000;
        in_valid    = 1'b1;
        #20
        in_valid    = 1'b0;
        // 5
        #20
        in_A        = 32'h4298B021;
        in_B        = 32'hC048F5C3;
        in_valid    = 1'b1;
        #20
        in_valid    = 1'b0;
        // 6
        #20
        in_A        = 32'h421CF5C3;
        in_B        = 32'h00000000;
        in_valid    = 1'b1;
        #20
        in_valid    = 1'b0;
        // 7
        #20
        in_A        = 32'h436A1C29;
        in_B        = 32'h3F800000;
        in_valid    = 1'b1;
        #20
        in_valid    = 1'b0;
        // 8
        #20
        in_A        = 32'hC3DD0CCD;
        in_B        = 32'h41466666;
        in_valid    = 1'b1;
        #20
        in_valid    = 1'b0;
        // 9
        #20
        in_A        = 32'h41400000;
        in_B        = 32'h415D1EB8;
        in_valid    = 1'b1;
        #20
        in_valid    = 1'b0;
        // 2
        #20
        in_A        = 32'h42007DF4;
        in_B        = 32'h41BB3333;
        in_valid    = 1'b1;
        #20
        in_valid    = 1'b0;
        // 3
        #20
        in_A        = 32'hC146E148;
        in_B        = 32'hC2966666;
        in_valid    = 1'b1;
        #20
        in_valid    = 1'b0;
        // 4
        #20
        in_A        = 32'hC22C0000;
        in_B        = 32'h41E80000;
        in_valid    = 1'b1;
        #20
        in_valid    = 1'b0;
        // 5
        #20
        in_A        = 32'h4298B021;
        in_B        = 32'hC048F5C3;
        in_valid    = 1'b1;
        #20
        in_valid    = 1'b0;
        // 6
        #20
        in_A        = 32'h421CF5C3;
        in_B        = 32'h00000000;
        in_valid    = 1'b1;
        #20
        in_valid    = 1'b0;
        // 7
        #20
        in_A        = 32'h436A1C29;
        in_B        = 32'h3F800000;
        in_valid    = 1'b1;
        #20
        in_valid    = 1'b0;
        // 8
        #20
        in_A        = 32'hC3DD0CCD;
        in_B        = 32'h41466666;
        in_valid    = 1'b1;
        #20
        in_valid    = 1'b0;
        // 1
        #20
        in_A        = 32'h42C875C3;
        in_B        = 32'h41AB6042;
        in_valid    = 1'b1;
        #20
        in_valid    = 1'b0;
        #5120
        in_valid    = 1'b1;
        #20
        in_valid    = 1'b0;
        // 2
        #20
        in_A        = 32'h4230F5C3;
        in_B        = 32'h4341EC4A;
        in_valid    = 1'b1;
        #20
        in_valid    = 1'b0;
        finish      = 1'b1;
        #20
        finish      = 1'b0;
        
        
        
    end

always #10 aclk = ~aclk;


fp_mul_module#(
    .RST_MAX    (8'd255    ),
    .SUM_START  (8'd64     )
) fp_mul_module_inst
(
    .aclk_1      (aclk    ),
    .aclk_2      (aclk    ),
    .aresetn      (aresetn  ),
    .in_A        (in_A       ),
    .in_B        (in_B       ),
    .finish      (finish     ),
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



endmodule
