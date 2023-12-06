// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_APB_TIMER_SS_SQR_SV__
`define __UVME_APB_TIMER_SS_SQR_SV__


/**
 * Component on which all APB simple timer unit Sub-System environment (uvme_apb_timer_ss_env_c) Sequences are run.
 * @ingroup uvme_apb_timer_ss_comps
 */
class uvme_apb_timer_ss_sqr_c extends uvmx_ss_env_sqr_c #(
   .T_CFG  (uvme_apb_timer_ss_cfg_c  ),
   .T_CNTXT(uvme_apb_timer_ss_cntxt_c)
);

   /// @name Sequencer handles
   /// @{
   uvma_apb_sqr_c  proc_agent_sequencer; ///< Processor interface sequencer
   uvme_tcounter_b_sqr_c  counter_lo_b_env_sequencer; ///< Counter block 0 sequencer
   uvme_tcounter_b_sqr_c  counter_hi_b_env_sequencer; ///< Counter block 1 sequencer
   uvme_tprescaler_b_sqr_c  prescaler_lo_b_env_sequencer; ///< Prescaler block 0 sequencer
   uvme_tprescaler_b_sqr_c  prescaler_hi_b_env_sequencer; ///< Prescaler block 1 sequencer
   /// @}


   `uvm_component_utils(uvme_apb_timer_ss_sqr_c)


   /**
    * Default constructor.
    */
   function new(string name="uvme_apb_timer_ss_sqr", uvm_component parent=null);
      super.new(name, parent);
   endfunction

endclass


`endif // __UVME_APB_TIMER_SS_SQR_SV__