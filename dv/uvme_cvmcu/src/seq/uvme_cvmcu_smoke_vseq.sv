// Copyright 2022 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_SMOKE_VSEQ_SV__
`define __UVME_CVMCU_SMOKE_VSEQ_SV__


/**
 * Virtual sequence checking basic access to the DUT.
 */
class uvme_cvmcu_smoke_vseq_c extends uvme_cvmcu_base_vseq_c;

   `uvm_object_utils_begin(uvme_cvmcu_smoke_vseq_c)
   `uvm_object_utils_end

   /**
    * Default constructor.
    */
   extern function new(string name="uvme_cvmcu_smoke_vseq_c");

   /**
    * TODO Describe uvme_cvmcu_smoke_vseq_c::body()
    */
   extern virtual task body();

endclass : uvme_cvmcu_smoke_vseq_c


function uvme_cvmcu_smoke_vseq_c::new(string name="uvme_cvmcu_smoke_vseq_c");

   super.new(name);

endfunction : new


task uvme_cvmcu_smoke_vseq_c::body();

   uvma_obi_seq_item_c  req;
   // Write
   `uvm_do_on_with(req, p_sequencer.obi_data_sequencer, {
      access_type == UVMA_OBI_ACCESS_WRITE;
      address     == 32'h1A10_B000;
      data        == 32'h9876_ABCD;
   })
   // Read
   `uvm_do_on_with(req, p_sequencer.obi_data_sequencer, {
      access_type == UVMA_OBI_ACCESS_READ;
      address     == 32'h1A10_B000;
   })
   `uvm_info("SMOKE_VSEQ", $sformatf("Data read back from location 'x%h is x%h", req.address, req.data), UVM_LOW)

endtask : body


`endif // __UVME_CVMCU_SMOKE_VSEQ_SV__
