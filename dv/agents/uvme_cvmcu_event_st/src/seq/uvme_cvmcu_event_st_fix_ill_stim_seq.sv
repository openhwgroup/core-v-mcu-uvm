// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_EVENT_ST_FIX_ILL_STIM_SEQ_SV__
`define __UVME_CVMCU_EVENT_ST_FIX_ILL_STIM_SEQ_SV__


/**
 * Sequence for test 'fix_ill_stim'.
 * @ingroup uvme_cvmcu_event_st_seq
 */
class uvme_cvmcu_event_st_fix_ill_stim_seq_c extends uvme_cvmcu_event_st_base_seq_c;

   /// @name Sequences
   /// @{
   rand uvma_cvmcu_event_fix_ill_stim_seq_c  core_seq; ///< Sequence for CORE agent.
   rand uvma_cvmcu_event_fix_ill_stim_seq_c  sys_seq; ///< Sequence for SYS agent.
   /// @}


   `uvm_object_utils_begin(uvme_cvmcu_event_st_fix_ill_stim_seq_c)
      `uvm_field_object(core_seq, UVM_DEFAULT)
      `uvm_field_object(sys_seq, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   function new(string name="uvme_cvmcu_event_st_fix_ill_stim_seq");
      super.new(name);
   endfunction

   /**
    * Creates sequences core_seq, sys_seq.
    */
   virtual function void create_sequences();
      core_seq = uvma_cvmcu_event_fix_ill_stim_seq_c::type_id::create("core_seq");
      sys_seq = uvma_cvmcu_event_fix_ill_stim_seq_c::type_id::create("sys_seq");
   endfunction

   /**
    * Runs core_seq and sys_seq simultaneously.
    */
   virtual task body();
      fork
         core_seq.start(p_sequencer.core_sequencer);
         sys_seq.start(p_sequencer.sys_sequencer);
      join
   endtask

endclass


`endif // __UVME_CVMCU_EVENT_ST_FIX_ILL_STIM_SEQ_SV__