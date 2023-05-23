// Copyright 2023 Acme Enterprises
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_CPI_DRV_SV__
`define __UVMA_CVMCU_CPI_DRV_SV__


/**
 * Component driving CORE-V-MCU Camera Parallel Interface Interface (uvma_cvmcu_cpi_if) in either direction.
 * @ingroup uvma_cvmcu_cpi_comps
 */
class uvma_cvmcu_cpi_drv_c extends uvmx_drv_c #(
   .T_CFG  (uvma_cvmcu_cpi_cfg_c  ),
   .T_CNTXT(uvma_cvmcu_cpi_cntxt_c)
);

   /// @name Components
   /// @{
   uvma_cvmcu_cpi_tx_phy_drv_c  tx_phy_driver; ///< Drives Virtual Interface with TX PHY Sequence Items
   uvma_cvmcu_cpi_rx_phy_drv_c  rx_phy_driver; ///< Drives Virtual Interface with RX PHY Sequence Items
   /// @}


   `uvm_component_utils(uvma_cvmcu_cpi_drv_c)


   /**
    * Default constructor.
    */
   function new(string name="uvma_cvmcu_cpi_drv", uvm_component parent=null);
      super.new(name, parent);
   endfunction

   /**
    * Creates Driver components.
    */
   virtual function void create_drivers();
      tx_phy_driver = uvma_cvmcu_cpi_tx_phy_drv_c::type_id::create("tx_phy_driver", this);
      rx_phy_driver = uvma_cvmcu_cpi_rx_phy_drv_c::type_id::create("rx_phy_driver", this);
   endfunction

endclass : uvma_cvmcu_cpi_drv_c


`endif // __UVMA_CVMCU_CPI_DRV_SV__