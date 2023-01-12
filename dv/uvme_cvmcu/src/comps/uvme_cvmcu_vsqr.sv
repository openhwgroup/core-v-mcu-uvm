// Copyright 2022-2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_VSQR_SV__
`define __UVME_CVMCU_VSQR_SV__


/**
 * Component on which all CORE-V MCU Sub-System environment (uvme_cvmcu_env_c) virtual sequences are run.
 * @ingroup uvme_cvmcu_comps
 */
class uvme_cvmcu_vsqr_c extends uvmx_env_vsqr_c #(
   .T_CFG  (uvme_cvmcu_cfg_c  ),
   .T_CNTXT(uvme_cvmcu_cntxt_c)
);

   /// @name Sequencer handles
   /// @{
   uvma_obi_vsqr_c  obi_instr_vsequencer; ///< Register access agent sequencer
   uvma_obi_vsqr_c  obi_data_vsequencer ; ///< Register access agent sequencer
   // TODO: Add sequencer handles
   //       Ex: uvme_sub_vsqr_c  sub_vsequencer; ///< Describe me!
   /// @}

   /// @name Ports
   /// @{
   /// @}

   /// @name FIFOs
   /// @{
   /// @}


   `uvm_component_utils(uvme_cvmcu_vsqr_c)


   /**
    * Default constructor.
    */
   function new(string name="uvme_cvmcu_sqr", uvm_component parent=null);
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

endclass : uvme_cvmcu_vsqr_c


`endif // __UVME_CVMCU_VSQR_SV__
