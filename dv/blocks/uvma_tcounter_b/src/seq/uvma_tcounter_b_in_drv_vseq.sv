// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_TCOUNTER_B_IN_DRV_VSEQ_SV__
`define __UVMA_TCOUNTER_B_IN_DRV_VSEQ_SV__


/**
 * Virtual Sequence taking in uvma_tcounter_b_seq_item_c instances and driving uvma_tcounter_b_drv_c with Control Plane and
 * Data Plane Input Sequence Items.
 * @ingroup uvma_tcounter_b_seq
 */
class uvma_tcounter_b_in_drv_vseq_c extends uvma_tcounter_b_base_vseq_c;

   `uvm_object_utils(uvma_tcounter_b_in_drv_vseq_c)
   `uvmx_in_drv_vseq()

   /**
    * Default constructor.
    */
   function new(string name="uvma_tcounter_b_in_drv_vseq");
      super.new(name);
   endfunction

   /**
    * Trims data outside the configured widths.
    */
   virtual function void process(ref uvma_tcounter_b_seq_item_c seq_item);
      // TODO Implement uvma_tcounter_b_in_drv_vseq_c::process() (or remove if not needed)
      //      Ex: `uvmx_trim(seq_item.abc, cfg.data_width)
   endfunction

   /**
    * TODO Describe uvma_tcounter_b_in_drv_vseq_c::drive_item()
    *      Note: For asynchronous protocols (async==1), the response must be sent via `virtual task respond(seq_item)`.
    *            Use `uvma_tcounter_b_cntxt_c` to store shared data.
    */
   task drive_item(bit async=0, ref uvma_tcounter_b_seq_item_c seq_item);
      uvma_tcounter_b_cp_seq_item_c   cp_seq_item ;
      uvma_tcounter_b_dpi_seq_item_c  dpi_seq_item;
      // TODO Implement uvma_tcounter_b_in_drv_vseq_c::drive()
      //      Ex: fork
      //             begin
      //                `uvmx_create_on(cp_seq_item, p_sequencer.cp_sequencer)
      //                cp_seq_item.from(seq_item);
      //                cp_seq_item.def = seq_item.abc;
      //                `uvmx_send_drv(cp_seq_item)
      //             end
      //             begin
      //                `uvmx_create_on(dpi_seq_item, p_sequencer.dpi_sequencer)
      //                dpi_seq_item.from(seq_item);
      //                dpi_seq_item.xyz = seq_item.qrs;
      //                `uvmx_send_drv(dpi_seq_item)
      //             end
      //          join
   endtask

endclass : uvma_tcounter_b_in_drv_vseq_c


`endif // __UVMA_TCOUNTER_B_IN_DRV_VSEQ_SV__