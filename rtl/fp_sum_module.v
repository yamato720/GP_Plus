`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/10/06 15:48:02
// Design Name: 
// Module Name: fp_sum_module
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
module fp_sum_module
#(
    parameter latency = 4'd5 //执行全部my_fp_add延迟周期
)
(
    input   wire            aclk            ,
    input   wire            aresetn         , 
        
    input   wire    [31:0]  in_11_A         ,
    input   wire    [31:0]  in_11_B         ,
    input   wire    [31:0]  in_12_A         ,
    input   wire    [31:0]  in_12_B         ,
    input   wire    [31:0]  in_13_A         ,
    input   wire    [31:0]  in_13_B         ,
    input   wire    [31:0]  in_14_A         ,
    input   wire    [31:0]  in_14_B         ,
    input   wire    [31:0]  in_15_A         ,
    input   wire    [31:0]  in_15_B         ,
    input   wire    [31:0]  in_16_A         ,
    input   wire    [31:0]  in_16_B         ,
    input   wire    [31:0]  in_17_A         ,
    input   wire    [31:0]  in_17_B         ,
    input   wire    [31:0]  in_18_A         ,
    input   wire    [31:0]  in_18_B         ,
        
        
    input   wire            acc_sign        ,
    input   wire    [31:0]  custom_last     ,
    input   wire            en_custom_last  ,
    input   wire            clock_en        ,
    input   wire            save_sign       ,
    
    output  reg     [31:0]  result_all
);




wire    [31:0]  result_21_A ;
wire    [31:0]  result_21_B ;
wire    [31:0]  result_22_A ;
wire    [31:0]  result_22_B ;
wire    [31:0]  result_23_A ;
wire    [31:0]  result_23_B ;
wire    [31:0]  result_24_A ;
wire    [31:0]  result_24_B ;


wire    [31:0]  result_31_A ;
wire    [31:0]  result_31_B ;
wire    [31:0]  result_32_A ;
wire    [31:0]  result_32_B ;


wire    [31:0]  result_41_A ;
wire    [31:0]  result_41_B ;


wire    [31:0]  result_51_A ;
reg     [31:0]  result_51_B ; //last_buffer

wire    [31:0]  result_61_A ;      

reg     [31:0]  result_choose_4 ;
reg     [31:0]  result_choose_5 ;   

reg     [7:0]   last_counter    ;
reg     [31:0]  last            ;


always@(*)  result_choose_4 = result_51_A;
always@(*)  result_choose_5 = result_61_A;

always@(posedge aclk or negedge aresetn)
    if(aresetn == 1'b0)
        result_all <= result_choose_4;
    else if(acc_sign == 1'b1)
        result_all <= result_choose_5;
    else
        result_all <= result_choose_4;

always@(posedge aclk or negedge aresetn)
    if(aresetn == 1'b0)
        result_51_B <= 32'd0;
    else if(save_sign == 1'b1 && en_custom_last == 1'b1)
        result_51_B <= custom_last;
    else if(save_sign == 1'b1 && en_custom_last == 1'b0)
        result_51_B <= result_choose_5;
    else
        result_51_B <= result_51_B;

always@(posedge aclk or negedge aresetn)
    if(aresetn == 1'b0)
        last <= 32'd0;
    else if(last_counter == latency)
        last <= result_51_B;
    else
        last <= last;

always@(posedge aclk or negedge aresetn)
    if(aresetn == 1'b0)
        last_counter <= 1'b0;
    else if(clock_en == 1'b1)
        last_counter <= last_counter + 1;
    else
        last_counter <= 1'b0;


my_fp_add u_fp_add_11 (
    .aclk           (aclk           ),
    .aresetn        (aresetn        ),
    .aclken         (clock_en       ),
    .a_in           (in_11_A        ),
    .b_in           (in_11_B        ),
    .result_out     (result_21_A    ),
    .result_tvalid  (               ),
    .result_tuser   (               )
);
my_fp_add u_fp_add_12 (
    .aclk           (aclk           ),
    .aresetn        (aresetn        ),
    .aclken         (clock_en       ),
    .a_in           (in_12_A        ),
    .b_in           (in_12_B        ),
    .result_out     (result_21_B    ),
    .result_tvalid  (               ),
    .result_tuser   (               )
);
my_fp_add u_fp_add_13 (
    .aclk           (aclk           ),
    .aresetn        (aresetn        ),
    .aclken         (clock_en       ),
    .a_in           (in_13_A        ),
    .b_in           (in_13_B        ),
    .result_out     (result_22_A    ),
    .result_tvalid  (               ),
    .result_tuser   (               )
);
my_fp_add u_fp_add_14 (
    .aclk           (aclk           ),
    .aresetn        (aresetn        ),
    .aclken         (clock_en       ),
    .a_in           (in_14_A        ),
    .b_in           (in_14_B        ),
    .result_out     (result_22_B    ),
    .result_tvalid  (               ),
    .result_tuser   (               )
);
my_fp_add u_fp_add_15 (
    .aclk           (aclk           ),
    .aresetn        (aresetn        ),
    .aclken         (clock_en       ),
    .a_in           (in_15_A        ),
    .b_in           (in_15_B        ),
    .result_out     (result_23_A    ),
    .result_tvalid  (               ),
    .result_tuser   (               )
);
my_fp_add u_fp_add_16 (
    .aclk           (aclk           ),
    .aresetn        (aresetn        ),
    .aclken         (clock_en       ),
    .a_in           (in_16_A        ),
    .b_in           (in_16_B        ),
    .result_out     (result_23_B    ),
    .result_tvalid  (               ),
    .result_tuser   (               )
);
my_fp_add u_fp_add_17 (
    .aclk           (aclk           ),
    .aresetn        (aresetn        ),
    .aclken         (clock_en       ),
    .a_in           (in_17_A        ),
    .b_in           (in_17_B        ),
    .result_out     (result_24_A    ),
    .result_tvalid  (               ),
    .result_tuser   (               )
);
my_fp_add u_fp_add_18 (
    .aclk           (aclk           ),
    .aresetn        (aresetn        ),
    .aclken         (clock_en       ),
    .a_in           (in_18_A        ),
    .b_in           (in_18_B        ),
    .result_out     (result_24_B    ),
    .result_tvalid  (               ),
    .result_tuser   (               )
);
my_fp_add u_fp_add_21 (
    .aclk           (aclk           ),
    .aresetn        (aresetn        ),
    .aclken         (clock_en       ),
    .a_in           (result_21_A    ),
    .b_in           (result_21_B    ),
    .result_out     (result_31_A    ),
    .result_tvalid  (               ),
    .result_tuser   (               )
);
my_fp_add u_fp_add_22 (
    .aclk           (aclk           ),
    .aresetn        (aresetn        ),
    .aclken         (clock_en       ),
    .a_in           (result_22_A    ),
    .b_in           (result_22_B    ),
    .result_out     (result_31_B    ),
    .result_tvalid  (               ),
    .result_tuser   (               )
);
my_fp_add u_fp_add_23 (
    .aclk           (aclk           ),
    .aresetn        (aresetn        ),
    .aclken         (clock_en       ),
    .a_in           (result_23_A    ),
    .b_in           (result_23_B    ),
    .result_out     (result_32_A    ),
    .result_tvalid  (               ),
    .result_tuser   (               )
); 
my_fp_add u_fp_add_24 (
    .aclk           (aclk           ),
    .aresetn        (aresetn        ),
    .aclken         (clock_en       ),
    .a_in           (result_24_A    ),
    .b_in           (result_24_B    ),
    .result_out     (result_32_B    ),
    .result_tvalid  (               ),
    .result_tuser   (               )
);
my_fp_add u_fp_add_31 (
    .aclk           (aclk           ),
    .aresetn        (aresetn        ),
    .aclken         (clock_en       ),
    .a_in           (result_31_A    ),
    .b_in           (result_31_B    ),
    .result_out     (result_41_A    ),
    .result_tvalid  (               ),
    .result_tuser   (               )
);
my_fp_add u_fp_add_32 (
    .aclk           (aclk           ),
    .aresetn        (aresetn        ),
    .aclken         (clock_en       ),
    .a_in           (result_32_A    ),
    .b_in           (result_32_B    ),
    .result_out     (result_41_B    ),
    .result_tvalid  (               ),
    .result_tuser   (               )
);
my_fp_add u_fp_add_41 (
    .aclk           (aclk           ),
    .aresetn        (aresetn        ),
    .aclken         (clock_en       ),
    .a_in           (result_41_A    ),
    .b_in           (result_41_B    ),
    .result_out     (result_51_A    ),
    .result_tvalid  (               ),
    .result_tuser   (               )
);
my_fp_add u_fp_add_51 (
    .aclk           (aclk           ),
    .aresetn        (aresetn        ),
    .aclken         (clock_en       ),
    .a_in           (result_51_A    ),
    .b_in           (result_51_B    ),
    .result_out     (result_61_A    ),
    .result_tvalid  (               ),
    .result_tuser   (               )
);
endmodule


module my_fp_add(
    input aclk,
    input aresetn,
    input aclken,
    input [31:0] a_in,
    input [31:0] b_in,
    output [31:0] result_out,
    output result_tvalid,
    output [2:0] result_tuser
);


      // 始终让valid为1
    wire s_axis_a_tvalid = 1'b1;
    wire s_axis_b_tvalid = 1'b1;
    wire result_tready = 1'b1; // 始终准备接收结果


fp_add fp_add_inst (
  .aclk(aclk),                                  // input wire aclk
  .aclken(aclken),                              // input wire aclken
  .aresetn(aresetn),                            // input wire aresetn
  .s_axis_a_tvalid(s_axis_a_tvalid),            // input wire s_axis_a_tvalid
  .s_axis_a_tready(),            // output wire s_axis_a_tready
  .s_axis_a_tdata(a_in),                       // input wire [31 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(s_axis_b_tvalid),            // input wire s_axis_b_tvalid
  .s_axis_b_tready(),            // output wire s_axis_b_tready
  .s_axis_b_tdata(b_in),                         // input wire [31 : 0] s_axis_b_tdata
  .m_axis_result_tvalid(result_tvalid),  // output wire m_axis_result_tvalid
  .m_axis_result_tready(result_tready),  // input wire m_axis_result_tready
  .m_axis_result_tdata(result_out),    // output wire [31 : 0] m_axis_result_tdata
  .m_axis_result_tuser(result_tuser)    // output wire [2 : 0] m_axis_result_tuser
);


endmodule


