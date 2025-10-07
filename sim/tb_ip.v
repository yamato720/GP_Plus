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

module tb_ip();

reg clka;
reg rsta;
reg ena;
reg [3 : 0] wea;
reg [31 : 0] addra;
reg [31 : 0] dina;
wire [31 : 0] douta;
reg clkb;
reg rstb;
reg enb;
reg [3 : 0] web;
reg [31 : 0] addrb;
reg [31 : 0] dinb;
wire [31 : 0] doutb;
wire rsta_busy;
wire rstb_busy;

initial begin
    clka = 0;                            // 10ns时钟周期
    rsta = 0;                            // 复位信号 
    ena = 0;                             // 使能信号
    wea = 4'b0000;                       // 写使能信号，4位表示每个字节的写使能  
    addra = 32'b0;                       // 地址信号
    dina = 32'b0;                        // 输入数据信号
    clkb = 0;                            // 10ns时钟周期
    rstb = 0;                            // 复位信号
    enb = 0;                             // 使能信号
    web = 4'b0000;                       // 写使能信号，4位表示每个字节的写使能
    addrb = 32'b0;                       // 地址信号
    dinb = 32'b0;                        // 输入数据信号

    #20 ena = 1; enb = 1;

    #20 wea = 4'b1111; addra = 32'd0; dina = 32'h3f800000; // 写入地址0，数据15.9
    #10 wea = 4'b0000; addra = 32'd0; // 停止写入，准备读取地址0

    #20 web = 4'b1111; addrb = 32'd0; dinb = 32'h41400000; // 写入地址0，数据22.6
    #10 web = 4'b0000; addrb = 32'd0; // 停止写入，准备读取地址0

    #50; // 等待仿真结束
end

always #5 clka = ~clka; // 10ns时钟周期
always #5 clkb = ~clkb; // 10ns时钟周期






bmem_native_data_256KB your_instance_name (
  .clka(clka),            // input wire clka
  .rsta(rsta),            // input wire rsta
  .ena(ena),              // input wire ena
  .wea(wea),              // input wire [3 : 0] wea
  .addra(addra),          // input wire [31 : 0] addra
  .dina(dina),            // input wire [31 : 0] dina
  .douta(douta),          // output wire [31 : 0] douta
  .clkb(clkb),            // input wire clkb
  .rstb(rstb),            // input wire rstb
  .enb(enb),              // input wire enb
  .web(web),              // input wire [3 : 0] web
  .addrb(addrb),          // input wire [31 : 0] addrb
  .dinb(dinb),            // input wire [31 : 0] dinb
  .doutb(doutb),          // output wire [31 : 0] doutb
  .rsta_busy(rsta_busy),  // output wire rsta_busy
  .rstb_busy(rstb_busy)  // output wire rstb_busy
);





endmodule




















// 测试fp IP核
// module tb_ip();



// reg aclk;
// reg aresetn;
// reg aclken;
// reg [31:0] s_axis_a_tdata;
// reg [31:0] s_axis_b_tdata;
// wire [31:0] result_tdata;
// wire result_tvalid;
// wire [2:0] result_tuser;

// initial begin
//     // 0ns：初始化所有信号
//     aclk = 0;
//     aclken = 0;
//     aresetn = 0;
//     s_axis_a_tdata = 32'b0;
//     s_axis_b_tdata = 32'b0;
//     // result_tdata = 32'b0; // 输出信号不需要初始化
//     // result_tvalid = 1'b0; // 输出信号不需要初始化
//     // result_tuser = 3'b0; // 输出信号不需要初始化

//     // 20ns：释放复位
//     #20 aresetn = 1;

//     // 30ns：启动时钟使能
//     #10 aclken = 1;

//     // 40ns：输入第一组数据（1.0 + 2.0），拉高valid
//     #10 
//         s_axis_a_tdata = 32'h3f800000; // 1.0
//         s_axis_b_tdata = 32'h40000000; // 2.0



//     // 50ns：输入第二组数据（3.0 + 4.0），拉高valid
//     #10 
//         s_axis_a_tdata = 32'h40400000; // 3.0
//         s_axis_b_tdata = 32'h40800000; // 4.0



//     // 后续可继续输入更多数据
//     #50; // 等待仿真结束
// end

// always #5 aclk = ~aclk; // 10ns时钟周期




// my_fp_mul my_fp_mul_inst(
//     .aclk(aclk),
//     .aresetn(aresetn),
//     .aclken(aclken),
//     .a_in(s_axis_a_tdata),
//     .b_in(s_axis_b_tdata),
//     .result_out(result_tdata),
//     .result_tvalid(result_tvalid),
//     .result_tuser(result_tuser)

// );
// endmodule
