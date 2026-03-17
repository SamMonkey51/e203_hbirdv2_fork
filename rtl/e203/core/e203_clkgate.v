// ================================================================
// [阅读导航-自动生成] 文件：e203_clkgate.v
// 说明：下面列出可能引用/实例化本文件模块的上层文件，便于从系统入口反向追踪。
// 引用该文件的可能位置：
//   - rtl/e203/core/e203_clk_ctrl.v
//   - rtl/e203/core/e203_exu_regfile.v
//   - rtl/e203/general/sirv_1cyc_sram_ctrl.v
//   - rtl/e203/perips/apb_adv_timer/apb_adv_timer.v
//   - rtl/e203/subsys/e203_subsys_gfcm.v
//   - rtl/e203/subsys/e203_subsys_pllclkdiv.v
// ================================================================

// ================================================================
//   - rtl/e203/core/e203_clk_ctrl.v
//   - rtl/e203/core/e203_exu_regfile.v
//   - rtl/e203/general/sirv_1cyc_sram_ctrl.v
//   - rtl/e203/perips/apb_adv_timer/apb_adv_timer.v
//   - rtl/e203/subsys/e203_subsys_gfcm.v
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
// Designer   : Bob Hu
//
// Description:
//  The clock gating cell
//
// ====================================================================
`include "e203_defines.v"

// 模块说明：e203_clkgate，该模块实现当前文件中的一部分核心功能。
module e203_clkgate (
  input   clk_in,
  input   test_mode,
  input   clock_en,
  output  clk_out
);

`ifdef FPGA_SOURCE//{
    // In the FPGA, the clock gating is just pass through
    assign clk_out = clk_in;
`endif//}

`ifndef FPGA_SOURCE//{

reg enb;

// 逻辑块说明：always 块，用于在触发条件满足时更新寄存器或计算组合输出。
always@(*)
  if (!clk_in)
    enb = (clock_en | test_mode);

assign clk_out = enb & clk_in;

`endif//}

endmodule 

