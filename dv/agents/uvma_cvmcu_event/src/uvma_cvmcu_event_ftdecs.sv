// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_EVENT_FTDECS_SV__
`define __UVMA_CVMCU_EVENT_FTDECS_SV__


typedef class uvma_cvmcu_event_cfg_c;
typedef class uvma_cvmcu_event_cntxt_c;
typedef class uvma_cvmcu_event_mon_trn_c;
typedef class uvma_cvmcu_event_seq_item_c;
typedef class uvma_cvmcu_event_phy_mon_trn_c;
typedef class uvma_cvmcu_event_sys_phy_seq_item_c;
typedef class uvma_cvmcu_event_core_phy_seq_item_c;
typedef class uvma_cvmcu_event_mon_seq_c;
typedef class uvma_cvmcu_event_idle_seq_c;
typedef class uvma_cvmcu_event_core_drv_seq_c;
typedef class uvma_cvmcu_event_sys_drv_seq_c;


/// @name Physical Sequencers
/// @{

typedef uvmx_sqr_c #(
   .T_CFG     (uvma_cvmcu_event_cfg_c  ),
   .T_CNTXT   (uvma_cvmcu_event_cntxt_c),
   .T_SEQ_ITEM(uvma_cvmcu_event_sys_phy_seq_item_c)
) uvma_cvmcu_event_sys_phy_sqr_c;
typedef uvmx_sqr_c #(
   .T_CFG     (uvma_cvmcu_event_cfg_c  ),
   .T_CNTXT   (uvma_cvmcu_event_cntxt_c),
   .T_SEQ_ITEM(uvma_cvmcu_event_core_phy_seq_item_c)
) uvma_cvmcu_event_core_phy_sqr_c;
/// @}


`endif // __UVMA_CVMCU_EVENT_FTDECS_SV__