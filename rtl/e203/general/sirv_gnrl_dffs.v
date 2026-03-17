// ================================================================
// [阅读导航-自动生成] 文件：sirv_gnrl_dffs.v
// 说明：下面列出可能引用/实例化本文件模块的上层文件，便于从系统入口反向追踪。
// 引用该文件的可能位置：
//   - rtl/e203/core/e203_clk_ctrl.v
//   - rtl/e203/core/e203_exu_alu_dpath.v
//   - rtl/e203/core/e203_exu_alu_lsuagu.v
//   - rtl/e203/core/e203_exu_alu_muldiv.v
//   - rtl/e203/core/e203_exu_csr.v
//   - rtl/e203/core/e203_exu_excp.v
//   - rtl/e203/core/e203_exu_oitf.v
//   - rtl/e203/core/e203_exu_regfile.v
//   - rtl/e203/core/e203_ifu_ifetch.v
//   - rtl/e203/core/e203_ifu_ift2icb.v
//   - rtl/e203/core/e203_ifu_litebpu.v
//   - rtl/e203/core/e203_itcm_ctrl.v
//   - rtl/e203/core/e203_lsu_ctrl.v
//   - rtl/e203/debug/sirv_debug_csr.v
//   - rtl/e203/debug/sirv_debug_module.v
//   - rtl/e203/debug/sirv_debug_ram.v
//   - rtl/e203/general/sirv_gnrl_bufs.v
//   - rtl/e203/general/sirv_gnrl_icbs.v
//   - rtl/e203/perips/sirv_aon_lclkgen_regs.v
//   - rtl/e203/perips/sirv_aon_wrapper.v
//   - rtl/e203/perips/sirv_clint_top.v
//   - rtl/e203/perips/sirv_hclkgen_regs.v
//   - rtl/e203/perips/sirv_plic_man.v
//   - rtl/e203/subsys/e203_subsys_nice_core.v
//   - rtl/e203/subsys/e203_subsys_pllclkdiv.v
// ================================================================

// ================================================================
//   - rtl/e203/core/e203_clk_ctrl.v
//   - rtl/e203/core/e203_exu_alu_dpath.v
//   - rtl/e203/core/e203_exu_alu_lsuagu.v
//   - rtl/e203/core/e203_exu_alu_muldiv.v
//   - rtl/e203/core/e203_exu_csr.v
//   - rtl/e203/core/e203_exu_excp.v
//   - rtl/e203/core/e203_exu_oitf.v
//   - rtl/e203/core/e203_exu_regfile.v
//   - rtl/e203/core/e203_ifu_ifetch.v
//   - rtl/e203/core/e203_ifu_ift2icb.v
//   - rtl/e203/core/e203_ifu_litebpu.v
//   - rtl/e203/core/e203_itcm_ctrl.v
//   - rtl/e203/core/e203_lsu_ctrl.v
//   - rtl/e203/debug/sirv_debug_csr.v
//   - rtl/e203/debug/sirv_debug_module.v
//   - rtl/e203/debug/sirv_debug_ram.v
//   - rtl/e203/general/sirv_gnrl_bufs.v
//   - rtl/e203/general/sirv_gnrl_icbs.v
//   - rtl/e203/perips/sirv_aon_lclkgen_regs.v
//   - rtl/e203/perips/sirv_aon_wrapper.v
//   - rtl/e203/perips/sirv_clint_top.v
//   - rtl/e203/perips/sirv_hclkgen_regs.v
//   - rtl/e203/perips/sirv_plic_man.v
//   - rtl/e203/subsys/e203_subsys_nice_core.v
//   - rtl/e203/subsys/e203_subsys_pllclkdiv.v
// ================================================================

 /*                                                                      
 Copyright 2018-2020 Nuclei System Technology, Inc.                
                                                                         
 Licensed under the Apache License, Version 2.0 (the "License");         
 you may not use this file except in compliance with the License.        
 You may obtain a copy of the License at                                 
                                                                         
     http://www.apache.org/licenses/LICENSE-2.0                          
                                                                         
  Unless required by applicable law or agreed to in writing, software    
 distributed under the License is distributed on an "AS IS" BASIS,       
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and     
 limitations under the License.                                          
 */                                                                      
                                                                         
                                                                         
                                                                         
//=====================================================================
//
// Designer   : Bob Hu
//
// Description:
//  All of the general DFF and Latch modules
//
// ====================================================================

//


//
// ===========================================================================
//
// Description:
//  Verilog module sirv_gnrl DFF with Load-enable and Reset
//  Default reset value is 1
//
// ===========================================================================

module sirv_gnrl_dfflrs # (
  parameter DW = 32
) (

  input               lden, 
  input      [DW-1:0] dnxt,
  output     [DW-1:0] qout,

  input               clk,
  input               rst_n
);

reg [DW-1:0] qout_r;

// 逻辑块说明：always 块，用于在触发条件满足时更新寄存器或计算组合输出。
always @(posedge clk or negedge rst_n)
begin : DFFLRS_PROC
  if (rst_n == 1'b0)
    qout_r <= {DW{1'b1}};
  else if (lden == 1'b1)
    qout_r <= #1 dnxt;
end

assign qout = qout_r;

`ifndef FPGA_SOURCE//{
`ifndef DISABLE_SV_ASSERTION//{
//synopsys translate_off
sirv_gnrl_xchecker # (
  .DW(1)
) sirv_gnrl_xchecker(
  .i_dat(lden),
  .clk  (clk)
);
//synopsys translate_on
`endif//}
`endif//}
    

endmodule
// ===========================================================================
//
// Description:
//  Verilog module sirv_gnrl DFF with Load-enable and Reset
//  Default reset value is 0
//
// ===========================================================================

module sirv_gnrl_dfflr # (
  parameter DW = 32
) (

  input               lden, 
  input      [DW-1:0] dnxt,
  output     [DW-1:0] qout,

  input               clk,
  input               rst_n
);

reg [DW-1:0] qout_r;

// 逻辑块说明：always 块，用于在触发条件满足时更新寄存器或计算组合输出。
always @(posedge clk or negedge rst_n)
begin : DFFLR_PROC
  if (rst_n == 1'b0)
    qout_r <= {DW{1'b0}};
  else if (lden == 1'b1)
    qout_r <= #1 dnxt;
end

assign qout = qout_r;

`ifndef FPGA_SOURCE//{
`ifndef DISABLE_SV_ASSERTION//{
//synopsys translate_off
sirv_gnrl_xchecker # (
  .DW(1)
) sirv_gnrl_xchecker(
  .i_dat(lden),
  .clk  (clk)
);
//synopsys translate_on
`endif//}
`endif//}
    

endmodule
// ===========================================================================
//
// Description:
//  Verilog module sirv_gnrl DFF with Load-enable, no reset 
//
// ===========================================================================

module sirv_gnrl_dffl # (
  parameter DW = 32
) (

  input               lden, 
  input      [DW-1:0] dnxt,
  output     [DW-1:0] qout,

  input               clk 
);

reg [DW-1:0] qout_r;

// 逻辑块说明：always 块，用于在触发条件满足时更新寄存器或计算组合输出。
always @(posedge clk)
begin : DFFL_PROC
  if (lden == 1'b1)
    qout_r <= #1 dnxt;
end

assign qout = qout_r;

`ifndef FPGA_SOURCE//{
`ifndef DISABLE_SV_ASSERTION//{
//synopsys translate_off
sirv_gnrl_xchecker # (
  .DW(1)
) sirv_gnrl_xchecker(
  .i_dat(lden),
  .clk  (clk)
);
//synopsys translate_on
`endif//}
`endif//}
    

endmodule
// ===========================================================================
//
// Description:
//  Verilog module sirv_gnrl DFF with Reset, no load-enable
//  Default reset value is 1
//
// ===========================================================================

module sirv_gnrl_dffrs # (
  parameter DW = 32
) (

  input      [DW-1:0] dnxt,
  output     [DW-1:0] qout,

  input               clk,
  input               rst_n
);

reg [DW-1:0] qout_r;

// 逻辑块说明：always 块，用于在触发条件满足时更新寄存器或计算组合输出。
always @(posedge clk or negedge rst_n)
begin : DFFRS_PROC
  if (rst_n == 1'b0)
    qout_r <= {DW{1'b1}};
  else                  
    qout_r <= #1 dnxt;
end

assign qout = qout_r;

endmodule
// ===========================================================================
//
// Description:
//  Verilog module sirv_gnrl DFF with Reset, no load-enable
//  Default reset value is 0
//
// ===========================================================================

module sirv_gnrl_dffr # (
  parameter DW = 32
) (

  input      [DW-1:0] dnxt,
  output     [DW-1:0] qout,

  input               clk,
  input               rst_n
);

reg [DW-1:0] qout_r;

// 逻辑块说明：always 块，用于在触发条件满足时更新寄存器或计算组合输出。
always @(posedge clk or negedge rst_n)
begin : DFFR_PROC
  if (rst_n == 1'b0)
    qout_r <= {DW{1'b0}};
  else                  
    qout_r <= #1 dnxt;
end

assign qout = qout_r;

endmodule
// ===========================================================================
//
// Description:
//  Verilog module for general latch 
//
// ===========================================================================

module sirv_gnrl_ltch # (
  parameter DW = 32
) (

  //input               test_mode,
  input               lden, 
  input      [DW-1:0] dnxt,
  output     [DW-1:0] qout
);

reg [DW-1:0] qout_r;

// 逻辑块说明：always 块，用于在触发条件满足时更新寄存器或计算组合输出。
always @ * 
begin : LTCH_PROC
  if (lden == 1'b1)
    qout_r <= dnxt;
end

//assign qout = test_mode ? dnxt : qout_r;
assign qout = qout_r;

`ifndef FPGA_SOURCE//{
`ifndef DISABLE_SV_ASSERTION//{
//synopsys translate_off
always_comb
begin
  CHECK_THE_X_VALUE:
    assert (lden !== 1'bx) 
    else $fatal ("\n Error: Oops, detected a X value!!! This should never happen. \n");
end

//synopsys translate_on
`endif//}
`endif//}
    

endmodule
