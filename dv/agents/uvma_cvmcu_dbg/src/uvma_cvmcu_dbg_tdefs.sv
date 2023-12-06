// Copyright 2023 Datum Technology Corporation
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


/**
 * Event types
 */
typedef enum {
   UVMA_CVMCU_DBG_DEBUG_REQ,
   UVMA_CVMCU_DBG_STOP_TIMER
} uvma_cvmcu_dbg_event_type_enum;


/// @name Logic vectors
/// @{
/// @}

/// @name Bit vectors
/// @{
/// @}


`endif // __UVMA_CVMCU_DBG_TDEFS_SV__