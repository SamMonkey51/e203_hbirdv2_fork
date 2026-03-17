// ================================================================
// [阅读导航-自动生成] 文件：sirv_AsyncResetReg.v
// 说明：下面列出可能引用/实例化本文件模块的上层文件，便于从系统入口反向追踪。
// 引用该文件的可能位置：
//   - rtl/e203/perips/sirv_AsyncResetRegVec.v
//   - rtl/e203/perips/sirv_AsyncResetRegVec_1.v
//   - rtl/e203/perips/sirv_AsyncResetRegVec_129.v
//   - rtl/e203/perips/sirv_AsyncResetRegVec_36.v
//   - rtl/e203/perips/sirv_ResetCatchAndSync.v
//   - rtl/e203/perips/sirv_ResetCatchAndSync_2.v
//   - rtl/e203/perips/sirv_pmu.v
//   - rtl/e203/perips/sirv_rtc.v
//   - rtl/e203/perips/sirv_wdog.v
// ================================================================

// ================================================================
//   - rtl/e203/perips/sirv_AsyncResetRegVec.v
//   - rtl/e203/perips/sirv_AsyncResetRegVec_1.v
//   - rtl/e203/perips/sirv_AsyncResetRegVec_129.v
//   - rtl/e203/perips/sirv_AsyncResetRegVec_36.v
//   - rtl/e203/perips/sirv_ResetCatchAndSync.v
//   - rtl/e203/perips/sirv_ResetCatchAndSync_2.v
//   - rtl/e203/perips/sirv_pmu.v
//   - rtl/e203/perips/sirv_rtc.v
//   - rtl/e203/perips/sirv_wdog.v
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
                                                                         
                                                                         
                                                                         
// 模块说明：sirv_AsyncResetReg，该模块实现当前文件中的一部分核心功能。
module sirv_AsyncResetReg (
                      input      d,
                      output reg q,
                      input      en,

                      input      clk,
                      input      rst);
   
// 逻辑块说明：always 块，用于在触发条件满足时更新寄存器或计算组合输出。
   always @(posedge clk or posedge rst) begin

      if (rst) begin
         q <= 1'b0;
      end else if (en) begin
         q <= d;
      end
   end
   

endmodule // AsyncResetReg

