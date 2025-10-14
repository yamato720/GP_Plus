`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/10/06 15:48:02
// Design Name: 
// Module Name: fp_mul_module
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


module fp_mul_module
#(
    parameter   RST_MAX     = 8'd255    ,
    parameter   SUM_START   = 8'd64     
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
    
    output  wire    [31:0]  result_1_A  ,
    output  wire    [31:0]  result_1_B  ,
    output  wire    [31:0]  result_2_A  ,
    output  wire    [31:0]  result_2_B  ,
    output  wire    [31:0]  result_3_A  ,
    output  wire    [31:0]  result_3_B  ,
    output  wire    [31:0]  result_4_A  ,
    output  wire    [31:0]  result_4_B  ,
    output  wire    [31:0]  result_5_A  ,
    output  wire    [31:0]  result_5_B  ,
    output  wire    [31:0]  result_6_A  ,
    output  wire    [31:0]  result_6_B  ,
    output  wire    [31:0]  result_7_A  ,
    output  wire    [31:0]  result_7_B  ,
    output  wire    [31:0]  result_8_A  ,
    output  wire    [31:0]  result_8_B  ,
    
    output  wire            acc_sign    ,
    output  wire            clock_en_out,   
    output  wire            sendable    ,
    
    output  wire            save_sign   
   

);

wire    [31:0]  out_01_A    ; 
wire    [31:0]  out_01_B    ; 
wire    [31:0]  out_02_A    ; 
wire    [31:0]  out_02_B    ; 
wire    [31:0]  out_03_A    ; 
wire    [31:0]  out_03_B    ; 
wire    [31:0]  out_04_A    ; 
wire    [31:0]  out_04_B    ; 
wire    [31:0]  out_05_A    ; 
wire    [31:0]  out_05_B    ; 
wire    [31:0]  out_06_A    ; 
wire    [31:0]  out_06_B    ; 
wire    [31:0]  out_07_A    ; 
wire    [31:0]  out_07_B    ; 
wire    [31:0]  out_08_A    ; 
wire    [31:0]  out_08_B    ; 
wire    [31:0]  out_09_A    ; 
wire    [31:0]  out_09_B    ; 
wire    [31:0]  out_10_A    ; 
wire    [31:0]  out_10_B    ; 
wire    [31:0]  out_11_A    ; 
wire    [31:0]  out_11_B    ; 
wire    [31:0]  out_12_A    ; 
wire    [31:0]  out_12_B    ; 
wire    [31:0]  out_13_A    ; 
wire    [31:0]  out_13_B    ; 
wire    [31:0]  out_14_A    ; 
wire    [31:0]  out_14_B    ; 
wire    [31:0]  out_15_A    ; 
wire    [31:0]  out_15_B    ; 
wire    [31:0]  out_16_A    ; 
wire    [31:0]  out_16_B    ; 

wire            aclken      ;



my_fp_mul my_fp_mul_inst_1(
    .aclk(aclk_1),
    .aresetn(aresetn),
    .aclken(aclken),
    .a_in(out_01_A),
    .b_in(out_01_B),
    .result_out(result_1_A),
    .result_tvalid(),
    .result_tuser()
);
my_fp_mul my_fp_mul_inst_2(
    .aclk(aclk_1),
    .aresetn(aresetn),
    .aclken(aclken),
    .a_in(out_02_A),
    .b_in(out_02_B),
    .result_out(result_1_B),
    .result_tvalid(),
    .result_tuser()
);

my_fp_mul my_fp_mul_inst_3(
    .aclk(aclk_1),
    .aresetn(aresetn),
    .aclken(aclken),
    .a_in(out_03_A),
    .b_in(out_03_B),
    .result_out(result_2_A),
    .result_tvalid(),
    .result_tuser()
);

my_fp_mul my_fp_mul_inst_4(
    .aclk(aclk_1),
    .aresetn(aresetn),
    .aclken(aclken),
    .a_in(out_04_A),
    .b_in(out_04_B),
    .result_out(result_2_B),
    .result_tvalid(),
    .result_tuser()
);

my_fp_mul my_fp_mul_inst_5(
    .aclk(aclk_1),
    .aresetn(aresetn),
    .aclken(aclken),
    .a_in(out_05_A),
    .b_in(out_05_B),
    .result_out(result_3_A),
    .result_tvalid(),
    .result_tuser()
);

my_fp_mul my_fp_mul_inst_6(
    .aclk(aclk_1),
    .aresetn(aresetn),
    .aclken(aclken),
    .a_in(out_06_A),
    .b_in(out_06_B),
    .result_out(result_3_B),
    .result_tvalid(),
    .result_tuser()
);

my_fp_mul my_fp_mul_inst_7(
    .aclk(aclk_1),
    .aresetn(aresetn),
    .aclken(aclken),
    .a_in(out_07_A),
    .b_in(out_07_B),
    .result_out(result_4_A),
    .result_tvalid(),
    .result_tuser()
);

my_fp_mul my_fp_mul_inst_8(
    .aclk(aclk_1),
    .aresetn(aresetn),
    .aclken(aclken),
    .a_in(out_08_A),
    .b_in(out_08_B),
    .result_out(result_4_B),
    .result_tvalid(),
    .result_tuser()
);

my_fp_mul my_fp_mul_inst_9(
    .aclk(aclk_1),
    .aresetn(aresetn),
    .aclken(aclken),
    .a_in(out_09_A),
    .b_in(out_09_B),
    .result_out(result_5_A),
    .result_tvalid(),
    .result_tuser()
);

my_fp_mul my_fp_mul_inst_10(
    .aclk(aclk_1),
    .aresetn(aresetn),
    .aclken(aclken),
    .a_in(out_10_A),
    .b_in(out_10_B),
    .result_out(result_5_B),
    .result_tvalid(),
    .result_tuser()
);

my_fp_mul my_fp_mul_inst_11(
    .aclk(aclk_1),
    .aresetn(aresetn),
    .aclken(aclken),
    .a_in(out_11_A),
    .b_in(out_11_B),
    .result_out(result_6_A),
    .result_tvalid(),
    .result_tuser()
);

my_fp_mul my_fp_mul_inst_12(
    .aclk(aclk_1),
    .aresetn(aresetn),
    .aclken(aclken),
    .a_in(out_12_A),
    .b_in(out_12_B),
    .result_out(result_6_B),
    .result_tvalid(),
    .result_tuser()
);

my_fp_mul my_fp_mul_inst_13(
    .aclk(aclk_1),
    .aresetn(aresetn),
    .aclken(aclken),
    .a_in(out_13_A),
    .b_in(out_13_B),
    .result_out(result_7_A),
    .result_tvalid(),
    .result_tuser()
);

my_fp_mul my_fp_mul_inst_14(
    .aclk(aclk_1),
    .aresetn(aresetn),
    .aclken(aclken),
    .a_in(out_14_A),
    .b_in(out_14_B),
    .result_out(result_7_B),
    .result_tvalid(),
    .result_tuser()
);

my_fp_mul my_fp_mul_inst_15(
    .aclk(aclk_1),
    .aresetn(aresetn),
    .aclken(aclken),
    .a_in(out_15_A),
    .b_in(out_15_B),
    .result_out(result_8_A),
    .result_tvalid(),
    .result_tuser()
);

my_fp_mul my_fp_mul_inst_16(
    .aclk(aclk_1),
    .aresetn(aresetn),
    .aclken(aclken),
    .a_in(out_16_A),
    .b_in(out_16_B),
    .result_out(result_8_B),
    .result_tvalid(),
    .result_tuser()
);

fp_dual_input_module #(
    .RST_MAX(RST_MAX),
    .SUM_START(SUM_START)
) fp_dual_input_module_inst (
    .aclk(aclk_2),
    .aresetn(aresetn),
    .in_A(in_A),
    .in_B(in_B),
    .finish(finish),
    .in_valid(in_valid),
    .in_acc_sign(in_acc_sign),
    .out_acc_sign(acc_sign),
    .sendable(sendable),
    .clock_en(aclken),
    .save_sign(save_sign),
    .sum_clock_en(clock_en_out), 
    .out_01_A(out_01_A),
    .out_01_B(out_01_B),
    .out_02_A(out_02_A),
    .out_02_B(out_02_B),
    .out_03_A(out_03_A),
    .out_03_B(out_03_B),
    .out_04_A(out_04_A),
    .out_04_B(out_04_B),
    .out_05_A(out_05_A),
    .out_05_B(out_05_B),
    .out_06_A(out_06_A),
    .out_06_B(out_06_B),
    .out_07_A(out_07_A),
    .out_07_B(out_07_B),
    .out_08_A(out_08_A),
    .out_08_B(out_08_B),
    .out_09_A(out_09_A),
    .out_09_B(out_09_B),
    .out_10_A(out_10_A),
    .out_10_B(out_10_B),
    .out_11_A(out_11_A),
    .out_11_B(out_11_B),
    .out_12_A(out_12_A),
    .out_12_B(out_12_B),
    .out_13_A(out_13_A),
    .out_13_B(out_13_B),
    .out_14_A(out_14_A),
    .out_14_B(out_14_B),
    .out_15_A(out_15_A),
    .out_15_B(out_15_B),
    .out_16_A(out_16_A),
    .out_16_B(out_16_B)
);







endmodule


module my_fp_mul(
    input aclk,
    input aresetn,
    input aclken,
    input [31:0] a_in,
    input [31:0] b_in,
    output [31:0] result_out,
    output result_tvalid,
    output [2:0] result_tuser
);



    wire s_axis_a_tvalid = 1'b1;
    wire [31:0] s_axis_a_tdata = a_in;

    wire s_axis_b_tvalid = 1'b1;
    wire [31:0] s_axis_b_tdata = b_in;

    wire m_axis_result_tready = 1'b1;
    wire [31:0] m_axis_result_tdata;
    wire [2:0] m_axis_result_tuser;

    assign result_out = m_axis_result_tdata;
    assign result_tvalid = m_axis_result_tvalid;
    assign result_tuser = m_axis_result_tuser;





fp_mul fp_mul_inst (
  .aclk(aclk),                                  // input wire aclk
  .aclken(aclken),                              // input wire aclken
  .aresetn(aresetn),                            // input wire aresetn
  .s_axis_a_tvalid(s_axis_a_tvalid),            // input wire s_axis_a_tvalid
  .s_axis_a_tready(),            // output wire s_axis_a_tready
  .s_axis_a_tdata(s_axis_a_tdata),              // input wire [31 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(s_axis_b_tvalid),            // input wire s_axis_b_tvalid
  .s_axis_b_tready(),            // output wire s_axis_b_tready
  .s_axis_b_tdata(s_axis_b_tdata),              // input wire [31 : 0] s_axis_b_tdata
  .m_axis_result_tvalid(m_axis_result_tvalid),  // output wire m_axis_result_tvalid
  .m_axis_result_tready(m_axis_result_tready),  // input wire m_axis_result_tready
  .m_axis_result_tdata(m_axis_result_tdata),    // output wire [31 : 0] m_axis_result_tdata
  .m_axis_result_tuser(m_axis_result_tuser)    // output wire [2 : 0] m_axis_result_tuser
);

endmodule