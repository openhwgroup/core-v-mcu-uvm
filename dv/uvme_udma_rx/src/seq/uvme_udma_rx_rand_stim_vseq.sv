// Copyright 2022 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_UDMA_RX_RAND_STIM_VSEQ_SV__
`define __UVME_UDMA_RX_RAND_STIM_VSEQ_SV__


/**
 * Sample sequence that runs 10 fully random items by default.
 * @ingroup uvme_udma_rx_seq
 */
class uvme_udma_rx_rand_stim_vseq_c extends uvme_udma_rx_base_vseq_c;

   /// @name Knobs
   /// @{
   rand int unsigned  num_items; ///< Number of sequence items to be generated.
   /// @}


   `uvm_object_utils_begin(uvme_udma_rx_rand_stim_vseq_c)
      `uvm_field_int(num_items, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Default values for random fields.
    */
   constraint defaults_cons {
      soft num_items == 10;
   }


   /**
    * Default constructor.
    */
   extern function new(string name="uvme_udma_rx_rand_stim_vseq");

   /**
    * Generates #num_items of fully random reqs.
    */
   extern virtual task body();

endclass : uvme_udma_rx_rand_stim_vseq_c


function uvme_udma_rx_rand_stim_vseq_c::new(string name="uvme_udma_rx_rand_stim_vseq");

   super.new(name);

endfunction : new


task uvme_udma_rx_rand_stim_vseq_c::body();

   uvma_udma_rx_cp_seq_item_c      cp_req    ;
   uvma_udma_rx_dp_in_seq_item_c   dp_in_req ;
   uvma_udma_rx_dp_out_seq_item_c  dp_out_req;
   fork
      begin
         for (int unsigned ii=0; ii<num_items; ii++) begin
            `uvm_info("UDMA_RX_VSEQ", $sformatf("Driving item #%0d of %0d", (ii+1), num_items), UVM_HIGH)
            `uvm_do_on(cp_req   , p_sequencer.cp_sequencer   )
            `uvm_do_on(dp_in_req, p_sequencer.dp_in_sequencer)
         end
      end

      forever begin
         `uvm_do_on(dp_out_req, p_sequencer.dp_out_sequencer)
      end
   join_any
   disable fork;

endtask : body


`endif // __UVME_UDMA_RX_RAND_STIM_VSEQ_SV__
