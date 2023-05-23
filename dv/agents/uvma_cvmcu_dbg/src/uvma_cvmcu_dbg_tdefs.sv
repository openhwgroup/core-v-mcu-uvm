// Copyright 2023 Acme Enterprises
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_DBG_TDEFS_SV__
`define __UVMA_CVMCU_DBG_TDEFS_SV__



/**
 * Driving modes for uvma_cvmcu_dbg_agent_c when active.
 */
typedef enum {
   UVMA_CVMCU_DBG_DRV_MODE_CORE, ///< Drives CORE
   UVMA_CVMCU_DBG_DRV_MODE_SYS  ///< Drives SYS
} uvma_cvmcu_dbg_mode_enum;


/// @name Logic vectors
/// @{
/// @}

/// @name Bit vectors
/// @{
/// @}


/// @name Forward Type Declarations
/// @{
typedef class uvma_cvmcu_dbg_cfg_c;
typedef class uvma_cvmcu_dbg_cntxt_c;
typedef class uvma_cvmcu_dbg_phy_mon_trn_c;
typedef class uvma_cvmcu_dbg_sys_phy_seq_item_c;
typedef class uvma_cvmcu_dbg_core_phy_seq_item_c;
typedef class uvma_cvmcu_dbg_mon_vseq_c ;
typedef class uvma_cvmcu_dbg_idle_vseq_c;
typedef class uvma_cvmcu_dbg_core_drv_vseq_c;
typedef class uvma_cvmcu_dbg_sys_drv_vseq_c;

/// @}


`endif // __UVMA_CVMCU_DBG_TDEFS_SV__