// Copyright 2022-2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_APB_TIMER_VSQR_SV__
`define __UVME_APB_TIMER_VSQR_SV__


/**
 * Component on which all APB Timer Sub-System environment (uvme_apb_timer_env_c) virtual sequences are run.
 * @ingroup uvme_apb_timer_comps
 */
class uvme_apb_timer_vsqr_c extends uvmx_env_vsqr_c #(
   .T_CFG  (uvme_apb_timer_cfg_c  ),
   .T_CNTXT(uvme_apb_timer_cntxt_c)
);

   /// @name Sequencer handles
   /// @{
   uvma_apb_vsqr_c  apb_vsequencer; ///< Register access agent sequencer
   // TODO: Add sequencer handles
   //       Ex: uvme_sub_vsqr_c  sub_vsequencer; ///< Describe me!
   /// @}

   /// @name Ports
   /// @{
   /// @}

   /// @name FIFOs
   /// @{
   /// @}


   `uvm_component_utils(uvme_apb_timer_vsqr_c)


   /**
    * Default constructor.
    */
   function new(string name="uvme_apb_timer_sqr", uvm_component parent=null);
      super.new(name, parent);
   endfunction

   /**
    *
    */
   virtual function void create_sequencers();
   endfunction

   /**
    *
    */
   virtual function void create_ports();
   endfunction

   /**
    *
    */
   virtual function void create_fifos();
   endfunction

endclass : uvme_apb_timer_vsqr_c


`endif // __UVME_APB_TIMER_VSQR_SV__