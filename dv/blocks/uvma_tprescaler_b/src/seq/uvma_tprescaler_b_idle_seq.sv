// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_TPRESCALER_B_IDLE_SEQ_SV__
`define __UVMA_TPRESCALER_B_IDLE_SEQ_SV__


/**
 * Sequence generating 'idle' Sequence Items at all times.
 * @ingroup uvma_tprescaler_b_seq
 */
class uvma_tprescaler_b_idle_seq_c extends uvma_tprescaler_b_base_seq_c;

   `uvm_object_utils(uvma_tprescaler_b_idle_seq_c)
   `uvmx_idle_seq()


   /**
    * Default constructor.
    */
   function new(string name="uvma_tprescaler_b_idle_seq");
      super.new(name);
   endfunction

   /**
    * Infinite loops generating idle sequence items.
    */
   task idle();
      uvma_tprescaler_b_cp_seq_item_c   cp_seq_item ;
      uvma_tprescaler_b_dpi_seq_item_c  dpi_seq_item;
      uvma_tprescaler_b_dpo_seq_item_c  dpo_seq_item;
      fork
         forever begin
            `uvmx_rand_idle(cp_seq_item, cp_sequencer)
         end
         forever begin
            `uvmx_create_on(dpi_seq_item, dpi_sequencer)
            `uvmx_send_idle(dpi_seq_item)
         end
         forever begin
            `uvmx_create_on(dpo_seq_item, dpo_sequencer)
            `uvmx_send_idle(dpo_seq_item)
         end
      join
   endtask

endclass


`endif // __UVMA_TPRESCALER_B_IDLE_SEQ_SV__