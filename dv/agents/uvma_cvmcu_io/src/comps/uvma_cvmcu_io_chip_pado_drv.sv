// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_IO_CHIP_PADO_DRV_SV__
`define __UVMA_CVMCU_IO_CHIP_PADO_DRV_SV__


/**
 * Driver driving CORE-V-MCU IO Virtual Interface (uvma_cvmcu_io_if) CHIP PADO.
 * @ingroup uvma_cvmcu_io_comps
 */
class uvma_cvmcu_io_chip_pado_drv_c extends uvmx_mp_drv_c #(
   .T_MP      (virtual uvma_cvmcu_io_if.chip_pado_drv_mp),
   .T_CFG     (uvma_cvmcu_io_cfg_c  ),
   .T_CNTXT   (uvma_cvmcu_io_cntxt_c),
   .T_SEQ_ITEM(uvma_cvmcu_io_chip_pado_seq_item_c)
);

   `uvm_component_utils(uvma_cvmcu_io_chip_pado_drv_c)
   `uvmx_mp_drv(chip_pado_drv_mp, chip_pado_drv_cb)

   /**
    * Default constructor.
    */
   function new(string name="uvma_cvmcu_io_chip_pado_drv", uvm_component parent=null);
      super.new(name, parent);
   endfunction

   /**
    * Trims data outside configured widths.
    */
   virtual function void process_item(ref uvma_cvmcu_io_chip_pado_seq_item_c item);
   endfunction

   /**
    * Drives CHIP PADO Driver clocking block (chip_pado_drv_cb) on each clock cycle.
    */
   virtual task drive_item(ref uvma_cvmcu_io_chip_pado_seq_item_c item);
      mp.chip_pado_drv_cb.io_out_o <= item.io_out_o;
      foreach (item.pad_cfg_o[ii]) begin
         mp.chip_pado_drv_cb.pad_cfg_o[ii] <= item.pad_cfg_o[ii];
      end
      mp.chip_pado_drv_cb.io_oe_o <= item.io_oe_o;
      mp.chip_pado_drv_cb.slow_clk_o <= item.slow_clk_o;
   endtask


endclass : uvma_cvmcu_io_chip_pado_drv_c


`endif // __UVMA_CVMCU_IO_CHIP_PADO_DRV_SV__