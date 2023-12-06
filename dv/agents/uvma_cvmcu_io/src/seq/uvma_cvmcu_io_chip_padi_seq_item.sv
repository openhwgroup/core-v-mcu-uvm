// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_IO_CHIP_PADI_SEQ_ITEM_SV__
`define __UVMA_CVMCU_IO_CHIP_PADI_SEQ_ITEM_SV__


/**
 * Sequence Item created by CORE-V-MCU IO Sequences for driving uvma_cvmcu_io_chip_padi_drv_c.
 * @ingroup uvma_cvmcu_io_seq_item
 */
class uvma_cvmcu_io_chip_padi_seq_item_c extends uvmx_seq_item_c #(
   .T_CFG  (uvma_cvmcu_io_cfg_c  ),
   .T_CNTXT(uvma_cvmcu_io_cntxt_c)
);

   /// @name Data
   /// @{
   /// @}

   /// @name Metadata
   /// @{
   uvma_cvmcu_io_io_in_i_l_t  io_in_i; ///< Port’s input signal
   /// @}


   `uvm_object_utils_begin(uvma_cvmcu_io_chip_padi_seq_item_c)
      `uvm_field_int(io_in_i, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   function new(string name="uvma_cvmcu_io_chip_padi_seq_item");
      super.new(name);
   endfunction

   /**
    * Describes sequence item for logger.
    */
   virtual function uvmx_metadata_t get_metadata();
      string  val_str;
      val_str = $sformatf("%h", io_in_i);
      `uvmx_metadata_field("io_in_i", val_str)
   endfunction

endclass


`endif // __UVMA_CVMCU_IO_CHIP_PADI_SEQ_ITEM_SV__