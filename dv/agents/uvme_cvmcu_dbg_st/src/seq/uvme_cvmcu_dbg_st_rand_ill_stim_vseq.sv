// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_DBG_ST_RAND_ILL_STIM_VSEQ_SV__
`define __UVME_CVMCU_DBG_ST_RAND_ILL_STIM_VSEQ_SV__


/**
 * Virtual Sequence sending a set number of random Sequence Items (packets) to core Virtual Sequencer
 * with knobs for min/max packet size and gap.
 * @ingroup uvme_cvmcu_dbg_st_seq
 */
class uvme_cvmcu_dbg_st_rand_ill_stim_vseq_c extends uvme_cvmcu_dbg_st_base_vseq_c;

   /// @name Knobs
   /// @{
   rand int unsigned  num_items; ///< Number of packets to generate.
   rand int unsigned  num_errors; ///< Number of errored sequence items to be generated.
   rand int unsigned  min_size; ///< Mininum packet size.
   rand int unsigned  max_size; ///< Maximum packet size.
   rand int unsigned  min_gap ; ///< Minimum gap.
   rand int unsigned  max_gap ; ///< Maximum gap.
   /// @}

   /// @name Sequences
   /// @{
   rand uvma_cvmcu_dbg_rand_ill_stim_vseq_c  core_vseq; ///< Packet Sequence for CORE Agent.
      /// @}


   `uvm_object_utils_begin(uvme_cvmcu_dbg_st_rand_ill_stim_vseq_c)
      `uvm_field_int(num_items , UVM_DEFAULT + UVM_DEC)
      `uvm_field_int(num_errors, UVM_DEFAULT + UVM_DEC)
      `uvm_field_int(min_size  , UVM_DEFAULT + UVM_DEC)
      `uvm_field_int(max_size  , UVM_DEFAULT + UVM_DEC)
      `uvm_field_int(min_gap   , UVM_DEFAULT + UVM_DEC)
      `uvm_field_int(max_gap   , UVM_DEFAULT + UVM_DEC)
      `uvm_field_object(core_vseq, UVM_DEFAULT)
         `uvm_object_utils_end


   /**
    * Sets safe defaults.
    */
   constraint defaults_cons {
      soft num_items  == uvme_cvmcu_dbg_st_rand_ill_stim_vseq_default_num_items ;
      soft num_errors == uvme_cvmcu_dbg_st_rand_ill_stim_vseq_default_num_errors;
      soft min_size   == uvme_cvmcu_dbg_st_rand_ill_stim_vseq_default_min_size  ;
      soft max_size   == uvme_cvmcu_dbg_st_rand_ill_stim_vseq_default_max_size  ;
      soft min_gap    == uvme_cvmcu_dbg_st_rand_ill_stim_vseq_default_min_gap   ;
      soft max_gap    == uvme_cvmcu_dbg_st_rand_ill_stim_vseq_default_max_gap   ;
   }

   /**
    * Links Sequences knobs.
    */
   constraint limits_cons {
      num_items > num_errors;
      core_vseq.num_items  == num_items ;
      core_vseq.num_errors == num_errors;
      core_vseq.min_size   == min_size  ;
      core_vseq.max_size   == max_size  ;
      core_vseq.min_gap    == min_gap   ;
      core_vseq.max_gap    == max_gap   ;
   }


   /**
    * Default constructor.
    */
   function new(string name="uvme_cvmcu_dbg_st_rand_ill_stim_vseq");
      super.new(name);
   endfunction

   /**
    * Creates sub-sequences.
    */
   virtual function void create_objects();
      core_vseq = uvma_cvmcu_dbg_rand_ill_stim_vseq_c::type_id::create("core_vseq");
         endfunction

   /**
    * Generates Sequence Items according to knobs values.
    */
   virtual task body();
      `uvm_info("CVMCU_DBG_ST_RAND_ILL_STIM_VSEQ", "Starting sequence", UVM_MEDIUM)
   core_vseq.start(p_sequencer.core_vsequencer);
   endtask

endclass : uvme_cvmcu_dbg_st_rand_ill_stim_vseq_c


`endif // __UVME_CVMCU_DBG_ST_RAND_ILL_STIM_VSEQ_SV__