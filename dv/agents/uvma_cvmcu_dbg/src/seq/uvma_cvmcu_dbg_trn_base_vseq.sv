// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_DBG_TRN_BASE_VSEQ_SV__
`define __UVMA_CVMCU_DBG_TRN_BASE_VSEQ_SV__


/**
 * Abstract Virtual Sequence from which all CORE-V-MCU Debug Interface Agent Transport Sequences extend.
 * @ingroup uvma_cvmcu_dbg_seq
 */
class uvma_cvmcu_dbg_trn_base_vseq_c extends uvma_cvmcu_dbg_base_vseq_c;

   `uvm_object_utils(uvma_cvmcu_dbg_trn_base_vseq_c)
   `uvmx_trn_vseq()

   /**
    * Default constructor.
    */
   function new(string name="uvma_cvmcu_dbg_trn_base_vseq");
      super.new(name);
   endfunction

   /**
    * If `async` is set to `1`, the response must be sent via `respond(item)`.
    */
   task drive_item(bit async=0, ref uvm_sequence_item seq_item);
      // To be implemented by sub-classes
   endtask

endclass : uvma_cvmcu_dbg_trn_base_vseq_c


`endif // __UVMA_CVMCU_DBG_TRN_BASE_VSEQ_SV__