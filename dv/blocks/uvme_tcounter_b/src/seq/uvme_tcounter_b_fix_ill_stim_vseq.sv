// Copyright 2023 Acme Enterprises
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_TCOUNTER_B_FIX_ILL_STIM_VSEQ_SV__
`define __UVME_TCOUNTER_B_FIX_ILL_STIM_VSEQ_SV__


/**
 * Virtual Sequence that always generates the same (i.e. reference) partially illegal stimulus for the DUT.
 * @ingroup uvme_tcounter_b_seq
 */
class uvme_tcounter_b_fix_ill_stim_vseq_c extends uvme_tcounter_b_base_vseq_c;

   `uvm_object_utils(uvme_tcounter_b_fix_ill_stim_vseq_c)

   /**
    * Default constructor.
    */
   function new(string name="uvme_tcounter_b_fix_ill_stim_vseq");
      super.new(name);
   endfunction

   /**
    * TODO Describe uvme_tcounter_b_fix_ill_stim_vseq_c::body()
    */
   virtual task body();
      uvma_tcounter_b_seq_item_c  seq_item;
      // TODO Implement uvme_tcounter_b_fix_ill_stim_vseq_c::body()
      //      Ex: `uvmx_create_on(seq_item, p_sequencer.agent_vsequencer)
      //          seq_item.abc = 123;
      //          `uvmx_send(seq_item)
      //          `uvmx_create_on(seq_item, p_sequencer.agent_vsequencer)
      //          seq_item.abc = 456;
      //          `uvmx_send(seq_item)
   endtask

endclass : uvme_tcounter_b_fix_ill_stim_vseq_c


`endif // __UVME_TCOUNTER_B_FIX_ILL_STIM_VSEQ_SV__