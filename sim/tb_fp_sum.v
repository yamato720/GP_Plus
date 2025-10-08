module tb_fp_sum();

reg         aclk;
reg         aresetn;

reg [31:0]  in_11_A;
reg [31:0]  in_11_B;
reg [31:0]  in_12_A;
reg [31:0]  in_12_B;
reg [31:0]  in_13_A;
reg [31:0]  in_13_B;
reg [31:0]  in_14_A;
reg [31:0]  in_14_B;
reg [31:0]  in_15_A;
reg [31:0]  in_15_B;
reg [31:0]  in_16_A;
reg [31:0]  in_16_B;
reg [31:0]  in_17_A;
reg [31:0]  in_17_B;
reg [31:0]  in_18_A;
reg [31:0]  in_18_B;

reg         acc_sign;
reg [31:0]  custom_last;
reg         en_custom_last;
reg         clock_en;
reg         save_sign;

wire [31:0]  result_all;

initial begin
    // 0ns：初始化所有信号
    aclk = 0;
    aresetn = 0;

    in_11_A = 32'h3f800000; // 1.0
    in_11_B = 32'h40000000; // 2.0
    in_12_A = 32'h40400000; // 3.0
    in_12_B = 32'h40800000; // 4.0
    in_13_A = 32'h40a00000; // 5.0
    in_13_B = 32'h40c00000; // 6.0
    in_14_A = 32'h40e00000; // 7.0
    in_14_B = 32'h41000000; // 8.0
    in_15_A = 32'h41100000; // 9.0
    in_15_B = 32'h41200000; // 10.0
    in_16_A = 32'h41300000; // 11.0
    in_16_B = 32'h41400000; // 12.0
    in_17_A = 32'h41500000; // 13.0
    in_17_B = 32'h41600000; // 14.0
    in_18_A = 32'h41700000; // 15.0
    in_18_B = 32'h41800000; // 16.0

    acc_sign = 1'b0;
    custom_last = 32'b0;
    en_custom_last = 1'b0;
    clock_en = 1'b0;
    save_sign = 1'b0;


    // 20ns：释放复位
    #20 aresetn = 1;

    // 30ns：启动时钟使能
    #10 clock_en = 1'b1;

    // 等待50ns观察结果
    #50;
    in_11_A =   32'h3f8ccccd;           // 1.1
    in_11_B =   32'h400ccccd;           // 2.2
    in_12_A =   32'h40533333;           // 3.3
    in_12_B =   32'h4099999a;           // 4.4
    in_13_A =   32'h40b00000;           // 5.5
    in_13_B =   32'h40d33333;           // 6.6
    in_14_A =   32'h40f66666;           // 7.7
    in_14_B =   32'h410ccccd;           // 8.8
    in_15_A =   32'h4119999a;           // 9.9
    in_15_B =   32'h4121999a;           // 10.10
    in_16_A =   32'h4131999a;           // 11.11
    in_16_B =   32'h41433333;           // 12.12
    in_17_A =   32'h4155999a;           // 13.13
    in_17_B =   32'h41633333;           // 14.14
    in_18_A =   32'h4171999a;           // 15.15
    in_18_B =   32'h4181999a;           // 16.16
    #50; // 等待50ns观察结果
    // 停止时钟使能
    clock_en = 1'b0;

end

always #5 aclk = ~aclk; // 10ns时钟周期





fp_sum_module #(
    .latency (4'd5)
) fp_sum_module_inst (
    .aclk            (aclk            ),
    .aresetn         (aresetn         ),

    .in_11_A         (in_11_A         ),
    .in_11_B         (in_11_B         ),
    .in_12_A         (in_12_A         ),
    .in_12_B         (in_12_B         ),
    .in_13_A         (in_13_A         ),
    .in_13_B         (in_13_B         ),
    .in_14_A         (in_14_A         ),
    .in_14_B         (in_14_B         ),
    .in_15_A         (in_15_A         ),
    .in_15_B         (in_15_B         ),
    .in_16_A         (in_16_A         ),
    .in_16_B         (in_16_B         ),
    .in_17_A         (in_17_A         ),
    .in_17_B         (in_17_B         ),
    .in_18_A         (in_18_A         ),
    .in_18_B         (in_18_B         ),

    .acc_sign        (acc_sign        ),
    .custom_last     (custom_last     ),
    .en_custom_last  (en_custom_last  ),
    .clock_en        (clock_en        ),
    .save_sign       (save_sign       ),

    .result_all      (result_all      )
);





endmodule