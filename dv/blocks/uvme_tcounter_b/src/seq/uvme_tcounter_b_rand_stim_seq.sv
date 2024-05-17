// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_TCOUNTER_B_RAND_STIM_SEQ_SV__
`define __UVME_TCOUNTER_B_RAND_STIM_SEQ_SV__


/**
 * Sequence for test 'rand_stim'.
 * @ingroup uvme_tcounter_b_seq_functional
 */
class uvme_tcounter_b_rand_stim_seq_c extends uvme_tcounter_b_base_seq_c;

   /// @name Knobs
   /// @{
   rand int unsigned  num_items; ///< Number of sequence items to be generated.
   rand int unsigned  min_gap  ; ///< Minimum number of cycles between items.
   rand int unsigned  max_gap  ; ///< Maximum number of cycles between items.
   /// @}


   `uvm_object_utils_begin(uvme_tcounter_b_rand_stim_seq_c)
      `uvm_field_int(num_items, UVM_DEFAULT + UVM_DEC)
      `uvm_field_int(min_gap  , UVM_DEFAULT + UVM_DEC)
      `uvm_field_int(max_gap  , UVM_DEFAULT + UVM_DEC)
   `uvm_object_utils_end


   /**
    * Describes randomization space for knobs.
    */
   constraint space_cons {
      num_items inside {['d1:'d1_000]};
      max_gap   inside {['d0:'d100  ]};
      min_gap   inside {['d0:max_gap]};
   }


   /**
    * Default constructor.
    */
   function new(string name="uvme_tcounter_b_rand_stim_seq");
      super.new(name);
   endfunction

   /**
    * Generates #num_items of random stimulus.
    */
   virtual task body();
      uvma_tcounter_b_seq_item_c  seq_item;
      int unsigned  gap_size;
      for (int unsigned ii=0; ii<num_items; ii++) begin
         gap_size = $urandom_range(min_gap, max_gap);
         `uvm_info("TCOUNTER_B_RAND_STIM_SEQ", $sformatf("Waiting %0d gap cycle(s) before item %0d/%0d", gap_size, (ii+1), num_items), UVM_HIGH)
         clk(gap_size);
         `uvm_info("TCOUNTER_B_RAND_STIM_SEQ", $sformatf("Starting item #%0d of %0d with gap size %0d", (ii+1), num_items, gap_size), UVM_MEDIUM)
         `uvmx_do_on(seq_item, agent_sequencer)
         `uvm_info("TCOUNTER_B_RAND_STIM_SEQ", $sformatf("Finished item #%0d of %0d with gap size %0d", (ii+1), num_items, gap_size), UVM_HIGH)
      end
   endtask

endclass


`endif // __UVME_TCOUNTER_B_RAND_STIM_SEQ_SV__