// Copyright 2022 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_APB_ADV_TIMER_SMOKE_VSEQ_SV__
`define __UVME_APB_ADV_TIMER_SMOKE_VSEQ_SV__


/**
 * Virtual Sequence that checks basic register access to DUT.
 */
class uvme_apb_adv_timer_smoke_vseq_c extends uvme_apb_adv_timer_base_vseq_c;

   `uvm_object_utils_begin(uvme_apb_adv_timer_smoke_vseq_c)
   `uvm_object_utils_end

   /**
    * Default constructor.
    */
   function new(string name="uvme_apb_adv_timer_smoke_vseq");
      super.new(name);
   endfunction

   /**
    * Reads/writes registers.
    */
   virtual task body();
      uvma_apb_seq_item_c  req;
      // Write
      `uvm_do_on_with(req, p_sequencer.apb_vsequencer, {
         access_type == UVMA_APB_ACCESS_WRITE;
         address     == 32'h1A10_5004;
         data        == 32'h9876_ABCD;
      })
      // Read
      `uvm_do_on_with(req, p_sequencer.apb_vsequencer, {
         access_type == UVMA_APB_ACCESS_READ;
         address     == 32'h1A10_5004;
      })
      `uvm_info("SMOKE_VSEQ", $sformatf("Data read back from location 'x%h is x%h", req.address, req.data), UVM_LOW)
   endtask

endclass : uvme_apb_adv_timer_smoke_vseq_c


`endif // __UVME_APB_ADV_TIMER_SMOKE_VSEQ_SV__
