// Copyright 2023 Acme Enterprises
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_IO_ST_VSQR_SV__
`define __UVME_CVMCU_IO_ST_VSQR_SV__


/**
 * Virtual Sequencer running CORE-V-MCU IO Agent Self-Test Environment Virtual Sequences extending uvme_cvmcu_io_st_base_vseq_c.
 * @ingroup uvme_cvmcu_io_st_comps
 */
class uvme_cvmcu_io_st_vsqr_c extends uvmx_agent_env_vsqr_c #(
   .T_CFG  (uvme_cvmcu_io_st_cfg_c  ),
   .T_CNTXT(uvme_cvmcu_io_st_cntxt_c)
);

   /// @name Sequencer handles
   /// @{
   uvma_cvmcu_io_vsqr_c  board_vsequencer; ///< Handle to BOARD Agent's Virtual Sequencer.
   uvma_cvmcu_io_vsqr_c  chip_vsequencer; ///< Handle to CHIP Agent's Virtual Sequencer.
   uvma_cvmcu_io_vsqr_c  passive_vsequencer; ///< Handle to passive Agent's Virtual Sequencer.
   /// @}


   `uvm_component_utils(uvme_cvmcu_io_st_vsqr_c)


   /**
    * Default constructor.
    */
   function new(string name="uvme_cvmcu_io_st_sqr", uvm_component parent=null);
      super.new(name, parent);
   endfunction

endclass : uvme_cvmcu_io_st_vsqr_c


`endif // __UVME_CVMCU_IO_ST_VSQR_SV__