// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_TCOUNTER_B_SQR_SV__
`define __UVME_TCOUNTER_B_SQR_SV__


/**
 * Sequencer running Timer unit counter Block Environment Sequences extending uvme_tcounter_b_base_seq_c.
 * @ingroup uvme_tcounter_b_comps
 */
class uvme_tcounter_b_sqr_c extends uvmx_block_env_sqr_c #(
   .T_CFG  (uvme_tcounter_b_cfg_c  ),
   .T_CNTXT(uvme_tcounter_b_cntxt_c)
);

   /// @name Sequencers
   /// @{
   uvma_tcounter_b_sqr_c  agent_sequencer; ///< Block Agent Sequencer.
   /// @}


   `uvm_component_utils(uvme_tcounter_b_sqr_c)


   /**
    * Default constructor.
    */
   function new(string name="uvme_tcounter_b_sqr", uvm_component parent=null);
      super.new(name, parent);
   endfunction

endclass : uvme_tcounter_b_sqr_c


`endif // __UVME_TCOUNTER_B_SQR_SV__