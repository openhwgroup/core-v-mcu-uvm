// Copyright 2022 Datum Technology Corporation
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
// Licensed under the Solderpad Hardware License v 2.1 (the "License"); you may not use this file except in compliance
// with the License, or, at your option, the Apache License version 2.0.  You may obtain a copy of the License at
//                                        https://solderpad.org/licenses/SHL-2.1/
// Unless required by applicable law or agreed to in writing, any work distributed under the License is distributed on
// an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations under the License.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_PKG_SV__
`define __UVME_CVMCU_PKG_SV__


// Pre-processor macros
`include "uvm_macros.svh"
`include "uvml_macros.sv"
`include "uvml_sb_macros.sv"
`include "uvml_ral_macros.sv"
`include "uvma_clk_macros.sv"
`include "uvma_reset_macros.sv"
`include "uvma_obi_macros.sv"
`include "uvme_cvmcu_macros.sv"

// Interface(s)


 /**
 * Encapsulates all the types needed for an UVM environment capable of driving/monitoring and verifying the behavior of
 * a CORE-V MCU design.
 */
package uvme_cvmcu_pkg;
   
   import uvm_pkg       ::*;
   import uvml_pkg      ::*;
   import uvml_sb_pkg   ::*;
   import uvml_ral_pkg  ::*;
   import uvma_clk_pkg::*;
   import uvma_reset_pkg::*;
   import uvma_obi_pkg::*;
   
   // Constants / Structs / Enums
   `include "uvme_cvmcu_tdefs.sv"
   `include "uvme_cvmcu_constants.sv"
   
   // Register Abstraction Layer
   `include "uvme_cvmcu_reg_block.sv"
   
   // Objects
   `include "uvme_cvmcu_cfg.sv"
   `include "uvme_cvmcu_cntxt.sv"
   
   // Predictor
   `include "uvme_cvmcu_prd.sv"
   
   // Environment components
   `include "uvme_cvmcu_cov_model.sv"
   `include "uvme_cvmcu_sb.sv"
   `include "uvme_cvmcu_vsqr.sv"
   `include "uvme_cvmcu_env.sv"
   
   // Sequences
   `include "uvme_cvmcu_vseq_lib.sv"
   
endpackage : uvme_cvmcu_pkg


// Module(s) / Checker(s)
`ifdef UVME_CVMCU_INC_CHKR
`include "uvma_cvmcu_chkr.sv"
`endif


`endif // __UVME_CVMCU_PKG_SV__
