`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/10/06 16:54:52
// Design Name: 
// Module Name: tb_ip
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


























// 测试fp_add IP核
module tb_ip();



reg aclk;
reg aresetn;
reg aclken;
reg [31:0] s_axis_a_tdata;
reg [31:0] s_axis_b_tdata;
wire [31:0] result_tdata;
wire result_tvalid;
wire [2:0] result_tuser;

initial begin
    // 0ns：初始化所有信号
    aclk = 0;
    aclken = 0;
    aresetn = 0;
    s_axis_a_tdata = 32'b0;
    s_axis_b_tdata = 32'b0;
    // result_tdata = 32'b0; // 输出信号不需要初始化
    // result_tvalid = 1'b0; // 输出信号不需要初始化
    // result_tuser = 3'b0; // 输出信号不需要初始化

    // 20ns：释放复位
    #20 aresetn = 1;

    // 30ns：启动时钟使能
    #10 aclken = 1;

    // 40ns：输入第一组数据（1.0 + 2.0），拉高valid
    #10 
        s_axis_a_tdata = 32'h3f800000; // 1.0
        s_axis_b_tdata = 32'h40000000; // 2.0



    // 50ns：输入第二组数据（3.0 + 4.0），拉高valid
    #10 
        s_axis_a_tdata = 32'h40400000; // 3.0
        s_axis_b_tdata = 32'h40800000; // 4.0



    // 后续可继续输入更多数据
    #50; // 等待仿真结束
end

always #5 aclk = ~aclk; // 10ns时钟周期




my_fp_mul my_fp_mul_inst(
    .aclk(aclk),
    .aresetn(aresetn),
    .aclken(aclken),
    .a_in(s_axis_a_tdata),
    .b_in(s_axis_b_tdata),
    .result_out(result_tdata),
    .result_tvalid(result_tvalid),
    .result_tuser(result_tuser)

);
endmodule
