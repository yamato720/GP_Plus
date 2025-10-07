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
    input   wire            sys_clk_1   ,
    input   wire            sys_clk_2   ,
    input   wire            sys_rst_n   ,
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

wire            clock_en    ;



my_fp_mul my_fp_mul_inst_1(
    .aclk(aclk),
    .aresetn(aresetn),
    .aclken(aclken),
    .a_in(a_in),
    .b_in(b_in),
    .result_out(out_01_A),
    .result_tvalid(),
    .result_tuser()
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