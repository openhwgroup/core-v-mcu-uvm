// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_TCOUNTER_B_RAND_STIM_VSEQ_SV__
`define __UVME_TCOUNTER_B_RAND_STIM_VSEQ_SV__


/**
 * Sequence that runs a fixed number of fully random Sequence Items.
 * @ingroup uvme_tcounter_b_seq
 */
class uvme_tcounter_b_rand_stim_vseq_c extends uvme_tcounter_b_base_vseq_c;

   /// @name Knobs
   /// @{
   rand int unsigned  num_items; ///< Number of Sequence Items to be generated.
   /// @}


   `uvm_object_utils_begin(uvme_tcounter_b_rand_stim_vseq_c)
      `uvm_field_int(num_items, UVM_DEFAULT + UVM_DEC)
   `uvm_object_utils_end


   /**
    * Default values for random fields.
    */
   constraint defaults_cons {
      soft num_items == uvme_tcounter_b_default_num_items_cons;
   }


   /**
    * Default constructor.
    */
   function new(string name="uvme_tcounter_b_rand_stim_vseq");
      super.new(name);
   endfunction

   /**
    * Generates #num_items of fully random Sequence Items.
    */
   virtual task body();
      uvma_tcounter_b_seq_item_c  seq_item;
      for (int unsigned ii=0; ii<num_items; ii++) begin
         `uvm_info("TCOUNTER_B_RAND_STIM_VSEQ", $sformatf("Starting driving item #%0d of %0d", (ii+1), num_items), UVM_LOW)
         `uvmx_do_on_with(seq_item, p_sequencer.agent_vsequencer, {
            // ...
         })
         `uvm_info("TCOUNTER_B_RAND_STIM_VSEQ", $sformatf("Finished driving item #%0d of %0d", (ii+1), num_items), UVM_MEDIUM)
      end
   endtask

endclass : uvme_tcounter_b_rand_stim_vseq_c


`endif // __UVME_TCOUNTER_B_RAND_STIM_VSEQ_SV__