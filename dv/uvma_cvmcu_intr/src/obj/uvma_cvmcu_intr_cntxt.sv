// Copyright 2022 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_INTR_CNTXT_SV__
`define __UVMA_CVMCU_INTR_CNTXT_SV__


/**
 * Object encapsulating all state variables for all CORE-V MCU Interrupt agent (uvma_cvmcu_intr_agent_c) components.
 * @ingroup uvma_cvmcu_intr_obj
 */
class uvma_cvmcu_intr_cntxt_c extends uvml_cntxt_c;

   virtual uvma_cvmcu_intr_if  vif; ///< Handle to agent virtual interface.  Used by monitor and driver.

   /// @defgroup Integrals
   /// @{
   uvml_reset_state_enum  reset_state = UVML_RESET_STATE_PRE_RESET;
   /// @}

   /// @defgroup Objects
   /// @{
   uvm_event  sample_cfg_e  ; ///< Triggers sampling of the agent configuration by the functional coverage model.
   uvm_event  sample_cntxt_e; ///< Triggers sampling of the agent context by the functional coverage model.
   /// @}


   `uvm_object_utils_begin(uvma_cvmcu_intr_cntxt_c)
      `uvm_field_enum(uvml_reset_state_enum, reset_state, UVM_DEFAULT)
      `uvm_field_event(sample_cfg_e  , UVM_DEFAULT)
      `uvm_field_event(sample_cntxt_e, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Creates event objects.
    */
   extern function new(string name="uvma_cvmcu_intr_cntxt");

   /**
    * Returns all state variables to initial values.
    * Called by monitor (uvma_cvmcu_intr_mon_c) when it witnesses a reset pulse.
    */
   extern function void reset();

endclass : uvma_cvmcu_intr_cntxt_c


function uvma_cvmcu_intr_cntxt_c::new(string name="uvma_cvmcu_intr_cntxt");

   super.new(name);
   sample_cfg_e   = new("sample_cfg_e"  );
   sample_cntxt_e = new("sample_cntxt_e");

endfunction : new


function void uvma_cvmcu_intr_cntxt_c::reset();

   // TODO Implement uvma_cvmcu_intr_cntxt_c::reset()
   //      Ex: abc = 0;

endfunction : reset


`endif // __UVMA_CVMCU_INTR_CNTXT_SV__
