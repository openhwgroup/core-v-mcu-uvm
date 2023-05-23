// Copyright 2023 Acme Enterprises
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_IO_BOARD_PADI_SEQ_ITEM_SV__
`define __UVMA_CVMCU_IO_BOARD_PADI_SEQ_ITEM_SV__


/**
 * Sequence Item created by CORE-V-MCU IO Virtual Sequences for driving uvma_cvmcu_io_board_padi_drv_c.
 * @ingroup uvma_cvmcu_io_seq
 */
class uvma_cvmcu_io_board_padi_seq_item_c extends uvmx_seq_item_c #(
   .T_CFG  (uvma_cvmcu_io_cfg_c  ),
   .T_CNTXT(uvma_cvmcu_io_cntxt_c)
);

   /// @name Data
   /// @{
   rand uvma_cvmcu_io_io_in_i_b_t  io_in_i; ///< Port’s input signal
   /// @}

   /// @name Metadata
   /// @{
   /// @}


   `uvm_object_utils_begin(uvma_cvmcu_io_board_padi_seq_item_c)
      `uvm_field_int(io_in_i, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   function new(string name="uvma_cvmcu_io_board_padi_seq_item");
      super.new(name);
   endfunction

   /**
    * Describes transaction as metadata for uvml_logs_metadata_logger_c.
    */
   virtual function uvmx_metadata_t get_metadata();
      string io_in_i_str;
      io_in_i_str = $sformatf("%h", io_in_i);
      `uvmx_metadata_field("io_in_i", io_in_i_str)
   endfunction

endclass : uvma_cvmcu_io_board_padi_seq_item_c


`endif // __UVMA_CVMCU_IO_BOARD_PADI_SEQ_ITEM_SV__