// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME__ST_FIX_ILL_STIM_VSEQ_SV__
`define __UVME__ST_FIX_ILL_STIM_VSEQ_SV__


/**
 * Virtual Sequence that always generates the same (i.e. reference) partially illegal stimulus.
 * @ingroup uvme_cvmcu_cpi_st_seq
 */
class uvme_cvmcu_cpi_st_fix_ill_stim_vseq_c extends uvme_cvmcu_cpi_st_base_vseq_c;

   /// @name Sequences
   /// @{
   rand uvma_cvmcu_cpi_fix_ill_stim_vseq_c  tx_vseq; ///< Sequence for TX Agent.
   /// @}


   `uvm_object_utils_begin(uvme_cvmcu_cpi_st_fix_ill_stim_vseq_c)
      `uvm_field_object(tx_vseq, UVM_DEFAULT)
   `uvm_object_utils_end

   /**
    * Default constructor.
    */
   function new(string name="uvme_cvmcu_cpi_st_fix_ill_stim_vseq");
      super.new(name);
   endfunction

   /**
    * Creates sub-sequences.
    */
   virtual function void create_objects();
      tx_vseq = uvma_cvmcu_cpi_fix_ill_stim_vseq_c::type_id::create("tx_vseq");
   endfunction

   /**
    * TODO Describe uvme_cvmcu_cpi_st_fix_ill_stim_vseq_c::body()
    */
   virtual task body();
      `uvm_info("CVMCU_CPI_ST_FIX_ILL_STIM_VSEQ", "Starting sequence", UVM_MEDIUM)
      tx_vseq.start(p_sequencer.tx_vsequencer);
   endtask

endclass : uvme_cvmcu_cpi_st_fix_ill_stim_vseq_c


`endif // __UVME__ST_FIX_ILL_STIM_VSEQ_SV__