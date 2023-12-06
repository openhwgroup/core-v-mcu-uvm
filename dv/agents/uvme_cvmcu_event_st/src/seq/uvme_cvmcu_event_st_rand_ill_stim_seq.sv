// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_EVENT_ST_RAND_ILL_STIM_SEQ_SV__
`define __UVME_CVMCU_EVENT_ST_RAND_ILL_STIM_SEQ_SV__


/**
 * Sequence for test 'rand_ill_stim'.
 * @ingroup uvme_cvmcu_event_st_seq
 */
class uvme_cvmcu_event_st_rand_ill_stim_seq_c extends uvme_cvmcu_event_st_base_seq_c;

   /// @name Knobs
   /// @{
   rand int unsigned  num_items ; ///< Number of items to generate.
   rand int unsigned  num_errors; ///< Number of errored sequence items to be generated.
   rand int unsigned  min_gap   ; ///< Minimum gap between items.
   rand int unsigned  max_gap   ; ///< Maximum gap between items.
   /// @}

   /// @name Sequences
   /// @{
   rand uvma_cvmcu_event_rand_ill_stim_seq_c  core_seq; ///< Sequence for CORE Agent.
   rand uvma_cvmcu_event_rand_ill_stim_seq_c  sys_seq; ///< Sequence for SYS Agent.
   /// @}


   `uvm_object_utils_begin(uvme_cvmcu_event_st_rand_ill_stim_seq_c)
      `uvm_field_int(num_items , UVM_DEFAULT + UVM_DEC)
      `uvm_field_int(num_errors, UVM_DEFAULT + UVM_DEC)
      `uvm_field_int(min_gap   , UVM_DEFAULT + UVM_DEC)
      `uvm_field_int(max_gap   , UVM_DEFAULT + UVM_DEC)
      `uvm_field_object(core_seq, UVM_DEFAULT)
      `uvm_field_object(sys_seq, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Describes randomization space for knobs.
    */
   constraint space_cons {
      num_items  inside {['d1:'d1_000]};
      max_gap    inside {['d1:'d100  ]};
      num_errors inside {['d1:num_errors]};
      min_gap    inside {['d1:max_gap   ]};
   }

   /**
    * Links sub-sequence knobs.
    */
   constraint sync_cons {
      core_seq.num_items  == num_items ;
      core_seq.num_errors == num_errors;
      core_seq.min_gap    == min_gap   ;
      core_seq.max_gap    == max_gap   ;
      sys_seq.num_items  == num_items ;
      sys_seq.num_errors == num_errors;
      sys_seq.min_gap    == min_gap   ;
      sys_seq.max_gap    == max_gap   ;
   }


   /**
    * Default constructor.
    */
   function new(string name="uvme_cvmcu_event_st_rand_ill_stim_seq");
      super.new(name);
   endfunction

   /**
    * Creates sequences core_seq, sys_seq.
    */
   virtual function void create_sequences();
      core_seq = uvma_cvmcu_event_rand_ill_stim_seq_c::type_id::create("core_seq");
      sys_seq = uvma_cvmcu_event_rand_ill_stim_seq_c::type_id::create("sys_seq");
   endfunction

   /**
    * Generates #num_items in both directions.
    */
   virtual task body();
      fork
         core_seq.start(p_sequencer.core_sequencer);
         sys_seq.start(p_sequencer.sys_sequencer);
      join
   endtask

endclass


`endif // __UVME_CVMCU_EVENT_ST_RAND_ILL_STIM_SEQ_SV__