// Copyright 2022-2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_SMOKE_VSEQ_SV__
`define __UVME_CVMCU_SMOKE_VSEQ_SV__


/**
 * Virtual Sequence that checks basic register access to DUT.
 */
class uvme_cvmcu_smoke_vseq_c extends uvme_cvmcu_base_vseq_c;

   `uvm_object_utils_begin(uvme_cvmcu_smoke_vseq_c)
   `uvm_object_utils_end

   /**
    * Default constructor.
    */
   function new(string name="uvme_cvmcu_smoke_vseq");
      super.new(name);
   endfunction

   /**
    * Reads/writes registers.
    */
   virtual task body();
      uvma_obi_seq_item_c  req;
      // Write
      `uvm_do_on_with(req, p_sequencer.obi_data_vsequencer, {
         access_type == UVMA_OBI_ACCESS_WRITE;
         address     == 32'h1A10_B000;
         data        == 32'h9876_ABCD;
      })
      // Read
      `uvm_do_on_with(req, p_sequencer.obi_data_vsequencer, {
         access_type == UVMA_OBI_ACCESS_READ;
         address     == 32'h1A10_B000;
      })
      `uvm_info("SMOKE_VSEQ", $sformatf("Data read back from location 'x%h is x%h", req.address, req.data), UVM_LOW)
   endtask

endclass : uvme_cvmcu_smoke_vseq_c


`endif // __UVME_CVMCU_SMOKE_VSEQ_SV__
