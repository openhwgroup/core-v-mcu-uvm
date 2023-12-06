// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_CPI_ST_SQR_SV__
`define __UVME_CVMCU_CPI_ST_SQR_SV__


/**
 * Sequencer running CORE-V-MCU Camera Parallel Interface Agent Self-Test Environment Sequences extending uvme_cvmcu_cpi_st_base_seq_c.
 * @ingroup uvme_cvmcu_cpi_st_comps
 */
class uvme_cvmcu_cpi_st_sqr_c extends uvmx_agent_env_sqr_c #(
   .T_CFG  (uvme_cvmcu_cpi_st_cfg_c  ),
   .T_CNTXT(uvme_cvmcu_cpi_st_cntxt_c)
);

   /// @name Sequencer handles
   /// @{
   uvma_cvmcu_cpi_sqr_c  tx_sequencer; ///< Handle to TX Agent's Sequencer.
   uvma_cvmcu_cpi_sqr_c  rx_sequencer; ///< Handle to RX Agent's Sequencer.
   uvma_cvmcu_cpi_sqr_c  passive_sequencer; ///< Handle to passive Agent's Sequencer.
   /// @}


   `uvm_component_utils(uvme_cvmcu_cpi_st_sqr_c)


   /**
    * Default constructor.
    */
   function new(string name="uvme_cvmcu_cpi_st_sqr", uvm_component parent=null);
      super.new(name, parent);
   endfunction

endclass


`endif // __UVME_CVMCU_CPI_ST_SQR_SV__