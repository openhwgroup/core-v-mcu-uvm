// Copyright 2022 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_TDEFS_SV__
`define __UVME_CVMCU_TDEFS_SV__


// TODO Add scoreboard specializations
//      Ex: typedef uvml_sb_cntxt_c#(
//             .T_TRN(uvma_cvmcu_mon_trn_c)
//          ) uvme_cvmcu_sb_cntxt_c;
//
//          typedef uvml_sb_simplex_c#(
//             .T_CNTXT(uvme_cvmcu_sb_cntxt_c),
//             .T_TRN  (uvma_cvmcu_mon_trn_c )
//          ) uvme_cvmcu_sb_simplex_c;

/**
 *
 */
typedef enum {
   UVME_CVMCU_PERIPHERALS_GPIO , ///<
   UVME_CVMCU_PERIPHERALS_I2S  , ///<
   UVME_CVMCU_PERIPHERALS_SPIM , ///<
   UVME_CVMCU_PERIPHERALS_CAMIF, ///<
   UVME_CVMCU_PERIPHERALS_I2C  , ///<
   UVME_CVMCU_PERIPHERALS_UART , ///<
   UVME_CVMCU_PERIPHERALS_SDIO   ///<
} uvme_cvmcu_peripherals_enum;


/**
 *
 */
typedef enum {
   UVME_CVMCU_DMA_DATA_PATTERN_RANDOM  , ///<
   UVME_CVMCU_DMA_DATA_PATTERN_COUNTING, ///<
   UVME_CVMCU_DMA_DATA_PATTERN_ZEROS   , ///<
   UVME_CVMCU_DMA_DATA_PATTERN_55AA      ///<
} uvme_cvmcu_dma_data_pattern_enum;


`endif // __UVME_CVMCU_TDEFS_SV__
