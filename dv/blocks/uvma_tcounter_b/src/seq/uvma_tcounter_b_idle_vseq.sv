// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_TCOUNTER_B_IDLE_VSEQ_SV__
`define __UVMA_TCOUNTER_B_IDLE_VSEQ_SV__


/**
 * Virtual Sequence generating 'idle' Sequence Items at all times.
 * @ingroup uvma_tcounter_b_seq
 */
class uvma_tcounter_b_idle_vseq_c extends uvma_tcounter_b_base_vseq_c;

   `uvm_object_utils(uvma_tcounter_b_idle_vseq_c)
   `uvmx_idle_vseq()


   /**
    * Default constructor.
    */
   function new(string name="uvma_tcounter_b_idle_vseq");
      super.new(name);
   endfunction

   /**
    * Infinite loops generating idle sequence items.
    */
   task idle();
      uvma_tcounter_b_cp_seq_item_c   cp_seq_item ;
      uvma_tcounter_b_dpi_seq_item_c  dpi_seq_item;
      uvma_tcounter_b_dpo_seq_item_c  dpo_seq_item;
      fork
         forever begin
            `uvmx_rand_idle(cp_seq_item, p_sequencer.cp_sequencer)
         end
         forever begin
            `uvmx_create_on(dpi_seq_item, p_sequencer.dpi_sequencer)
            `uvmx_send_idle(dpi_seq_item)
         end
         forever begin
            `uvmx_create_on(dpo_seq_item, p_sequencer.dpo_sequencer)
            `uvmx_send_idle(dpo_seq_item)
         end
      join
   endtask

endclass : uvma_tcounter_b_idle_vseq_c


`endif // __UVMA_TCOUNTER_B_IDLE_VSEQ_SV__