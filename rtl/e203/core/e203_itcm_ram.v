// ================================================================
// [阅读导航-自动生成] 文件：e203_itcm_ram.v
// 说明：下面列出可能引用/实例化本文件模块的上层文件，便于从系统入口反向追踪。
// 引用该文件的可能位置：
//   - rtl/e203/core/e203_srams.v
// ================================================================

// ================================================================
//   - rtl/e203/core/e203_srams.v
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
//  The ITCM-SRAM module to implement ITCM SRAM
//
// ====================================================================

`include "e203_defines.v"

  `ifdef E203_HAS_ITCM //{
// 模块说明：e203_itcm_ram，该模块实现当前文件中的一部分核心功能。
module e203_itcm_ram(

  input                              sd,
  input                              ds,
  input                              ls,

  input                              cs,  
  input                              we,  
  input  [`E203_ITCM_RAM_AW-1:0] addr, 
  input  [`E203_ITCM_RAM_MW-1:0] wem,
  input  [`E203_ITCM_RAM_DW-1:0] din,          
  output [`E203_ITCM_RAM_DW-1:0] dout,
  input                              rst_n,
  input                              clk

);

 
  sirv_gnrl_ram #(
      `ifndef E203_HAS_ECC//{
    .FORCE_X2ZERO(0),
      `endif//}
    .DP(`E203_ITCM_RAM_DP),
    .DW(`E203_ITCM_RAM_DW),
    .MW(`E203_ITCM_RAM_MW),
    .AW(`E203_ITCM_RAM_AW) 
  ) u_e203_itcm_gnrl_ram(
  .sd  (sd  ),
  .ds  (ds  ),
  .ls  (ls  ),

  .rst_n (rst_n ),
  .clk (clk ),
  .cs  (cs  ),
  .we  (we  ),
  .addr(addr),
  .din (din ),
  .wem (wem ),
  .dout(dout)
  );
                                                      
endmodule
  `endif//}
