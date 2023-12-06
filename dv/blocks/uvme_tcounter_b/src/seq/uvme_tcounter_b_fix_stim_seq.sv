// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_TCOUNTER_B_FIX_STIM_SEQ_SV__
`define __UVME_TCOUNTER_B_FIX_STIM_SEQ_SV__


/**
 * Sequence for test 'fix_stim'.
 * @ingroup uvme_tcounter_b_seq_functional
 */
class uvme_tcounter_b_fix_stim_seq_c extends uvme_tcounter_b_base_seq_c;

   `uvm_object_utils(uvme_tcounter_b_fix_stim_seq_c)

   /**
    * Default constructor.
    */
   function new(string name="uvme_tcounter_b_fix_stim_seq");
      super.new(name);
   endfunction

   /**
    * TODO Describe uvme_tcounter_b_fix_stim_seq_c::body()
    */
   virtual task body();
      uvma_tcounter_b_seq_item_c  seq_item;
      // TODO Implement uvme_tcounter_b_fix_stim_seq_c::body()
      //      Ex: `uvmx_create_on(seq_item, agent_sequencer)
      //          seq_item.abc = 123;
      //          `uvmx_send(seq_item)
      //          `uvmx_create_on(seq_item, agent_sequencer)
      //          seq_item.abc = 456;
      //          `uvmx_send(seq_item)
   endtask

endclass


`endif // __UVME_TCOUNTER_B_FIX_STIM_SEQ_SV__