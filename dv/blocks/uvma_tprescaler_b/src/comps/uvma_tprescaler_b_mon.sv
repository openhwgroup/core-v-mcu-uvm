// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_TPRESCALER_B_MON_SV__
`define __UVMA_TPRESCALER_B_MON_SV__


/**
 * Component sampling Monitor Transactions from  Interface (uvma_tprescaler_b_if).
 * @ingroup uvma_tprescaler_b_comps
 */
class uvma_tprescaler_b_mon_c extends uvmx_mon_c #(
   .T_CFG  (uvma_tprescaler_b_cfg_c  ),
   .T_CNTXT(uvma_tprescaler_b_cntxt_c)
);

   /// @name Components
   /// @{
   uvma_tprescaler_b_cp_mon_c   cp_monitor ; ///< Control Plane Monitor.
   uvma_tprescaler_b_dpi_mon_c  dpi_monitor; ///< Data Plane Input Monitor.
   uvma_tprescaler_b_dpo_mon_c  dpo_monitor; ///< Data Plane Output Monitor.
   /// @}


   `uvm_component_utils(uvma_tprescaler_b_mon_c)
   `uvmx_mon_reset(rst_ni, UVMX_ACTIVE_LOW)


   /**
    * Default constructor.
    */
   function new(string name="uvma_tprescaler_b_mon", uvm_component parent=null);
      super.new(name, parent);
   endfunction

   /**
    * Creates Monitor components.
    */
   virtual function void create_monitors();
      cp_monitor  = uvma_tprescaler_b_cp_mon_c ::type_id::create("cp_monitor" , this);
      dpi_monitor = uvma_tprescaler_b_dpi_mon_c::type_id::create("dpi_monitor", this);
      dpo_monitor = uvma_tprescaler_b_dpo_mon_c::type_id::create("dpo_monitor", this);
   endfunction

endclass : uvma_tprescaler_b_mon_c


`endif // __UVMA_TPRESCALER_B_MON_SV__