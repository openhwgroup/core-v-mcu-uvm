// Copyright 2022 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_CNTXT_SV__
`define __UVME_CVMCU_CNTXT_SV__


/**
 * Object encapsulating all state variables for CORE-V MCU environment (uvme_cvmcu_env_c) components.
 */
class uvme_cvmcu_cntxt_c extends uvm_object;

   // Agent context handles
   uvma_clk_cntxt_c         sys_clk_cntxt;
   uvma_reset_cntxt_c       sys_reset_cntxt;
   uvma_obi_cntxt_c         obi_instr_cntxt;
   uvma_obi_cntxt_c         obi_data_cntxt;
   uvma_cvmcu_intr_cntxt_c  intr_cntxt;

   // Scoreboard context handles
   uvml_sb_simplex_cntxt_c  dma_sb_cntxt;

   // Events
   uvm_event  sample_cfg_e;
   uvm_event  sample_cntxt_e;


   `uvm_object_utils_begin(uvme_cvmcu_cntxt_c)
      `uvm_field_object(sys_clk_cntxt  , UVM_DEFAULT)
      `uvm_field_object(sys_reset_cntxt, UVM_DEFAULT)
      `uvm_field_object(obi_instr_cntxt, UVM_DEFAULT)
      `uvm_field_object(obi_data_cntxt , UVM_DEFAULT)
      `uvm_field_object(intr_cntxt     , UVM_DEFAULT)

      `uvm_field_object(dma_sb_cntxt, UVM_DEFAULT)

      `uvm_field_event(sample_cfg_e  , UVM_DEFAULT)
      `uvm_field_event(sample_cntxt_e, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Builds events and sub-context objects.
    */
   extern function new(string name="uvme_cvmcu_cntxt");


   /**
    * TODO Describe uvme_cvmcu_cntxt_c::reset()
    */
   extern function void reset();

endclass : uvme_cvmcu_cntxt_c


function uvme_cvmcu_cntxt_c::new(string name="uvme_cvmcu_cntxt");

   super.new(name);

   sys_clk_cntxt   = uvma_reset_cntxt_c     ::type_id::create("sys_clk_cntxt"  );
   sys_reset_cntxt = uvma_reset_cntxt_c     ::type_id::create("sys_reset_cntxt");
   obi_instr_cntxt = uvma_obi_cntxt_c       ::type_id::create("obi_instr_cntxt");
   obi_data_cntxt  = uvma_obi_cntxt_c       ::type_id::create("obi_data_cntxt" );
   intr_cntxt      = uvma_cvmcu_intr_cntxt_c::type_id::create("intr_cntxt"     );

   // Create uvme_cvmcu_cntxt_c scoreboard context objects
   dma_sb_cntxt = uvml_sb_simplex_cntxt_c::type_id::create("dma_sb_cntxt");

   sample_cfg_e   = new("sample_cfg_e"  );
   sample_cntxt_e = new("sample_cntxt_e");

endfunction : new


function void uvme_cvmcu_cntxt_c::reset();

   obi_instr_cntxt.reset();
   obi_data_cntxt .reset();
   intr_cntxt     .reset();

endfunction : reset


`endif // __UVME_CVMCU_CNTXT_SV__
