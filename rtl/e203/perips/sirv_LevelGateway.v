// ================================================================
// [阅读导航-自动生成] 文件：sirv_LevelGateway.v
// 说明：下面列出可能引用/实例化本文件模块的上层文件，便于从系统入口反向追踪。
// 引用该文件的可能位置：
//   - rtl/e203/perips/sirv_plic_man.v
// ================================================================

// ================================================================
//   - rtl/e203/perips/sirv_plic_man.v
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
                                                                         
                                                                         
                                                                         
// 模块说明：sirv_LevelGateway，该模块实现当前文件中的一部分核心功能。
module sirv_LevelGateway(
  input   clock,
  input   reset,
  input   io_interrupt,
  output  io_plic_valid,
  input   io_plic_ready,
  input   io_plic_complete
);
  reg  inFlight;
  reg [31:0] GEN_2;
  wire  T_12;
  wire  GEN_0;
  wire  GEN_1;
  wire  T_16;
  wire  T_17;
  assign io_plic_valid = T_17;
  assign T_12 = io_interrupt & io_plic_ready;
  assign GEN_0 = T_12 ? 1'h1 : inFlight;
  assign GEN_1 = io_plic_complete ? 1'h0 : GEN_0;
  assign T_16 = inFlight == 1'h0;
  assign T_17 = io_interrupt & T_16;

// 逻辑块说明：always 块，用于在触发条件满足时更新寄存器或计算组合输出。
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      inFlight <= 1'h0;
    end else begin
      if (io_plic_complete) begin
        inFlight <= 1'h0;
      end else begin
        if (T_12) begin
          inFlight <= 1'h1;
        end
      end
    end
  end
endmodule

