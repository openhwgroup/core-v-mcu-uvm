// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_DBG_CFG_SV__
`define __UVMA_CVMCU_DBG_CFG_SV__


/**
 * Object encapsulating all parameters for creating, connecting and running all CORE-V-MCU Debug Interface Agent (uvma_cvmcu_dbg_agent_c) components.
 * @ingroup uvma_cvmcu_dbg_obj
 */
class uvma_cvmcu_dbg_cfg_c extends uvmx_agent_cfg_c;

   /// @name Settings
   /// @{
   rand uvma_cvmcu_dbg_mode_enum  drv_mode; ///< Specifies which data stream to drive when in active mode.
   rand bit  drv_idle_random; ///< Specifies the type of data to send during idle cycles
   /// @}

   /// @name Sequence Types
   /// @{
   uvm_object_wrapper  core_drv_seq_type; ///< Type for CORE Driver Sequence started by agent during run_phase().
   uvm_object_wrapper  sys_drv_seq_type; ///< Type for SYS Driver Sequence started by agent during run_phase().
   /// @}


   `uvm_object_utils_begin(uvma_cvmcu_dbg_cfg_c)
      `uvm_field_int(enabled, UVM_DEFAULT)
      `uvm_field_int(bypass_mode, UVM_DEFAULT)
      `uvm_field_enum(uvm_active_passive_enum, is_active, UVM_DEFAULT)
      `uvm_field_enum(uvmx_reset_type_enum, reset_type, UVM_DEFAULT)
      `uvm_field_enum(uvma_cvmcu_dbg_mode_enum, drv_mode, UVM_DEFAULT)
      `uvm_field_int(drv_idle_random, UVM_DEFAULT)
      `uvm_field_enum(uvm_sequencer_arb_mode, sqr_arb_mode, UVM_DEFAULT)
   `uvm_object_utils_end



   /**
    * Restricts settings randomization space.
    */
   constraint rules_cons {
      soft drv_idle_random == 0;
   }


   /**
    * Default constructor.
    */
   function new(string name="uvma_cvmcu_dbg_cfg");
      super.new(name);
   endfunction

   /**
    * Specifies agent sequence types for driving and monitoring.
    */
   virtual function void set_seq_types();
      mon_seq_type  = uvma_cvmcu_dbg_mon_seq_c ::get_type();
      idle_seq_type = uvma_cvmcu_dbg_idle_seq_c::get_type();
      core_drv_seq_type = uvma_cvmcu_dbg_core_drv_seq_c::get_type();
      sys_drv_seq_type = uvma_cvmcu_dbg_sys_drv_seq_c::get_type();
   endfunction

   /**
    * Implement or remove uvma_cvmcu_dbg_cfg_c::post_randomize()
    */
   virtual function void post_randomize_work();
   endfunction

endclass


`endif // __UVMA_CVMCU_DBG_CFG_SV__