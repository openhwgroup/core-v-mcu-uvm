// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_DBG_FIX_ILL_STIM_SEQ_SV__
`define __UVMA_CVMCU_DBG_FIX_ILL_STIM_SEQ_SV__


/**
 * Generates a mix of legal and illegal fixed (reference) stimulus.
 * @ingroup uvma_cvmcu_dbg_seq
 */
class uvma_cvmcu_dbg_fix_ill_stim_seq_c extends uvma_cvmcu_dbg_base_seq_c;

   `uvm_object_utils(uvma_cvmcu_dbg_fix_ill_stim_seq_c)

   /**
    * Default constructor.
    */
   function new(string name="uvma_cvmcu_dbg_fix_ill_stim_seq");
      super.new(name);
   endfunction

   /**
    * TODO Describe uvma_cvmcu_dbg_fix_ill_stim_seq_c::body()
    */
   virtual task body();
      uvma_cvmcu_dbg_seq_item_c  seq_item;
      // TODO Implement uvma_cvmcu_dbg_fix_ill_stim_seq_c::body()
      //      Ex: `uvmx_create(seq_item)
      //          seq_item.abc = 123;
      //          `uvmx_send(seq_item)
      //          `uvmx_create(seq_item)
      //          seq_item.abc = 456;
      //          `uvmx_send(seq_item)
   endtask

endclass


`endif // __UVMA_CVMCU_DBG_FIX_ILL_STIM_SEQ_SV__