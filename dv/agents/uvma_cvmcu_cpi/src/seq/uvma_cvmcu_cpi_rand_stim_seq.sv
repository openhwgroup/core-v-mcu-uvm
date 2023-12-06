// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_CPI_RAND_STIM_SEQ_SV__
`define __UVMA_CVMCU_CPI_RAND_STIM_SEQ_SV__


/**
 * Generates legal random stimulus with knobs for min/max size and gap control.
 * @ingroup uvma_cvmcu_cpi_seq
 */
class uvma_cvmcu_cpi_rand_stim_seq_c extends uvma_cvmcu_cpi_base_seq_c;

   /// @name Knobs
   /// @{
   rand int unsigned  num_items; ///< Number of items to generate.
   rand int unsigned  min_size ; ///< Minimum item size (bytes).
   rand int unsigned  max_size ; ///< Maximum item size (bytes).
   rand int unsigned  min_gap  ; ///< Minimum number of cycles between items.
   rand int unsigned  max_gap  ; ///< Maximum number of cycles between items.
   /// @}


   `uvm_object_utils_begin(uvma_cvmcu_cpi_rand_stim_seq_c)
      `uvm_field_int(num_items, UVM_DEFAULT + UVM_DEC)
      `uvm_field_int(min_size , UVM_DEFAULT + UVM_DEC)
      `uvm_field_int(max_size , UVM_DEFAULT + UVM_DEC)
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
   function new(string name="uvma_cvmcu_cpi_rand_stim_seq");
      super.new(name);
   endfunction

   /**
    * Generates #num_items of random stimulus.
    */
   virtual task body();
      uvma_cvmcu_cpi_seq_item_c  seq_item;
      int unsigned  gap_size;
      for (int unsigned ii=0; ii<num_items; ii++) begin
         gap_size = $urandom_range(min_gap, max_gap);
         `uvm_info("CVMCU_CPI_RAND_STIM_SEQ", $sformatf("Waiting %0d gap cycle(s) before item %0d/%0d", gap_size, (ii+1), num_items), UVM_HIGH)
         clk(gap_size);
         `uvm_info("CVMCU_CPI_RAND_STIM_SEQ", $sformatf("Starting item #%0d of %0d with gap size %0d", (ii+1), num_items, gap_size), UVM_MEDIUM)
         `uvmx_do_with(seq_item, {
            // TODO Implement uvma_cvmcu_cpi_rand_stim_seq_c sequence item generation
            //      Ex: abc == 123;
         })
         `uvm_info("CVMCU_CPI_RAND_STIM_SEQ", $sformatf("Finished item #%0d of %0d with gap size %0d", (ii+1), num_items, gap_size), UVM_HIGH)
      end
   endtask

endclass


`endif // __UVMA_CVMCU_CPI_RAND_STIM_SEQ_SV__