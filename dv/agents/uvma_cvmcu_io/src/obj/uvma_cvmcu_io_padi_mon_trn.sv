// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_IO_PADI_MON_TRN_SV__
`define __UVMA_CVMCU_IO_PADI_MON_TRN_SV__


/**
 * PADI Monitor Transaction sampled by monitor (uvma_cvmcu_io_padi_mon_c).
 * @ingroup uvma_cvmcu_io_obj
 */
class uvma_cvmcu_io_padi_mon_trn_c extends uvmx_mon_trn_c #(
   .T_CFG  (uvma_cvmcu_io_cfg_c  ),
   .T_CNTXT(uvma_cvmcu_io_cntxt_c)
);

   /// @name BOARD
   /// @{
   uvma_cvmcu_io_io_in_i_l_t  io_in_i; ///< Port’s input signal
   /// @}

   /// @name CHIP
   /// @{
   /// @}


   `uvm_object_utils_begin(uvma_cvmcu_io_padi_mon_trn_c)
      `uvm_field_int(io_in_i, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   function new(string name="uvma_cvmcu_io_chip_padi_mon_trn");
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

endclass : uvma_cvmcu_io_padi_mon_trn_c


`endif // __UVMA_CVMCU_IO_PADI_MON_TRN_SV__