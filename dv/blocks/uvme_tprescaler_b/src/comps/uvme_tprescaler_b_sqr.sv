// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_TPRESCALER_B_SQR_SV__
`define __UVME_TPRESCALER_B_SQR_SV__


/**
 * Sequencer running Timer unit prescaler Block Environment Sequences extending uvme_tprescaler_b_base_seq_c.
 * @ingroup uvme_tprescaler_b_comps
 */
class uvme_tprescaler_b_sqr_c extends uvmx_block_env_sqr_c #(
   .T_CFG  (uvme_tprescaler_b_cfg_c  ),
   .T_CNTXT(uvme_tprescaler_b_cntxt_c)
);

   /// @name Sequencers
   /// @{
   uvma_tprescaler_b_sqr_c  agent_sequencer; ///< Block Agent Sequencer.
   /// @}


   `uvm_component_utils(uvme_tprescaler_b_sqr_c)


   /**
    * Default constructor.
    */
   function new(string name="uvme_tprescaler_b_sqr", uvm_component parent=null);
      super.new(name, parent);
   endfunction

endclass : uvme_tprescaler_b_sqr_c


`endif // __UVME_TPRESCALER_B_SQR_SV__