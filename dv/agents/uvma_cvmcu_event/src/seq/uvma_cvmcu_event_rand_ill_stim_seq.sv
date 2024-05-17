// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_EVENT_RAND_ILL_STIM_SEQ_SV__
`define __UVMA_CVMCU_EVENT_RAND_ILL_STIM_SEQ_SV__


/**
 * Generates a random mix of legal and illegal stimulus with knobs for min/max size and gap control.
 * @ingroup uvma_cvmcu_event_seq
 */
class uvma_cvmcu_event_rand_ill_stim_seq_c extends uvma_cvmcu_event_base_seq_c;

   /// @name Knobs
   /// @{
   rand int unsigned  num_items ; ///< Number of legal items to generate.
   rand int unsigned  num_errors; ///< Number of illegal items to generate.
   rand int unsigned  min_gap   ; ///< Minimum number of cycles between items.
   rand int unsigned  max_gap   ; ///< Maximum number of cycles between items.
   /// @}

   /// @name Data
   /// @{
   bit           error_idx_q[$]; ///< Illegal item indices.
   int unsigned  error_count   ; ///< Tally for illegal items generated.
   /// @}


   `uvm_object_utils_begin(uvma_cvmcu_event_rand_ill_stim_seq_c)
      `uvm_field_int(num_items , UVM_DEFAULT + UVM_DEC)
      `uvm_field_int(num_errors, UVM_DEFAULT + UVM_DEC)
      `uvm_field_int(min_gap   , UVM_DEFAULT + UVM_DEC)
      `uvm_field_int(max_gap   , UVM_DEFAULT + UVM_DEC)
      `uvm_field_queue_int(error_idx_q, UVM_DEFAULT)
      `uvm_field_int(error_count, UVM_DEFAULT + UVM_DEC)
   `uvm_object_utils_end


   /**
    * Describes randomization space for knobs.
    */
   constraint space_cons {
      num_items  inside {['d1:'d1_000]};
      max_gap    inside {['d0:'d100  ]};
      num_errors inside {['d1:num_items]};
      min_gap    inside {['d0:max_gap  ]};
   }


   /**
    * Default constructor.
    */
   function new(string name="uvma_cvmcu_event_rand_ill_stim_seq");
      super.new(name);
   endfunction

   /**
    * Fills #error_idx_q with positions of illegal sequence items.
    */
   virtual function void post_randomize_work();
      `uvmx_rand_bit_q(error_idx_q, num_items, num_errors)
   endfunction

   /**
    * Generates #num_items of random stimulus, #num_errors of which are illegal, using #error_idx_q for sequencing.
    */
   virtual task body();
      uvma_cvmcu_event_seq_item_c  seq_item;
      int unsigned  gap_size;
      for (int unsigned ii=0; ii<num_items; ii++) begin
         gap_size = $urandom_range(min_gap, max_gap);
         if (error_idx_q[ii]) begin
            `uvm_info("CVMCU_EVENT_RAND_ILL_STIM_SEQ", $sformatf("Waiting %0d gap cycle(s) before ILLEGAL item #%0d/%0d (#%0d/%0d total items)", gap_size, (error_count+1), num_errors, (ii+1), num_items), UVM_NONE)
            clk(gap_size);
            `uvm_info("CVMCU_EVENT_RAND_ILL_STIM_SEQ", $sformatf("Starting ILLEGAL item #%0d/%0d (#%0d/%0d total items) with gap size %0d", (error_count+1), num_errors, (ii+1), num_items, gap_size), UVM_NONE)
            `uvmx_do_with(seq_item, {
               // TODO Implement uvma_cvmcu_event_rand_ill_stim_seq_c illegal sequence item generation
               //      Ex: abc == 123;
            })
            error_count++;
            `uvm_info("CVMCU_EVENT_RAND_ILL_STIM_SEQ", $sformatf("Finished ILLEGAL item #%0d/%0d (#%0d/%0d total items) with gap size %0d", error_count, num_errors, (ii+1), num_items, gap_size), UVM_NONE)
         end
         else begin
            `uvm_info("CVMCU_EVENT_RAND_ILL_STIM_SEQ", $sformatf("Waiting %0d gap cycle(s) before item #%0d/%0d", gap_size, (ii+1), num_items), UVM_HIGH)
            clk(gap_size);
            `uvm_info("CVMCU_EVENT_RAND_ILL_STIM_SEQ", $sformatf("Starting item #%0d/%0d with gap size %0d", (ii+1), num_items, gap_size), UVM_MEDIUM)
            `uvmx_do_with(seq_item, {
               // TODO Implement uvma_cvmcu_event_rand_ill_stim_seq_c legal sequence item generation
               //      Ex: abc == 123;
            })
            `uvm_info("CVMCU_EVENT_RAND_ILL_STIM_SEQ", $sformatf("Finished item #%0d/%0d with gap size %0d", (ii+1), num_items, gap_size), UVM_HIGH)
         end
      end
   endtask

endclass


`endif // __UVMA_CVMCU_EVENT_RAND_ILL_STIM_SEQ_SV__