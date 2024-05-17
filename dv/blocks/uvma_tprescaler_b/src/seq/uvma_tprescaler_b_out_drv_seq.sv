// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_TPRESCALER_B_OUT_DRV_SEQ_SV__
`define __UVMA_TPRESCALER_B_OUT_DRV_SEQ_SV__


/**
 * Sequence generating Data Plane Output Sequence Items and driving uvma_tprescaler_b_dpi_drv_c.
 * @ingroup uvma_tprescaler_b_seq
 */
class uvma_tprescaler_b_out_drv_seq_c extends uvma_tprescaler_b_base_seq_c;

   `uvm_object_utils(uvma_tprescaler_b_out_drv_seq_c)
   `uvmx_out_drv_seq()


   /**
    * Default constructor.
    */
   function new(string name="uvma_tprescaler_b_out_drv_seq");
      super.new(name);
   endfunction

   /**
    * TODO Describe uvma_tprescaler_b_out_drv_seq_c::drive()
    */
   virtual task drive();
      uvma_tprescaler_b_dpo_seq_item_c  dpo_seq_item;
      forever begin
         clk(); // TODO Remove this line after implementing uvma_tprescaler_b_out_drv_seq_c::drive()
         // TODO Implement uvma_tprescaler_b_out_drv_seq_c::drive()
         //      Ex: randcase
         //             cfg.out_drv_ton_pct: begin
         //                `uvmx_create_on(dpo_seq_item, dpo_sequencer)
         //                dpo_seq_item.rdy = 1;
         //                `uvmx_send_drv(dpo_seq_item)
         //             end
         //             (100-cfg.out_drv_ton_pct): begin
         //                clk();
         //             end
         //          endcase
      end
   endtask

endclass


`endif // __UVMA_TPRESCALER_B_OUT_DRV_SEQ_SV__