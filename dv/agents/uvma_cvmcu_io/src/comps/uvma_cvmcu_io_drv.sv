// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_IO_DRV_SV__
`define __UVMA_CVMCU_IO_DRV_SV__


/**
 * Component driving CORE-V-MCU IO Interface (uvma_cvmcu_io_if) in either direction.
 * @ingroup uvma_cvmcu_io_comps
 */
class uvma_cvmcu_io_drv_c extends uvmx_drv_c #(
   .T_CFG  (uvma_cvmcu_io_cfg_c  ),
   .T_CNTXT(uvma_cvmcu_io_cntxt_c)
);

   /// @name Components
   /// @{
   uvma_cvmcu_io_board_padi_drv_c  board_padi_driver; ///< Drives Virtual Interface with BOARD PADI Sequence Items
   uvma_cvmcu_io_board_pado_drv_c  board_pado_driver; ///< Drives Virtual Interface with BOARD PADO Sequence Items
   uvma_cvmcu_io_chip_padi_drv_c  chip_padi_driver; ///< Drives Virtual Interface with CHIP PADI Sequence Items
      uvma_cvmcu_io_chip_pado_drv_c  chip_pado_driver; ///< Drives Virtual Interface with CHIP PADO Sequence Items
   /// @}


   `uvm_component_utils(uvma_cvmcu_io_drv_c)


   /**
    * Default constructor.
    */
   function new(string name="uvma_cvmcu_io_drv", uvm_component parent=null);
      super.new(name, parent);
   endfunction

   /**
    * Creates sub-driver components.
    */
   virtual function void create_drivers();
      board_padi_driver = uvma_cvmcu_io_board_padi_drv_c::type_id::create("board_padi_driver", this);
      board_pado_driver = uvma_cvmcu_io_board_pado_drv_c::type_id::create("board_pado_driver", this);
      chip_padi_driver = uvma_cvmcu_io_chip_padi_drv_c::type_id::create("chip_padi_driver", this);
      chip_pado_driver = uvma_cvmcu_io_chip_pado_drv_c::type_id::create("chip_pado_driver", this);
   endfunction

endclass


`endif // __UVMA_CVMCU_IO_DRV_SV__