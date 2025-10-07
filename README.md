# GP_Plus

面向 Xilinx Vivado 的浮点加法/乘法流水线与求和树工程。
<br>
GPT 5 生成

## 目录结构

- `rtl/`：可综合 RTL 源码（Verilog/VHDL）
- `sim/`：测试平台与仿真文件（Testbench）
- `docs/`：设计文档与原理图（如 `.eddx`）
- `vivado/`：Vivado 工程和缓存（建议忽略）
- `GP_Plus.gen/`、`GP_Plus.runs/`、`GP_Plus.sim/`、`GP_Plus.hw/`、`GP_Plus.ip_user_files/`：由 Vivado 自动生成的产物（建议忽略）

## 为什么忽略这些文件

Vivado 工程包含大量可再生的缓存、网表与临时文件，体积巨大且与本地环境强相关。将其排除出 Git 可使仓库更小更稳定。保留 `rtl/`、`sim/`、`docs/` 即可再现设计。

已在 `.gitignore` 中默认忽略：

- Vivado 自动目录：`vivado/**`、`GP_Plus.gen/`、`GP_Plus.runs/`、`GP_Plus.hw/`、`GP_Plus.sim/`、`GP_Plus.ip_user_files/`
- 缓存：`.Xil/`、`.cache/`、`.ipcache/`
- 仿真脚本与编译库：`compile_simlib/`、`sim_scripts/`
- 产物：`*.jou`、`*.log`、`*.rpt`、`*.pb`、`*.wdb`、`*.wdf`、`*.dcp`、`*.bit`、`*.bin` 等
- 自动导出的仿真网表与 stub：`*_sim_netlist.*`、`*_stub.*`

## 快速开始（仿真）

1. 使用任意仿真器（xsim/ModelSim/Questa），从 `sim/` 运行 `tb_*.v`。
2. 需要时将 Xilinx Floating-Point IP 包含到仿真库。

## 快速开始（综合/实现）

- 建议用 Tcl 重建工程（推荐后续添加 `scripts/`）：
  - 读取 `rtl/` 下源码
  - 根据需要添加 IP（如 Floating-Point IP）
  - 约束（xdc）与顶层（如 `GP_Plus_top.v`）

## 版本控制建议

- 只提交：`rtl/`、`sim/`、`docs/` 和必要的脚本/约束。
- 不提交：Vivado 生成目录与大产物（已由 `.gitignore` 屏蔽）。
- 已保留 IP 接口模板：`.veo/.vho`（位于 `GP_Plus.ip_user_files/ip/**`），其余 IP 生成文件仍忽略。

## 后续改进

- 增加 `scripts/` 与 `create_project.tcl`，实现一键重建 Vivado 工程。
- 添加 CI 仿真（GitHub Actions + iverilog/xsim）。
- 提供波形/结果比对脚本。
