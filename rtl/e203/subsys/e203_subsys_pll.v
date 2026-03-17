// ================================================================
// [阅读导航-自动生成] 文件：e203_subsys_pll.v
// 说明：下面列出可能引用/实例化本文件模块的上层文件，便于从系统入口反向追踪。
// 引用该文件的可能位置：
//   - rtl/e203/subsys/e203_subsys_hclkgen.v
//   - rtl/e203/subsys/e203_subsys_pllclkdiv.v
// ================================================================

// ================================================================
//   - rtl/e203/subsys/e203_subsys_hclkgen.v
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
//  The PLL module, need to be replaced with real PLL in ASIC flow
//
// ====================================================================

`include "e203_defines.v"


// 模块说明：e203_subsys_pll，该模块实现当前文件中的一部分核心功能。
module e203_subsys_pll(
  input  pll_asleep, // The asleep signal to PLL to power down it

  input  pllrefclk, // The reference clock into PLL
  output plloutclk, // The PLL generated clock

  input        pll_RESET,
  input [1:0]  pll_OD,
  input [7:0]  pll_M,
  input [4:0]  pll_N 
  );

  wire pllout;
  `ifdef FPGA_SOURCE//{
      // In FPGA, we have no PLL, so just diretly let it pass through
      assign pllout = pllrefclk;
  `else //}{
      assign pllout = pllrefclk;
  `endif//}

  assign plloutclk = pllout;
endmodule

