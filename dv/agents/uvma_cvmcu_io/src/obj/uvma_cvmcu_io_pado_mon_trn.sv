// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_IO_PADO_MON_TRN_SV__
`define __UVMA_CVMCU_IO_PADO_MON_TRN_SV__


/**
 * PADO Monitor Transaction sampled by monitor (uvma_cvmcu_io_pado_mon_c).
 * @ingroup uvma_cvmcu_io_obj
 */
class uvma_cvmcu_io_pado_mon_trn_c extends uvmx_mon_trn_c #(
   .T_CFG  (uvma_cvmcu_io_cfg_c  ),
   .T_CNTXT(uvma_cvmcu_io_cntxt_c)
);

   /// @name CHIP
   /// @{
   uvma_cvmcu_io_io_out_o_l_t   io_out_o  ; ///< Port's output signal
   uvma_cvmcu_io_pad_cfg_o_l_t  pad_cfg_o ; ///< PAD configuration (implementation dependent)
   uvma_cvmcu_io_io_oe_o_l_t    io_oe_o   ; ///< Port’s Output Enable 1: IO = io_out_o. 0: io_in_i = IO.
   logic                        slow_clk_o; ///< Output clock generated from ref_clk_i. Frequency is implementation dependent.
   /// @}

   /// @name BOARD
   /// @{
   /// @}


   `uvm_object_utils_begin(uvma_cvmcu_io_pado_mon_trn_c)
      `uvm_field_int(io_out_o, UVM_DEFAULT)
      `uvm_field_sarray_int(pad_cfg_o, UVM_DEFAULT)
      `uvm_field_int(io_oe_o, UVM_DEFAULT)
      `uvm_field_int(slow_clk_o, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   function new(string name="uvma_cvmcu_io_board_pado_mon_trn");
      super.new(name);
   endfunction

   /**
    * Initializes arrays.
    */
   virtual function void build();
   endfunction

   /**
    * Describes transaction as metadata for uvml_logs_metadata_logger_c.
    */
   virtual function uvmx_metadata_t get_metadata();
      string io_out_o_str;
      string pad_cfg_o_str;
      string io_oe_o_str;
      string slow_clk_o_str;
      io_out_o_str = $sformatf("%h", io_out_o);
      pad_cfg_o_str = `uvmx_ss2str(pad_cfg_o);
      io_oe_o_str = $sformatf("%h", io_oe_o);
      slow_clk_o_str = $sformatf("%b", slow_clk_o);
      `uvmx_metadata_field("io_out_o", io_out_o_str)
      `uvmx_metadata_field("pad_cfg_o", pad_cfg_o_str)
      `uvmx_metadata_field("io_oe_o", io_oe_o_str)
      `uvmx_metadata_field("slow_clk_o", slow_clk_o_str)
   endfunction

endclass : uvma_cvmcu_io_pado_mon_trn_c


`endif // __UVMA_CVMCU_IO_PADO_MON_TRN_SV__