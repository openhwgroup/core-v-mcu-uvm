// Copyright 2023 Acme Enterprises
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_TPRESCALER_B_OUT_DRV_VSEQ_SV__
`define __UVMA_TPRESCALER_B_OUT_DRV_VSEQ_SV__


/**
 * Virtual Sequence generating Data Plane Output Sequence Items and driving uvma_tprescaler_b_dpi_drv_c.
 * @ingroup uvma_tprescaler_b_seq
 */
class uvma_tprescaler_b_out_drv_vseq_c extends uvma_tprescaler_b_base_vseq_c;

   `uvm_object_utils(uvma_tprescaler_b_out_drv_vseq_c)
   `uvmx_out_drv_vseq()


   /**
    * Default constructor.
    */
   function new(string name="uvma_tprescaler_b_out_drv_vseq");
      super.new(name);
   endfunction

   /**
    * TODO Describe uvma_tprescaler_b_out_drv_vseq_c::drive()
    */
   virtual task drive();
      uvma_tprescaler_b_dpo_seq_item_c  dpo_seq_item;
      forever begin
         clk(); // TODO Remove this line after implementing uvma_tprescaler_b_out_drv_vseq_c::drive()
         // TODO Implement uvma_tprescaler_b_out_drv_vseq_c::drive()
         //      Ex: randcase
         //             cfg.out_drv_ton_pct: begin
         //                `uvmx_create_on(dpo_seq_item, p_sequencer.dpo_sequencer)
         //                dpo_seq_item.rdy = 1;
         //                `uvmx_send_drv(dpo_seq_item)
         //             end
         //             (100-cfg.out_drv_ton_pct): begin
         //                clk();
         //             end
         //          endcase
      end
   endtask

endclass : uvma_tprescaler_b_out_drv_vseq_c


`endif // __UVMA_TPRESCALER_B_OUT_DRV_VSEQ_SV__