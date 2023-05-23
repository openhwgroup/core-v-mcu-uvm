// Copyright 2023 Acme Enterprises
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_IO_ST_RAND_STIM_VSEQ_SV__
`define __UVME_CVMCU_IO_ST_RAND_STIM_VSEQ_SV__


/**
 * Virtual Sequence sending a set number of random Sequence Items (packets) to board and chip Virtual Sequencers
 * with knobs for min/max packet size and gap.
 * @ingroup uvme_cvmcu_io_st_seq
 */
class uvme_cvmcu_io_st_rand_stim_vseq_c extends uvme_cvmcu_io_st_base_vseq_c;

   /// @name Knobs
   /// @{
   rand int unsigned  num_items; ///< Number of packets to generate.
   rand int unsigned  min_size; ///< Mininum packet size.
   rand int unsigned  max_size; ///< Maximum packet size.
   rand int unsigned  min_gap ; ///< Minimum gap.
   rand int unsigned  max_gap ; ///< Maximum gap.
   /// @}

   /// @name Sequences
   /// @{
   rand uvma_cvmcu_io_rand_stim_vseq_c  board_vseq; ///< Packet Sequence for BOARD Agent.
   rand uvma_cvmcu_io_rand_stim_vseq_c  chip_vseq; ///< Packet Sequence for CHIP Agent.
   /// @}


   `uvm_object_utils_begin(uvme_cvmcu_io_st_rand_stim_vseq_c)
      `uvm_field_int(num_items, UVM_DEFAULT + UVM_DEC)
      `uvm_field_int(min_size , UVM_DEFAULT + UVM_DEC)
      `uvm_field_int(max_size , UVM_DEFAULT + UVM_DEC)
      `uvm_field_int(min_gap  , UVM_DEFAULT + UVM_DEC)
      `uvm_field_int(max_gap  , UVM_DEFAULT + UVM_DEC)
      `uvm_field_object(board_vseq, UVM_DEFAULT)
      `uvm_field_object(chip_vseq, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Sets safe defaults.
    */
   constraint defaults_cons {
      soft num_items == uvme_cvmcu_io_st_rand_stim_vseq_default_num_items;
      soft min_size  == uvme_cvmcu_io_st_rand_stim_vseq_default_min_size;
      soft max_size  == uvme_cvmcu_io_st_rand_stim_vseq_default_max_size;
      soft min_gap   == uvme_cvmcu_io_st_rand_stim_vseq_default_min_gap ;
      soft max_gap   == uvme_cvmcu_io_st_rand_stim_vseq_default_max_gap ;
   }

   /**
    * Links Sequences knobs.
    */
   constraint limits_cons {
      board_vseq.num_items == num_items;
      board_vseq.min_size  == min_size;
      board_vseq.max_size  == max_size;
      board_vseq.min_gap   == min_gap ;
      board_vseq.max_gap   == max_gap ;
      chip_vseq.num_items == num_items;
      chip_vseq.min_size  == min_size;
      chip_vseq.max_size  == max_size;
      chip_vseq.min_gap   == min_gap ;
      chip_vseq.max_gap   == max_gap ;
   }


   /**
    * Default constructor.
    */
   function new(string name="uvme_cvmcu_io_st_rand_stim_vseq");
      super.new(name);
   endfunction

   /**
    * Creates sub-sequences.
    */
   virtual function void create_objects();
      board_vseq = uvma_cvmcu_io_rand_stim_vseq_c::type_id::create("board_vseq");
      chip_vseq = uvma_cvmcu_io_rand_stim_vseq_c::type_id::create("chip_vseq");
   endfunction

   /**
    * Generates Sequence Items in both directions according to knobs values.
    * 
    */
   virtual task body();
      `uvm_info("CVMCU_IO_ST_RAND_STIM_VSEQ", "Starting sequence", UVM_MEDIUM)
      fork
         board_vseq.start(p_sequencer.board_vsequencer);
         chip_vseq.start(p_sequencer.chip_vsequencer);
      join
   
   endtask

endclass : uvme_cvmcu_io_st_rand_stim_vseq_c


`endif // __UVME_CVMCU_IO_ST_RAND_STIM_VSEQ_SV__