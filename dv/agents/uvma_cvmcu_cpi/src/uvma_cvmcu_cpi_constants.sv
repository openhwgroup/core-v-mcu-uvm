// Copyright 2023 Acme Enterprises
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_CPI_CONSTANTS_SV__
`define __UVMA_CVMCU_CPI_CONSTANTS_SV__


const int unsigned  uvma_cvmcu_cpi_rand_stim_vseq_max_num_items     = 1_000; ///< Maximum number of packets for sequences.
const int unsigned  uvma_cvmcu_cpi_rand_stim_vseq_min_size          =     8; ///< Minimum packet size for sequences.
const int unsigned  uvma_cvmcu_cpi_rand_stim_vseq_max_size          = 1_024; ///< Maximum packet size for sequences.
const int unsigned  uvma_cvmcu_cpi_rand_stim_vseq_max_gap           =   100; ///< Minimum packet gap for sequences.
const int unsigned  uvma_cvmcu_cpi_rand_ill_stim_vseq_max_num_items = 1_000; ///< Default number of accesses for error sequences.
const int unsigned  uvma_cvmcu_cpi_rand_ill_stim_vseq_min_size      =     8; ///< Minimum packet size for error sequences.
const int unsigned  uvma_cvmcu_cpi_rand_ill_stim_vseq_max_size      = 1_024; ///< Maximum packet size for error sequences.
const int unsigned  uvma_cvmcu_cpi_rand_ill_stim_vseq_max_gap       =   100; ///< Minimum packet gap for error sequences.

const int unsigned  uvma_cvmcu_cpi_default_data_width  = 12; ///< Default Data width.  Measured in bits (b).


`endif // __UVMA_CVMCU_CPI_CONSTANTS_SV__