// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_ADV_TIMER_B_DRV_SV__
`define __UVMA_ADV_TIMER_B_DRV_SV__


/**
 * Component driving  Interface (uvma_adv_timer_b_if) for all planes.
 * @ingroup uvma_adv_timer_b_comps
 */
class uvma_adv_timer_b_drv_c extends uvmx_drv_c #(
   .T_CFG     (uvma_adv_timer_b_cfg_c  ),
   .T_CNTXT   (uvma_adv_timer_b_cntxt_c)
);

   /// @name Components
   /// @{
   uvma_adv_timer_b_cp_drv_c   cp_driver ; ///< Control Plane Driver.
   uvma_adv_timer_b_dpi_drv_c  dpi_driver; ///< Data Plane Input Driver.
   uvma_adv_timer_b_dpo_drv_c  dpo_driver; ///< Data Plane Output Driver.
   /// @}


   `uvm_component_utils(uvma_adv_timer_b_drv_c)


   /**
    * Default constructor.
    */
   function new(string name="uvma_adv_timer_b_drv", uvm_component parent=null);
      super.new(name, parent);
   endfunction

   /**
    * Creates Driver components.
    */
   virtual function void create_drivers();
      cp_driver  = uvma_adv_timer_b_cp_drv_c ::type_id::create("cp_driver" , this);
      dpi_driver = uvma_adv_timer_b_dpi_drv_c::type_id::create("dpi_driver", this);
      dpo_driver = uvma_adv_timer_b_dpo_drv_c::type_id::create("dpo_driver", this);
   endfunction

endclass : uvma_adv_timer_b_drv_c


`endif // __UVMA_ADV_TIMER_B_DRV_SV__