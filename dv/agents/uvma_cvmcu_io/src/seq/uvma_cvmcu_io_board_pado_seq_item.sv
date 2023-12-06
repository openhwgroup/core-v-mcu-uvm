// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_IO_BOARD_PADO_SEQ_ITEM_SV__
`define __UVMA_CVMCU_IO_BOARD_PADO_SEQ_ITEM_SV__


/**
 * Sequence Item created by CORE-V-MCU IO Sequences for driving uvma_cvmcu_io_board_pado_drv_c.
 * @ingroup uvma_cvmcu_io_seq_item
 */
class uvma_cvmcu_io_board_pado_seq_item_c extends uvmx_seq_item_c #(
   .T_CFG  (uvma_cvmcu_io_cfg_c  ),
   .T_CNTXT(uvma_cvmcu_io_cntxt_c)
);

   /// @name Data
   /// @{
   /// @}

   /// @name Metadata
   /// @{
   uvma_cvmcu_io_io_out_o_l_t  io_out_o  ; ///< Port's output signal
   uvma_cvmcu_io_pad_cfg_o_l_t  pad_cfg_o ; ///< PAD configuration (implementation dependent)
   uvma_cvmcu_io_io_oe_o_l_t  io_oe_o   ; ///< Port’s Output Enable 1: IO = io_out_o. 0: io_in_i = IO.
   logic  slow_clk_o; ///< Output clock generated from ref_clk_i. Frequency is implementation dependent.
   /// @}


   `uvm_object_utils_begin(uvma_cvmcu_io_board_pado_seq_item_c)
      `uvm_field_int(io_out_o, UVM_DEFAULT)
      `uvm_field_sarray_int(pad_cfg_o, UVM_DEFAULT)
      `uvm_field_int(io_oe_o, UVM_DEFAULT)
      `uvm_field_int(slow_clk_o, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Sets array sizes for 2d buses.
    */
    constraint arrays_cons {
   }


   /**
    * Default constructor.
    */
   function new(string name="uvma_cvmcu_io_board_pado_seq_item");
      super.new(name);
   endfunction

   /**
    * Describes sequence item for logger.
    */
   virtual function uvmx_metadata_t get_metadata();
      string  val_str;
      val_str = $sformatf("%h", io_out_o);
      `uvmx_metadata_field("io_out_o", val_str)
      val_str = `uvmx_ss2str(pad_cfg_o);
      `uvmx_metadata_field("pad_cfg_o", val_str)
      val_str = $sformatf("%h", io_oe_o);
      `uvmx_metadata_field("io_oe_o", val_str)
      val_str = $sformatf("%b", slow_clk_o);
      `uvmx_metadata_field("slow_clk_o", val_str)
   endfunction

endclass


`endif // __UVMA_CVMCU_IO_BOARD_PADO_SEQ_ITEM_SV__