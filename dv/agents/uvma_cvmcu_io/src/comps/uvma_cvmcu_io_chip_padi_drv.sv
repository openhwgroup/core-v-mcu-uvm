// Copyright 2023 Acme Enterprises
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_IO_CHIP_PADI_DRV_SV__
`define __UVMA_CVMCU_IO_CHIP_PADI_DRV_SV__


/**
 * Driver driving CORE-V-MCU IO Virtual Interface (uvma_cvmcu_io_if) CHIP PADI.
 * @ingroup uvma_cvmcu_io_comps
 */
class uvma_cvmcu_io_chip_padi_drv_c extends uvmx_mp_drv_c #(
   .T_MP      (virtual uvma_cvmcu_io_if.chip_padi_drv_mp),
   .T_CFG     (uvma_cvmcu_io_cfg_c  ),
   .T_CNTXT   (uvma_cvmcu_io_cntxt_c),
   .T_SEQ_ITEM(uvma_cvmcu_io_chip_padi_seq_item_c)
);

   `uvm_component_utils(uvma_cvmcu_io_chip_padi_drv_c)
   `uvmx_mp_drv(chip_padi_drv_mp, chip_padi_drv_cb)

   /**
    * Default constructor.
    */
   function new(string name="uvma_cvmcu_io_chip_padi_drv", uvm_component parent=null);
      super.new(name, parent);
   endfunction


   /**
    * Drives CHIP PADI Driver clocking block (chip_padi_drv_cb) on each clock cycle.
    */
   virtual task drive_item(ref uvma_cvmcu_io_chip_padi_seq_item_c item);
   endtask

endclass : uvma_cvmcu_io_chip_padi_drv_c


`endif // __UVMA_CVMCU_IO_CHIP_PADI_DRV_SV__