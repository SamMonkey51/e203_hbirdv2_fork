// ================================================================
// [阅读导航-自动生成] 文件：e203_subsys_hclkgen_rstsync.v
// 说明：下面列出可能引用/实例化本文件模块的上层文件，便于从系统入口反向追踪。
// 引用该文件的可能位置：
//   - rtl/e203/subsys/e203_subsys_hclkgen.v
// ================================================================

// ================================================================
//   - rtl/e203/subsys/e203_subsys_hclkgen.v
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
//  The Reset Sync module to implement reset control
//
// ====================================================================

`include "e203_defines.v"

// 模块说明：e203_subsys_hclkgen_rstsync，该模块实现当前文件中的一部分核心功能。
module e203_subsys_hclkgen_rstsync (
  input  clk,        // clock
  input  rst_n_a,      // async reset
  input  test_mode,  // test mode 

  output rst_n 

);

localparam RST_SYNC_LEVEL = `E203_ASYNC_FF_LEVELS;

reg [RST_SYNC_LEVEL-1:0] rst_sync_r; 

// 逻辑块说明：always 块，用于在触发条件满足时更新寄存器或计算组合输出。
always @(posedge clk or negedge rst_n_a)
begin:rst_sync_PROC
  if(rst_n_a == 1'b0)
    begin
      rst_sync_r[RST_SYNC_LEVEL-1:0] <= {RST_SYNC_LEVEL{1'b0}};
    end
  else
    begin
      rst_sync_r[RST_SYNC_LEVEL-1:0] <= {rst_sync_r[RST_SYNC_LEVEL-2:0],1'b1};
    end
end

assign rst_n = test_mode ? rst_n_a : rst_sync_r[`E203_ASYNC_FF_LEVELS-1];

endmodule

