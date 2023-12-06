// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_APB_TIMER_SS_CNTXT_SV__
`define __UVME_APB_TIMER_SS_CNTXT_SV__


/**
 * Object encapsulating all state variables for APB simple timer unit Sub-System environment (uvme_apb_timer_ss_env_c) components.
 * @ingroup uvme_apb_timer_ss_obj
 */
class uvme_apb_timer_ss_cntxt_c extends uvmx_ss_env_cntxt_c #(
   .T_CFG      (uvme_apb_timer_ss_cfg_c           ),
   .T_REG_MODEL(uvme_apb_timer_ss_reg_block_c     ),
   .T_PROBE_VIF(virtual uvme_apb_timer_ss_probe_if)
);

   /// @name Agents
   /// @{
   uvma_apb_cntxt_c  proc_agent_cntxt; ///< Processor interface agent context
   uvma_irq_cntxt_c  irq_events_agent_cntxt; ///< Events IRQ agent context
   /// @}

   /// @name Blocks
   /// @{
   uvme_tcounter_b_cntxt_c  counter_lo_b_env_cntxt; ///< Counter block 0 block context
   uvme_tcounter_b_cntxt_c  counter_hi_b_env_cntxt; ///< Counter block 1 block context
   uvme_tprescaler_b_cntxt_c  prescaler_lo_b_env_cntxt; ///< Prescaler block 0 block context
   uvme_tprescaler_b_cntxt_c  prescaler_hi_b_env_cntxt; ///< Prescaler block 1 block context
   /// @}


   `uvm_object_utils_begin(uvme_apb_timer_ss_cntxt_c)
      `uvm_field_enum(uvmx_reset_state_enum, reset_state, UVM_DEFAULT)
      `uvm_field_object(proc_agent_cntxt, UVM_DEFAULT)
      `uvm_field_object(irq_events_agent_cntxt, UVM_DEFAULT)
      `uvm_field_object(counter_lo_b_env_cntxt, UVM_DEFAULT)
      `uvm_field_object(counter_hi_b_env_cntxt, UVM_DEFAULT)
      `uvm_field_object(prescaler_lo_b_env_cntxt, UVM_DEFAULT)
      `uvm_field_object(prescaler_hi_b_env_cntxt, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   function new(string name="uvme_apb_timer_ss_cntxt");
      super.new(name);
   endfunction

   /**
    * Creates objects.
    */
   virtual function void build(uvme_apb_timer_ss_cfg_c cfg);
      proc_agent_cntxt = uvma_apb_cntxt_c::type_id::create("proc_cntxt");
      irq_events_agent_cntxt = uvma_irq_cntxt_c::type_id::create("irq_events_cntxt");
      counter_lo_b_env_cntxt = uvme_tcounter_b_cntxt_c::type_id::create("counter_lo_b_env_cntxt");
      counter_hi_b_env_cntxt = uvme_tcounter_b_cntxt_c::type_id::create("counter_hi_b_env_cntxt");
      prescaler_lo_b_env_cntxt = uvme_tprescaler_b_cntxt_c::type_id::create("prescaler_lo_b_env_cntxt");
      prescaler_hi_b_env_cntxt = uvme_tprescaler_b_cntxt_c::type_id::create("prescaler_hi_b_env_cntxt");
   endfunction

   /**
    * Returns all state variables to initial values.
    */
   virtual function void do_reset(uvme_apb_timer_ss_cfg_c cfg);
      proc_agent_cntxt.reset();
      irq_events_agent_cntxt.reset();
      counter_lo_b_env_cntxt.reset();
      counter_hi_b_env_cntxt.reset();
      prescaler_lo_b_env_cntxt.reset();
      prescaler_hi_b_env_cntxt.reset();
   endfunction

endclass


`endif // __UVME_APB_TIMER_SS_CNTXT_SV__