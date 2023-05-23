// Copyright 2023 Acme Enterprises
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_APB_TIMER_SS_VSQR_SV__
`define __UVME_APB_TIMER_SS_VSQR_SV__


/**
 * Component on which all APB simple timer unit Sub-System environment (uvme_apb_timer_ss_env_c) virtual sequences are run.
 * @ingroup uvme_apb_timer_ss_comps
 */
class uvme_apb_timer_ss_vsqr_c extends uvmx_ss_env_vsqr_c #(
   .T_CFG  (uvme_apb_timer_ss_cfg_c  ),
   .T_CNTXT(uvme_apb_timer_ss_cntxt_c)
);

   /// @name Sequencer handles
   /// @{
   uvma_apb_vsqr_c  proc_agent_vsequencer; ///< Processor interface sequencer
   uvme_tcounter_b_vsqr_c  counter_lo_b_env_vsequencer; ///< Counter block 0 sequencer
   uvme_tcounter_b_vsqr_c  counter_hi_b_env_vsequencer; ///< Counter block 1 sequencer
   uvme_tprescaler_b_vsqr_c  prescaler_lo_b_env_vsequencer; ///< Prescaler block 0 sequencer
   uvme_tprescaler_b_vsqr_c  prescaler_hi_b_env_vsequencer; ///< Prescaler block 1 sequencer
   /// @}


   `uvm_component_utils(uvme_apb_timer_ss_vsqr_c)


   /**
    * Default constructor.
    */
   function new(string name="uvme_apb_timer_ss_sqr", uvm_component parent=null);
      super.new(name, parent);
   endfunction

endclass : uvme_apb_timer_ss_vsqr_c


`endif // __UVME_APB_TIMER_SS_VSQR_SV__