// Copyright 2022 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_INTR_ST_RAND_STIM_VSEQ_SV__
`define __UVME_CVMCU_INTR_ST_RAND_STIM_VSEQ_SV__


/**
 * Sends a fixed number of completely random sequence items to the active sequencer.
 */
class uvme_cvmcu_intr_st_rand_stim_vseq_c extends uvme_cvmcu_intr_st_base_vseq_c;

   /// @defgroup Knobs
   /// @{
   rand int unsigned  num_items; ///< Number of sequence items to generate.
   /// @}


   `uvm_object_utils_begin(uvme_cvmcu_intr_st_rand_stim_vseq_c)
      `uvm_field_int(num_items, UVM_DEFAULT + UVM_DEC)
   `uvm_object_utils_end


   /**
    * Sets safe defaults for knobs.
    */
   constraint defaults_cons {
      soft num_items == 100;
   }


   /**
    * Default constructor.
    */
   extern function new(string name="uvme_cvmcu_intr_st_rand_stim_vseq");

   /**
    * Creates and sends #num_items of completely random uvma_cvmcu_intr_seq_item_c instances to the active sequencer.
    */
   extern virtual task body();

endclass : uvme_cvmcu_intr_st_rand_stim_vseq_c


function uvme_cvmcu_intr_st_rand_stim_vseq_c::new(string name="uvme_cvmcu_intr_st_rand_stim_vseq");

   super.new(name);

endfunction : new


task uvme_cvmcu_intr_st_rand_stim_vseq_c::body();

   uvma_cvmcu_intr_seq_item_c  seq_item;
   for (int unsigned ii=0; ii<num_items; ii++) begin
      `uvm_info("CVMCU_INTR_ST_VSEQ", $sformatf("Generating item %0d of %0d", (ii+1), num_items), UVM_HIGH)
      `uvm_do_on(seq_item, p_sequencer.active_sequencer)
   end

endtask : body


`endif // __UVME_CVMCU_INTR_ST_RAND_STIM_VSEQ_SV__
