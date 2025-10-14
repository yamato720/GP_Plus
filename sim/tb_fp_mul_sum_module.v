`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/10/09 01:18:53
// Design Name: 
// Module Name: tb_mul_sum_module
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


module tb_mul_sum_module(

    );


// 实例化待测试的 fp_dual_input_module
reg             aclk_1;
reg             aclk_2;
reg             aresetn;

reg     [31:0]  in_A        ;
reg     [31:0]  in_B        ;
reg             finish      ;
reg             in_valid    ;
reg             in_acc_sign ;
reg     [31:0]  custom_last     ;
reg             en_custom_last  ;
                            
                            

wire            sendable        ;
wire     [31:0]  result_all     ;


reg     [31:0]  count;



initial
    begin
        aclk_1      <= 1'b1;
        aclk_2      <= 1'b1;
        aresetn     <= 1'b0;
        in_A        <= 32'd0;
        in_B        <= 32'd0;
        finish      <= 1'b0;
        in_valid    <= 1'b0;
        in_acc_sign <= 1'b1;
        count       <= 32'd0;
        custom_last     <= 32'h416A147B;
        en_custom_last  <=1'd1;
        // 1
        #30
        aresetn   <= 1'b1;
        in_A        <= 32'h41400000;
        in_B        <= 32'h415D1EB8;
        in_valid    <= 1'b1;
        #10
        in_valid    <= 1'b0;
        // 2
        #10
        in_A        <= 32'h42007DF4;
        in_B        <= 32'h41BB3333;
        in_valid    <= 1'b1;
        #10
        in_valid    <= 1'b0;
        // 3
        #10
        in_A        <= 32'hC146E148;
        in_B        <= 32'hC2966666;
        in_valid    <= 1'b1;
        #10
        in_valid    <= 1'b0;
        // 4
        #10
        in_A        <= 32'hC22C0000;
        in_B        <= 32'h41E80000;
        in_valid    <= 1'b1;
        #10
        in_valid    <= 1'b0;
        // 5
        #10
        in_A        <= 32'h4298B021;
        in_B        <= 32'hC048F5C3;
        in_valid    <= 1'b1;
        #10
        in_valid    <= 1'b0;
        // 6
        #10
        in_A        <= 32'h421CF5C3;
        in_B        <= 32'h00000000;
        in_valid    <= 1'b1;
        #10
        in_valid    <= 1'b0;
        // 7
        #10
        in_A        <= 32'h436A1C29;
        in_B        <= 32'h3F800000;
        in_valid    <= 1'b1;
        #10
        in_valid    <= 1'b0;
        // 8
        #10
        in_A        <= 32'hC3DD0CCD;
        in_B        <= 32'h41466666;
        in_valid    <= 1'b1;
        #10
        in_valid    <= 1'b0;
        // 9
        #10
        in_A        <= 32'h41400000;
        in_B        <= 32'h415D1EB8;
        in_valid    <= 1'b1;
        #10
        in_valid    <= 1'b0;
        // 2
        #10
        in_A        <= 32'h42007DF4;
        in_B        <= 32'h41BB3333;
        in_valid    <= 1'b1;
        #10
        in_valid    <= 1'b0;
        // 3
        #10
        in_A        <= 32'hC146E148;
        in_B        <= 32'hC2966666;
        in_valid    <= 1'b1;
        #10
        in_valid    <= 1'b0;
        // 4
        #10
        in_A        <= 32'hC22C0000;
        in_B        <= 32'h41E80000;
        in_valid    <= 1'b1;
        #10
        in_valid    <= 1'b0;
        // 5
        #10
        in_A        <= 32'h4298B021;
        in_B        <= 32'hC048F5C3;
        in_valid    <= 1'b1;
        #10
        in_valid    <= 1'b0;
        // 6
        #10
        in_A        <= 32'h421CF5C3;
        in_B        <= 32'h00000000;
        in_valid    <= 1'b1;
        #10
        in_valid    <= 1'b0;
        // 7
        #10
        in_A        <= 32'h436A1C29;
        in_B        <= 32'h3F800000;
        in_valid    <= 1'b1;
        #10
        in_valid    <= 1'b0;
        // 8
        #10
        in_A        <= 32'hC3DD0CCD;
        in_B        <= 32'h41466666;
        in_valid    <= 1'b1;
        #10
        in_valid    <= 1'b0;
        // 1
        #10
        in_A        <= 32'h42C875C3;
        in_B        <= 32'h41AB6042;
        in_valid    <= 1'b1;
        #10
        in_valid    <= 1'b0;
        #850
        in_valid    <= 1'b1;
        #20
        in_valid    <= 1'b0;
        // 2
        #10
        in_A        <= 32'h4230F5C3;
        in_B        <= 32'h4341EC4A;
        in_valid    <= 1'b1;
        #10
        in_valid    <= 1'b0;
        finish      <= 1'b1;
        #10
        finish      <= 1'b0;
        
        
        
    end


always #5 aclk_1 = ~aclk_1; // 10ns 时钟周期
always #5 aclk_2 = ~aclk_2; // 10ns 时钟周期
always #10 count <= count + 32'b1;


// 其他激励信号可根据需要补充




fp_mul_sum_module#(
    .RST_MAX    (8'd8),// 此时整个点积结束
    .SUM_START  (8'd2)  // 0时完成置零，5时完成并行乘，然后开始累加
)fp_mul_sum_module_inst
(
    .aclk_1   (aclk_1    ),
    .aclk_2   (aclk_2    ),
    .aresetn   (aresetn   ),
    .in_A        (in_A       ),
    .in_B        (in_B       ),
    .finish      (finish     ),
    .in_valid    (in_valid   ),
    .in_acc_sign (in_acc_sign),
    .custom_last   (custom_last   ) ,
    .en_custom_last(en_custom_last) ,
    
    .result_all  (result_all ),
    .sendable    (sendable   )
);




endmodule
