// Copyright 2022 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_INTR_ST_TDEFS_SV__
`define __UVME_CVMCU_INTR_ST_TDEFS_SV__


// Scoreboard specialization
typedef uvml_sb_simplex_c #(
   .T_ACT_TRN(uvma_cvmcu_intr_mon_trn_c)
) uvme_cvmcu_intr_st_sb_simplex_c;

// Add tdefs, enums and structs here
// Ex: typedef bit [(`UVME_CVMCU_INTR_ABC_MAX_WIDTH-1):0]  uvme_cvmcu_intr_abc_b_t;
// Ex: typedef enum {
//        UVME_CVMCU_INTR_MY_ABC
//     } uvme_cvmcu_intr_my_enum;
// Ex: typedef struct {
//        bit [2:0]  abc;
//        logic      xyz;
//     } uvme_cvmcu_intr_my_struct;


`endif // __UVME_CVMCU_INTR_ST_TDEFS_SV__
