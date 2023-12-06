// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_IO_ST_FIX_ILL_STIM_SEQ_SV__
`define __UVME_CVMCU_IO_ST_FIX_ILL_STIM_SEQ_SV__


/**
 * Sequence for test 'fix_ill_stim'.
 * @ingroup uvme_cvmcu_io_st_seq
 */
class uvme_cvmcu_io_st_fix_ill_stim_seq_c extends uvme_cvmcu_io_st_base_seq_c;

   /// @name Sequences
   /// @{
   rand uvma_cvmcu_io_fix_ill_stim_seq_c  board_seq; ///< Sequence for BOARD agent.
   rand uvma_cvmcu_io_fix_ill_stim_seq_c  chip_seq; ///< Sequence for CHIP agent.
   /// @}


   `uvm_object_utils_begin(uvme_cvmcu_io_st_fix_ill_stim_seq_c)
      `uvm_field_object(board_seq, UVM_DEFAULT)
      `uvm_field_object(chip_seq, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   function new(string name="uvme_cvmcu_io_st_fix_ill_stim_seq");
      super.new(name);
   endfunction

   /**
    * Creates sequences board_seq, chip_seq.
    */
   virtual function void create_sequences();
      board_seq = uvma_cvmcu_io_fix_ill_stim_seq_c::type_id::create("board_seq");
      chip_seq = uvma_cvmcu_io_fix_ill_stim_seq_c::type_id::create("chip_seq");
   endfunction

   /**
    * Runs board_seq and chip_seq simultaneously.
    */
   virtual task body();
      fork
         board_seq.start(p_sequencer.board_sequencer);
         chip_seq.start(p_sequencer.chip_sequencer);
      join
   endtask

endclass


`endif // __UVME_CVMCU_IO_ST_FIX_ILL_STIM_SEQ_SV__