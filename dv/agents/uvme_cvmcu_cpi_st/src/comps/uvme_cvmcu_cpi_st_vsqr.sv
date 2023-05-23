// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_CPI_ST_VSQR_SV__
`define __UVME_CVMCU_CPI_ST_VSQR_SV__


/**
 * Virtual Sequencer running CORE-V-MCU Camera Parallel Interface Agent Self-Test Environment Virtual Sequences extending uvme_cvmcu_cpi_st_base_vseq_c.
 * @ingroup uvme_cvmcu_cpi_st_comps
 */
class uvme_cvmcu_cpi_st_vsqr_c extends uvmx_agent_env_vsqr_c #(
   .T_CFG  (uvme_cvmcu_cpi_st_cfg_c  ),
   .T_CNTXT(uvme_cvmcu_cpi_st_cntxt_c)
);

   /// @name Sequencer handles
   /// @{
   uvma_cvmcu_cpi_vsqr_c  tx_vsequencer; ///< Handle to TX Agent's Virtual Sequencer.
   uvma_cvmcu_cpi_vsqr_c  rx_vsequencer; ///< Handle to RX Agent's Virtual Sequencer.
   uvma_cvmcu_cpi_vsqr_c  passive_vsequencer; ///< Handle to passive Agent's Virtual Sequencer.
   /// @}


   `uvm_component_utils(uvme_cvmcu_cpi_st_vsqr_c)


   /**
    * Default constructor.
    */
   function new(string name="uvme_cvmcu_cpi_st_sqr", uvm_component parent=null);
      super.new(name, parent);
   endfunction

endclass : uvme_cvmcu_cpi_st_vsqr_c


`endif // __UVME_CVMCU_CPI_ST_VSQR_SV__