// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_IO_RAND_ILL_STIM_VSEQ_SV__
`define __UVMA_CVMCU_IO_RAND_ILL_STIM_VSEQ_SV__


/**
 * Virtual Sequence generating a set number of random data 'packets' with min/max knobs for payload size and gap control.
 * @ingroup uvma_cvmcu_io_seq
 */
class uvma_cvmcu_io_rand_ill_stim_vseq_c extends uvma_cvmcu_io_base_vseq_c;

   /// @name Knobs
   /// @{
   rand int unsigned  num_items ; ///< Number of packets to generate.
   rand int unsigned  num_errors; ///< Number of errored packets to be generated.
   rand int unsigned  min_size  ; ///< Minimum packet payload size.
   rand int unsigned  max_size  ; ///< Maximum packet payload size.
   rand int unsigned  min_gap   ; ///< Minimum number of cycles between packets.
   rand int unsigned  max_gap   ; ///< Maximum number of cycles between packets.
   /// @}

   /// @name Data
   /// @{
   bit  error_idx[$]; ///< Indicates if a sequence item is to be illegal.
   /// @}


   `uvm_object_utils_begin(uvma_cvmcu_io_rand_ill_stim_vseq_c)
      `uvm_field_int(num_items , UVM_DEFAULT + UVM_DEC)
      `uvm_field_int(num_errors, UVM_DEFAULT + UVM_DEC)
      `uvm_field_int(min_size  , UVM_DEFAULT + UVM_DEC)
      `uvm_field_int(max_size  , UVM_DEFAULT + UVM_DEC)
      `uvm_field_int(min_gap   , UVM_DEFAULT + UVM_DEC)
      `uvm_field_int(max_gap   , UVM_DEFAULT + UVM_DEC)
      `uvm_field_queue_int(error_idx, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Enforces min/max and bounds #num_items to an upper limit.
    */
   constraint limits_cons {
      num_items  inside {[1:uvma_cvmcu_io_rand_ill_stim_vseq_max_num_items]};
      num_items > num_errors;
      min_size >= uvma_cvmcu_io_rand_ill_stim_vseq_min_size;
      min_size <= max_size;
      max_size <= uvma_cvmcu_io_rand_ill_stim_vseq_max_size;
      min_gap  <= max_gap;
      max_gap  <= uvma_cvmcu_io_rand_ill_stim_vseq_max_gap;
   }


   /**
    * Default constructor.
    */
   function new(string name="uvma_cvmcu_io_rand_ill_stim_vseq");
      super.new(name);
   endfunction

   /**
    * Fills error_idx.
    */
   function void post_randomize();
      super.post_randomize();
      rand_idx_q(num_items, num_errors, error_idx);
   endfunction

   /**
    * Generates #num_items sequence items on uvma_cvmcu_io_vsqr_c according to knobs values.
    */
   virtual task body();
      uvma_cvmcu_io_seq_item_c  seq_item;
      int unsigned  gap_size;
      int unsigned  err_count = 0;
      `uvm_info("CVMCU_IO_RAND_ILL_STIM_VSEQ", "Starting sequence", UVM_MEDIUM)
      for (int unsigned ii=0; ii<num_items; ii++) begin
         `uvm_info("CVMCU_IO_RAND_ILL_STIM_VSEQ", $sformatf("Starting packet %0d/%0d", (ii+1), num_items), UVM_HIGH)
         `uvmx_create_on(seq_item, p_sequencer)
         if (error_idx[ii]) begin
            `uvm_info("CVMCU_IO_RAND_ILL_STIM_VSEQ", $sformatf("Starting illegal packet %0d/%0d", (err_count+1), num_errors), UVM_LOW)
            `uvmx_rand_send_with(seq_item, {
               data_size inside {[min_size:max_size]};
               // TODO Implement uvma_cvmcu_io_rand_ill_stim_vseq_c illegal sequence item generation
            })
            `uvm_info("CVMCU_IO_RAND_ILL_STIM_VSEQ", $sformatf("Finished illegal packet %0d/%0d", (err_count+1), num_errors), UVM_LOW)
            err_count++;
         end
         else begin
            `uvmx_rand_send_with(seq_item, {
               data_size inside {[min_size:max_size]};
            })
         end
         gap_size = $urandom_range(min_gap, max_gap);
         `uvm_info("CVMCU_IO_RAND_ILL_STIM_VSEQ", $sformatf("Done driving packet %0d/%0d data - Waiting %0d gap cycle(s)", (ii+1), num_items, gap_size), UVM_DEBUG)
         for (int unsigned jj=0; jj<gap_size; jj++) begin
            `uvm_info("CVMCU_IO_RAND_ILL_STIM_VSEQ", $sformatf("Packet %0d/%0d - Waiting %0d/%0d gap cycle(s)", (ii+1), num_items, (jj+1), gap_size), UVM_DEBUG)
            clk();
            `uvm_info("CVMCU_IO_RAND_ILL_STIM_VSEQ", $sformatf("Packet %0d/%0d - Done waiting %0d/%0d gap cycle(s)", (ii+1), num_items, (jj+1), gap_size), UVM_DEBUG)
         end
         `uvm_info("CVMCU_IO_RAND_ILL_STIM_VSEQ", $sformatf("Finished packet %0d/%0d", (ii+1), num_items), UVM_HIGH)
      end
   endtask

endclass : uvma_cvmcu_io_rand_ill_stim_vseq_c


`endif // __UVMA_CVMCU_IO_RAND_ILL_STIM_VSEQ_SV__