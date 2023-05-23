// Copyright 2023 Acme Enterprises
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_CPI_TDEFS_SV__
`define __UVMA_CVMCU_CPI_TDEFS_SV__



/**
 * Driving modes for uvma_cvmcu_cpi_agent_c when active.
 */
typedef enum {
   UVMA_CVMCU_CPI_DRV_MODE_TX, ///< Drives TX
   UVMA_CVMCU_CPI_DRV_MODE_RX  ///< Drives RX
} uvma_cvmcu_cpi_mode_enum;


/// @name Logic vectors
/// @{
typedef logic [(`UVMA_CVMCU_CPI_DATA_MAX_WIDTH-1):0]  uvma_cvmcu_cpi_data_l_t; ///< Data logic vector
/// @}

/// @name Bit vectors
/// @{
typedef bit [(`UVMA_CVMCU_CPI_DATA_MAX_WIDTH-1):0]  uvma_cvmcu_cpi_data_b_t; ///< Data bit vector
/// @}


/// @name Forward Type Declarations
/// @{
typedef class uvma_cvmcu_cpi_cfg_c;
typedef class uvma_cvmcu_cpi_cntxt_c;
typedef class uvma_cvmcu_cpi_phy_mon_trn_c;
typedef class uvma_cvmcu_cpi_tx_phy_seq_item_c;
typedef class uvma_cvmcu_cpi_rx_phy_seq_item_c;
typedef class uvma_cvmcu_cpi_mon_vseq_c ;
typedef class uvma_cvmcu_cpi_idle_vseq_c;
typedef class uvma_cvmcu_cpi_tx_drv_vseq_c;
typedef class uvma_cvmcu_cpi_rx_drv_vseq_c;

/// @}


`endif // __UVMA_CVMCU_CPI_TDEFS_SV__