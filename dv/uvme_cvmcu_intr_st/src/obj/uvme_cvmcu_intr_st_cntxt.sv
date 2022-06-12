// Copyright 2022 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_INTR_ST_CNTXT_SV__
`define __UVME_CVMCU_INTR_ST_CNTXT_SV__


/**
 * Object encapsulating all state variables for CORE-V MCU Interrupt UVM Agent Self-Test Environment (uvme_cvmcu_intr_st_env_c) components.
 */
class uvme_cvmcu_intr_st_cntxt_c extends uvml_cntxt_c;

   /// @defgroup Objects
   /// @{
   uvma_cvmcu_intr_cntxt_c  active_cntxt ; ///< Active agent context handle
   uvma_cvmcu_intr_cntxt_c  passive_cntxt; ///< Passive agent context handle
   uvml_sb_simplex_cntxt_c  sb_cntxt; ///< Scoreboard context handle
   /// @}


   `uvm_object_utils_begin(uvme_cvmcu_intr_st_cntxt_c)
      `uvm_field_object(active_cntxt , UVM_DEFAULT)
      `uvm_field_object(passive_cntxt, UVM_DEFAULT)
      `uvm_field_object(sb_cntxt     , UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Creates sub-context objects.
    */
   extern function new(string name="uvme_cvmcu_intr_st_cntxt");

   /**
    * Forces all sub-context objects to reset.
    */
   extern function void reset();

endclass : uvme_cvmcu_intr_st_cntxt_c


function uvme_cvmcu_intr_st_cntxt_c::new(string name="uvme_cvmcu_intr_st_cntxt");

   super.new(name);

   active_cntxt  = uvma_cvmcu_intr_cntxt_c::type_id::create("active_cntxt" );
   passive_cntxt = uvma_cvmcu_intr_cntxt_c::type_id::create("passive_cntxt");
   sb_cntxt      = uvml_sb_simplex_cntxt_c::type_id::create("sb_cntxt");

endfunction : new


function void uvme_cvmcu_intr_st_cntxt_c::reset();

   active_cntxt .reset();
   passive_cntxt.reset();

endfunction : reset


`endif // __UVME_CVMCU_INTR_ST_CNTXT_SV__
