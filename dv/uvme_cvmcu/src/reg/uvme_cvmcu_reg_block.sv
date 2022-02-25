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


`ifndef __UVME_CVMCU_REG_BLOCK_SV__
`define __UVME_CVMCU_REG_BLOCK_SV__


/**
 * Top-level object encapsulating CORE-V MCU Register Block.
 */
class uvme_cvmcu_reg_block_c extends uvm_reg_block;
   
   // Objects
   uvme_cvmcu_cfg_c    cfg;
   uvme_cvmcu_cntxt_c  cntxt;
   
   // Sub-Blocks
   // TODO Add sub-block(s)
   //      Ex: rand uvme_cvmcu_abc_reg_block_c  abc;
   
   // Registers
   // TODO Add register(s)
   //      Ex: rand uvme_cvmcu_xyz_reg_c  xyz;
   
   
   `uvm_object_utils_begin(uvme_cvmcu_reg_block_c)
      // TODO Add field macros for sub-block(s) and register(s)
      //      Ex: `uvm_field_object(abc, UVM_DEFAULT)
      //          `uvm_field_object(xyz, UVM_DEFAULT)
   `uvm_object_utils_end
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvme_cvmcu_reg_block", int has_coverage=UVM_NO_COVERAGE);
   
   /**
    * Creates register and register block instances and associates them with this register block.
    */
   extern virtual function void build();
   
   /**
    * Associates sub-register blocks and registers with this register block.
    */
   extern virtual function void connect();
   
   /**
    * Creates sub-block(s).
    */
   extern function void create_blocks();
   
   /**
    * Creates register(s).
    */
   extern function void create_regs();
   
   /**
    * Creates register map.
    */
   extern function void create_reg_map();
   
   /**
    * Adds register(s) to register map.
    */
   extern function void add_regs_to_map();
   
endclass : uvme_cvmcu_reg_block_c


function uvme_cvmcu_reg_block_c::new(string name="uvme_cvmcu_reg_block", int has_coverage=UVM_NO_COVERAGE);
   
   super.new(name, has_coverage);
   
endfunction : new


function void uvme_cvmcu_reg_block_c::build();
   
   create_blocks  ();
   create_regs    ();
   create_reg_map ();
   
endfunction: build


function void uvme_cvmcu_reg_block_c::connect();
   
   add_regs_to_map();
   lock_model     ();
   
endfunction: connect


function void uvme_cvmcu_reg_block_c::create_blocks();
   
   // TODO Implement uvme_cvmcu_reg_block_c::create_blocks()
   //      Ex: abc = uvme_cvmcu_abc_reg_block_c::type_id::create("abc");
   //          abc.configure(this);
   //          abc.build();
   
endfunction : create_blocks


function void uvme_cvmcu_reg_block_c::create_regs();
   
   // TODO Implement uvme_cvmcu_reg_block_c::create_regs()
   //      Ex:  xyz = uvme_cvmcu_xyz_reg_c::type_id::create("xyz");
   //           xyz.configure(this);
   //           xyz.build();
   
endfunction : create_regs


function void uvme_cvmcu_reg_block_c::create_reg_map();
   
   default_map = create_map(
      .name     ("default_map"),
      .base_addr(cfg.reg_block_base_address),
      .n_bytes  (uvme_cvmcu_reg_block_reg_n_bytes),
      .endian   (UVM_LITTLE_ENDIAN)
   );
   
endfunction : create_reg_map


function void uvme_cvmcu_reg_block_c::add_regs_to_map();
   
   // TODO Implement uvme_cvmcu_reg_block_c::add_regs_to_map()
   //      Ex: default_map.add_reg(
   //             .rg    (xyz),
   //             .offset(32'h00_00_00_00),
   //             .rights("RW")
   //          );
   
endfunction : add_regs_to_map


`endif // _UVME_CVMCU_REG_BLOCK_SV__
