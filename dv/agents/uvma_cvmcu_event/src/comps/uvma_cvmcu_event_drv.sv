// Copyright 2023 Acme Enterprises
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_EVENT_DRV_SV__
`define __UVMA_CVMCU_EVENT_DRV_SV__


/**
 * Component driving CORE-V-MCU Event Interface Interface (uvma_cvmcu_event_if) in either direction.
 * @ingroup uvma_cvmcu_event_comps
 */
class uvma_cvmcu_event_drv_c extends uvmx_drv_c #(
   .T_CFG  (uvma_cvmcu_event_cfg_c  ),
   .T_CNTXT(uvma_cvmcu_event_cntxt_c)
);

   /// @name Components
   /// @{
   uvma_cvmcu_event_core_phy_drv_c  core_phy_driver; ///< Drives Virtual Interface with CORE PHY Sequence Items
   uvma_cvmcu_event_sys_phy_drv_c  sys_phy_driver; ///< Drives Virtual Interface with SYS PHY Sequence Items
   /// @}


   `uvm_component_utils(uvma_cvmcu_event_drv_c)


   /**
    * Default constructor.
    */
   function new(string name="uvma_cvmcu_event_drv", uvm_component parent=null);
      super.new(name, parent);
   endfunction

   /**
    * Creates Driver components.
    */
   virtual function void create_drivers();
      core_phy_driver = uvma_cvmcu_event_core_phy_drv_c::type_id::create("core_phy_driver", this);
      sys_phy_driver = uvma_cvmcu_event_sys_phy_drv_c::type_id::create("sys_phy_driver", this);
   endfunction

endclass : uvma_cvmcu_event_drv_c


`endif // __UVMA_CVMCU_EVENT_DRV_SV__