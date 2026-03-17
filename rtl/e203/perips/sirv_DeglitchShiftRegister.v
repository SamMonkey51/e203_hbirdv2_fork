// ================================================================
// [阅读导航-自动生成] 文件：sirv_DeglitchShiftRegister.v
// 说明：下面列出可能引用/实例化本文件模块的上层文件，便于从系统入口反向追踪。
// 引用该文件的可能位置：
//   - rtl/e203/perips/sirv_aon_wrapper.v
// ================================================================

// ================================================================
//   - rtl/e203/perips/sirv_aon_wrapper.v
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
                                                                         
                                                                         
                                                                         
// 模块说明：sirv_DeglitchShiftRegister，该模块实现当前文件中的一部分核心功能。
module sirv_DeglitchShiftRegister(
  input   clock,
  input   reset,
  input   io_d,
  output  io_q
);
  reg  T_8;
  reg [31:0] GEN_0;
  reg  T_9;
  reg [31:0] GEN_1;
  reg  sync;
  reg [31:0] GEN_2;
  reg  last;
  reg [31:0] GEN_3;
  wire  T_12;
  assign io_q = T_12;
  assign T_12 = sync & last;
// 逻辑块说明：always 块，用于在触发条件满足时更新寄存器或计算组合输出。
  always @(posedge clock) begin// sync reg do not need reset, and the external reset is tied to 1, do not use it
    T_8 <= io_d;
    T_9 <= T_8;
    sync <= T_9;
    last <= sync;
  end
endmodule

