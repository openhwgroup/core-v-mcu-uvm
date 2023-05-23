// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_DBG_RAND_STIM_VSEQ_SV__
`define __UVMA_CVMCU_DBG_RAND_STIM_VSEQ_SV__


/**
 * Virtual Sequence generating a set number of random data 'packets' with min/max knobs for payload size and gap control.
 * @ingroup uvma_cvmcu_dbg_seq
 */
class uvma_cvmcu_dbg_rand_stim_vseq_c extends uvma_cvmcu_dbg_base_vseq_c;

   /// @name Knobs
   /// @{
   rand int unsigned  num_items; ///< Number of packets to generate.
   rand int unsigned  min_size ; ///< Minimum packet payload size.
   rand int unsigned  max_size ; ///< Maximum packet payload size.
   rand int unsigned  min_gap  ; ///< Minimum number of cycles between packets.
   rand int unsigned  max_gap  ; ///< Maximum number of cycles between packets.
   /// @}


   `uvm_object_utils_begin(uvma_cvmcu_dbg_rand_stim_vseq_c)
      `uvm_field_int(num_items, UVM_DEFAULT + UVM_DEC)
      `uvm_field_int(min_size , UVM_DEFAULT + UVM_DEC)
      `uvm_field_int(max_size , UVM_DEFAULT + UVM_DEC)
      `uvm_field_int(min_gap  , UVM_DEFAULT + UVM_DEC)
      `uvm_field_int(max_gap  , UVM_DEFAULT + UVM_DEC)
   `uvm_object_utils_end


   /**
    * Enforces min/max and bounds #num_items to an upper limit.
    */
   constraint limits_cons {
      num_items inside {[1:uvma_cvmcu_dbg_rand_stim_vseq_max_num_items]};
      min_size >= uvma_cvmcu_dbg_rand_stim_vseq_min_size;
      min_size <= max_size;
      max_size <= uvma_cvmcu_dbg_rand_stim_vseq_max_size;
      min_gap  <= max_gap;
      max_gap  <= uvma_cvmcu_dbg_rand_stim_vseq_max_gap;
   }


   /**
    * Default constructor.
    */
   function new(string name="uvma_cvmcu_dbg_rand_stim_vseq");
      super.new(name);
   endfunction

   /**
    * Generates #num_items sequence items on uvma_cvmcu_dbg_vsqr_c according to knobs values.
    */
   virtual task body();
      uvma_cvmcu_dbg_seq_item_c  seq_item;
      int unsigned  gap_size;
      `uvm_info("CVMCU_DBG_RAND_STIM_VSEQ", "Starting sequence", UVM_MEDIUM)
      for (int unsigned ii=0; ii<num_items; ii++) begin
         `uvm_info("CVMCU_DBG_RAND_STIM_VSEQ", $sformatf("Starting packet %0d/%0d", (ii+1), num_items), UVM_HIGH)
         `uvmx_create_on(seq_item, p_sequencer)
         `uvmx_rand_send_with(seq_item, {
            data_size inside {[min_size:max_size]};
         })
         gap_size = $urandom_range(min_gap, max_gap);
         `uvm_info("CVMCU_DBG_RAND_STIM_VSEQ", $sformatf("Done driving packet %0d/%0d data - Waiting %0d gap cycle(s)", (ii+1), num_items, gap_size), UVM_DEBUG)
         for (int unsigned jj=0; jj<gap_size; jj++) begin
            `uvm_info("CVMCU_DBG_RAND_STIM_VSEQ", $sformatf("Packet %0d/%0d - Waiting %0d/%0d gap cycle(s)", (ii+1), num_items, (jj+1), gap_size), UVM_DEBUG)
            clk();
            `uvm_info("CVMCU_DBG_RAND_STIM_VSEQ", $sformatf("Packet %0d/%0d - Done waiting %0d/%0d gap cycle(s)", (ii+1), num_items, (jj+1), gap_size), UVM_DEBUG)
         end
         `uvm_info("CVMCU_DBG_RAND_STIM_VSEQ", $sformatf("Finished packet %0d/%0d", (ii+1), num_items), UVM_HIGH)
      end
   endtask

endclass : uvma_cvmcu_dbg_rand_stim_vseq_c


`endif // __UVMA_CVMCU_DBG_RAND_STIM_VSEQ_SV__