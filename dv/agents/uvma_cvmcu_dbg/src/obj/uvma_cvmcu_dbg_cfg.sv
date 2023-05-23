// Copyright 2023 Acme Enterprises
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_DBG_CFG_SV__
`define __UVMA_CVMCU_DBG_CFG_SV__


/**
 * Object encapsulating all parameters for creating, connecting and running all CORE-V-MCU Debug Interface Agent (uvma_cvmcu_dbg_agent_c) components.
 * @ingroup uvma_cvmcu_dbg_obj
 */
class uvma_cvmcu_dbg_cfg_c extends uvmx_agent_cfg_c;

   /// @name Active Parameters
   /// @{
   rand uvma_cvmcu_dbg_mode_enum  drv_mode; ///< Specifies which data stream to drive when in active mode.
   rand bit  drv_idle_random; ///< Specifies the type of data to send during idle cycles
   /// @}

   /// @name Virtual Sequence Types
   /// @{
   uvm_object_wrapper  core_drv_vseq_type; ///< Type for CORE Driver Virtual Sequence to be started by agent at start of run_phase().
   uvm_object_wrapper  sys_drv_vseq_type; ///< Type for SYS Driver Virtual Sequence to be started by agent at start of run_phase().
   /// @}


   `uvm_object_utils_begin(uvma_cvmcu_dbg_cfg_c)
      `uvm_field_int (                         enabled  , UVM_DEFAULT)
      `uvm_field_enum(uvm_active_passive_enum, is_active, UVM_DEFAULT)
      `uvm_field_enum(uvma_cvmcu_dbg_mode_enum, drv_mode, UVM_DEFAULT)
      `uvm_field_int (drv_idle_random, UVM_DEFAULT)
      `uvm_field_enum(uvmx_reset_type_enum  , reset_type       , UVM_DEFAULT)
      `uvm_field_enum(uvm_sequencer_arb_mode, sqr_arb_mode     , UVM_DEFAULT)
      `uvm_field_int (                        bypass_mode      , UVM_DEFAULT)
      `uvm_field_int (                        cov_model_enabled, UVM_DEFAULT)
      `uvm_field_int (                        trn_log_enabled  , UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   function new(string name="uvma_cvmcu_dbg_cfg");
      super.new(name);
   endfunction

   /**
    * Sets default Virtual Sequence types.
    */
   virtual function void create_objects();
      mon_vseq_type  = uvma_cvmcu_dbg_mon_vseq_c ::get_type();
      idle_vseq_type = uvma_cvmcu_dbg_idle_vseq_c::get_type();
      core_drv_vseq_type = uvma_cvmcu_dbg_core_drv_vseq_c::get_type();
      sys_drv_vseq_type = uvma_cvmcu_dbg_sys_drv_vseq_c::get_type();
   endfunction

endclass : uvma_cvmcu_dbg_cfg_c


`endif // __UVMA_CVMCU_DBG_CFG_SV__