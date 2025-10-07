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


module fp_mul_module(

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