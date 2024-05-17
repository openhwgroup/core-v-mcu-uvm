// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_TPRESCALER_B_IN_DRV_SEQ_SV__
`define __UVMA_TPRESCALER_B_IN_DRV_SEQ_SV__


/**
 * Sequence taking in uvma_tprescaler_b_seq_item_c instances and driving uvma_tprescaler_b_drv_c with Control Plane and
 * Data Plane Input Sequence Items.
 * @ingroup uvma_tprescaler_b_seq
 */
class uvma_tprescaler_b_in_drv_seq_c extends uvma_tprescaler_b_base_seq_c;

   `uvm_object_utils(uvma_tprescaler_b_in_drv_seq_c)
   `uvmx_in_drv_seq()

   /**
    * Default constructor.
    */
   function new(string name="uvma_tprescaler_b_in_drv_seq");
      super.new(name);
   endfunction

   /**
    * TODO Describe uvma_tprescaler_b_in_drv_seq_c::drive_item()
    *      Note: For asynchronous protocols (async==1), the response must be sent via `virtual task respond(seq_item)`.
    *            Use `uvma_tprescaler_b_cntxt_c` to store shared data.
    */
   task drive_item(bit async=0, ref uvma_tprescaler_b_seq_item_c seq_item);
      uvma_tprescaler_b_cp_seq_item_c   cp_seq_item ;
      uvma_tprescaler_b_dpi_seq_item_c  dpi_seq_item;
      // TODO Implement uvma_tprescaler_b_in_drv_seq_c::drive()
      //      Ex: fork
      //             begin
      //                `uvmx_create_on(cp_seq_item, cp_sequencer)
      //                cp_seq_item.from(seq_item);
      //                cp_seq_item.def = seq_item.abc;
      //                `uvmx_send_drv(cp_seq_item)
      //             end
      //             begin
      //                `uvmx_create_on(dpi_seq_item, dpi_sequencer)
      //                dpi_seq_item.from(seq_item);
      //                dpi_seq_item.xyz = seq_item.qrs;
      //                `uvmx_send_drv(dpi_seq_item)
      //             end
      //          join
   endtask

endclass


`endif // __UVMA_TPRESCALER_B_IN_DRV_SEQ_SV__