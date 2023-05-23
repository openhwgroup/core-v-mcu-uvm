// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_IO_BOARD_PADO_SEQ_ITEM_SV__
`define __UVMA_CVMCU_IO_BOARD_PADO_SEQ_ITEM_SV__


/**
 * Sequence Item created by CORE-V-MCU IO Virtual Sequences for driving uvma_cvmcu_io_board_pado_drv_c.
 * @ingroup uvma_cvmcu_io_seq
 */
class uvma_cvmcu_io_board_pado_seq_item_c extends uvmx_seq_item_c #(
   .T_CFG  (uvma_cvmcu_io_cfg_c  ),
   .T_CNTXT(uvma_cvmcu_io_cntxt_c)
);

   /// @name Data
   /// @{
   /// @}


   `uvm_object_utils_begin(uvma_cvmcu_io_board_pado_seq_item_c)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   function new(string name="uvma_cvmcu_io_board_pado_seq_item");
      super.new(name);
   endfunction

   /**
    * Describes transaction as metadata for uvml_logs_metadata_logger_c.
    */
   virtual function uvmx_metadata_t get_metadata();
   endfunction

endclass : uvma_cvmcu_io_board_pado_seq_item_c


`endif // __UVMA_CVMCU_IO_BOARD_PADO_SEQ_ITEM_SV__