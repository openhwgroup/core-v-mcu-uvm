// Copyright 2023 Acme Enterprises
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_DBG_FIX_STIM_VSEQ_SV__
`define __UVMA_CVMCU_DBG_FIX_STIM_VSEQ_SV__


/**
 * Virtual Sequence that always generates the same (i.e. reference) stimulus.
 * @ingroup uvma_cvmcu_dbg_seq
 */
class uvma_cvmcu_dbg_fix_stim_vseq_c extends uvma_cvmcu_dbg_base_vseq_c;

   `uvm_object_utils(uvma_cvmcu_dbg_fix_stim_vseq_c)

   /**
    * Default constructor.
    */
   function new(string name="uvma_cvmcu_dbg_fix_stim_vseq");
      super.new(name);
   endfunction

   /**
    * TODO Describe uvma_cvmcu_dbg_fix_stim_vseq_c::body()
    */
   virtual task body();
      uvma_cvmcu_dbg_seq_item_c  seq_item;
      // TODO Implement uvma_cvmcu_dbg_fix_stim_vseq_c::body()
      //      Ex: `uvmx_create_on(seq_item, p_sequencer.agent_vsequencer)
      //          seq_item.abc = 123;
      //          `uvmx_send(seq_item)
      //          `uvmx_create_on(seq_item, p_sequencer.agent_vsequencer)
      //          seq_item.abc = 456;
      //          `uvmx_send(seq_item)
   endtask

endclass : uvma_cvmcu_dbg_fix_stim_vseq_c


`endif // __UVMA_CVMCU_DBG_FIX_STIM_VSEQ_SV__