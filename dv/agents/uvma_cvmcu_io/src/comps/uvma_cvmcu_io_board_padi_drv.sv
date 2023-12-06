// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_IO_BOARD_PADI_DRV_SV__
`define __UVMA_CVMCU_IO_BOARD_PADI_DRV_SV__


/**
 * Driver driving CORE-V-MCU IO Virtual Interface (uvma_cvmcu_io_if) BOARD PADI.
 * @ingroup uvma_cvmcu_io_comps
 */
class uvma_cvmcu_io_board_padi_drv_c extends uvmx_mp_drv_c #(
   .T_MP      (virtual uvma_cvmcu_io_if.board_padi_drv_mp),
   .T_CFG     (uvma_cvmcu_io_cfg_c  ),
   .T_CNTXT   (uvma_cvmcu_io_cntxt_c),
   .T_SEQ_ITEM(uvma_cvmcu_io_board_padi_seq_item_c)
);

   `uvm_component_utils(uvma_cvmcu_io_board_padi_drv_c)
   `uvmx_mp_drv(board_padi_drv_mp, board_padi_drv_cb)

   /**
    * Default constructor.
    */
   function new(string name="uvma_cvmcu_io_board_padi_drv", uvm_component parent=null);
      super.new(name, parent);
   endfunction

   /**
    * Drives BOARD PADI Driver clocking block (board_padi_drv_cb) at the beginning of each clock cycle.
    */
   virtual task drive_item(ref uvma_cvmcu_io_board_padi_seq_item_c item);
      `uvmx_mp_drv_signal(item, io_in_i)
   endtask

endclass


`endif // __UVMA_CVMCU_IO_BOARD_PADI_DRV_SV__