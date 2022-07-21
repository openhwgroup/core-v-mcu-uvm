// Copyright 2022 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// This file contains sample code that demonstrates how to add a new sequence to the APB Timer Sub-System environment.


`ifndef __UVME_APB_TIMER_SMOKE_VSEQ_SV__
`define __UVME_APB_TIMER_SMOKE_VSEQ_SV__


/**
 * Virtual Sequence that checks basic register access to DUT.
 */
class uvme_apb_timer_smoke_vseq_c extends uvme_apb_timer_base_vseq_c;

   `uvm_object_utils_begin(uvme_apb_timer_smoke_vseq_c)
   `uvm_object_utils_end

   /**
    * Default constructor.
    */
   extern function new(string name="uvme_apb_timer_smoke_vseq");

   /**
    * Reads/writes registers.
    */
   extern virtual task body();

endclass : uvme_apb_timer_smoke_vseq_c


function uvme_apb_timer_smoke_vseq_c::new(string name="uvme_apb_timer_smoke_vseq");

   super.new(name);

endfunction : new


task uvme_apb_timer_smoke_vseq_c::body();

   uvma_apb_mstr_seq_item_c  req;
   // Write
   `uvm_do_on_with(req, p_sequencer.apb_sequencer, {
      access_type == UVMA_APB_ACCESS_WRITE;
      address     == 32'h1A10_B000;
      wdata       == 32'h9876_ABCD;
   })
   // Read
   `uvm_do_on_with(req, p_sequencer.apb_sequencer, {
      access_type == UVMA_APB_ACCESS_READ;
      address     == 32'h1A10_B000;
   })
   `uvm_info("SMOKE_VSEQ", $sformatf("Data read back from location 'x%h is x%h", req.address, req.rdata), UVM_LOW)

endtask : body


`endif // __UVME_APB_TIMER_SMOKE_VSEQ_SV__
