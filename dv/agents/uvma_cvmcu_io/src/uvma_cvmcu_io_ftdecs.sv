// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_IO_FTDECS_SV__
`define __UVMA_CVMCU_IO_FTDECS_SV__


typedef class uvma_cvmcu_io_cfg_c;
typedef class uvma_cvmcu_io_cntxt_c;
typedef class uvma_cvmcu_io_mon_trn_c;
typedef class uvma_cvmcu_io_seq_item_c;
typedef class uvma_cvmcu_io_padi_mon_trn_c;
typedef class uvma_cvmcu_io_board_padi_seq_item_c;
typedef class uvma_cvmcu_io_chip_padi_seq_item_c;
typedef class uvma_cvmcu_io_pado_mon_trn_c;
typedef class uvma_cvmcu_io_chip_pado_seq_item_c;
typedef class uvma_cvmcu_io_board_pado_seq_item_c;
typedef class uvma_cvmcu_io_mon_seq_c;
typedef class uvma_cvmcu_io_idle_seq_c;
typedef class uvma_cvmcu_io_board_drv_seq_c;
typedef class uvma_cvmcu_io_chip_drv_seq_c;


/// @name Physical Sequencers
/// @{

typedef uvmx_sqr_c #(
   .T_CFG     (uvma_cvmcu_io_cfg_c  ),
   .T_CNTXT   (uvma_cvmcu_io_cntxt_c),
   .T_SEQ_ITEM(uvma_cvmcu_io_board_padi_seq_item_c)
) uvma_cvmcu_io_board_padi_sqr_c;
typedef uvmx_sqr_c #(
   .T_CFG     (uvma_cvmcu_io_cfg_c  ),
   .T_CNTXT   (uvma_cvmcu_io_cntxt_c),
   .T_SEQ_ITEM(uvma_cvmcu_io_chip_padi_seq_item_c)
) uvma_cvmcu_io_chip_padi_sqr_c;
typedef uvmx_sqr_c #(
   .T_CFG     (uvma_cvmcu_io_cfg_c  ),
   .T_CNTXT   (uvma_cvmcu_io_cntxt_c),
   .T_SEQ_ITEM(uvma_cvmcu_io_chip_pado_seq_item_c)
) uvma_cvmcu_io_chip_pado_sqr_c;
typedef uvmx_sqr_c #(
   .T_CFG     (uvma_cvmcu_io_cfg_c  ),
   .T_CNTXT   (uvma_cvmcu_io_cntxt_c),
   .T_SEQ_ITEM(uvma_cvmcu_io_board_pado_seq_item_c)
) uvma_cvmcu_io_board_pado_sqr_c;
/// @}


`endif // __UVMA_CVMCU_IO_FTDECS_SV__