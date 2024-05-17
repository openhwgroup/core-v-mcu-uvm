// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// This file contains sample code that demonstrates how to add a new sequence to the Timer unit counter Block UVM Environment.


`ifndef __UVME_TCOUNTER_B_EXAMPLE_SEQ_SV__
`define __UVME_TCOUNTER_B_EXAMPLE_SEQ_SV__


/**
 * Example Sequence that generates 10 fully random items by default.
 */
class uvme_tcounter_b_example_seq_c extends uvme_tcounter_b_base_seq_c;

   /// @name Knobs
   /// @{
   rand int unsigned  num_items; ///< Number of items to be generated.
   /// @}


   `uvm_object_utils_begin(uvme_tcounter_b_example_seq_c)
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
   function new(string name="uvme_tcounter_b_example_seq");
      super.new(name);
   endfunction

   /**
    * Generates num_items of fully random items.
    */
   virtual task body();
      for (int unsigned ii=0; ii<num_items; ii++) begin
         `uvm_info("TCOUNTER_B_EXAMPLE_SEQ", $sformatf("Starting item %0d/%0d", (ii+1), num_items), UVM_LOW)
         `uvm_do_on_with(req, psequencer.agent_sequencer, {
            // ...
         })
         `uvm_info("TCOUNTER_B_EXAMPLE_SEQ", $sformatf("Finished item %0d/%0d", (ii+1), num_items), UVM_MEDIUM)
      end
   endtask

endclass


`endif // __UVME_TCOUNTER_B_EXAMPLE_SEQ_SV__