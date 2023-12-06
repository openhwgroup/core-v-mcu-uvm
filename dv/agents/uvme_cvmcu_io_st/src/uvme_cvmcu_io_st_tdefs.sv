// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_IO_ST_TDEFS_SV__
`define __UVME_CVMCU_IO_ST_TDEFS_SV__




/**
 * Scoreboard specialization.
 */
typedef uvmx_sb_simplex_c #(
   .T_ACT_TRN(uvma_cvmcu_io_mon_trn_c)
) uvme_cvmcu_io_st_sb_simplex_c;

/**
 * Empty coverage model.
 */
typedef uvmx_env_cov_model_c #(
   .T_CFG  (uvme_cvmcu_io_st_cfg_c  ),
   .T_CNTXT(uvme_cvmcu_io_st_cntxt_c)
) uvme_cvmcu_io_st_mock_cov_model_c;


`endif // __UVME_CVMCU_IO_ST_TDEFS_SV__