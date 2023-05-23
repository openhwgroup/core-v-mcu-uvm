// Copyright 2023 Acme Enterprises
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_EVENT_MON_SV__
`define __UVMA_CVMCU_EVENT_MON_SV__


/**
 * Component sampling Monitor Transactions from  Interface (uvma_cvmcu_event_if).
 * @ingroup uvma_cvmcu_event_comps
 */
class uvma_cvmcu_event_mon_c extends uvmx_mon_c #(
   .T_CFG  (uvma_cvmcu_event_cfg_c  ),
   .T_CNTXT(uvma_cvmcu_event_cntxt_c)
);

   /// @name Components
   /// @{
   uvma_cvmcu_event_phy_mon_c  phy_monitor; ///<
   /// @}


   `uvm_component_utils(uvma_cvmcu_event_mon_c)
   `uvmx_mon_reset(HRESETn, UVMX_ACTIVE_LOW)


   /**
    * Default constructor.
    */
   function new(string name="uvma_cvmcu_event_mon", uvm_component parent=null);
      super.new(name, parent);
   endfunction

   /**
    *
    */
   virtual function void create_monitors();
      phy_monitor = uvma_cvmcu_event_phy_mon_c::type_id::create("phy_monitor", this);
   endfunction

endclass : uvma_cvmcu_event_mon_c


`endif // __UVMA_CVMCU_EVENT_MON_SV__