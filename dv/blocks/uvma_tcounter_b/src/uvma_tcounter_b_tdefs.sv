// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_TCOUNTER_B_TDEFS_SV__
`define __UVMA_TCOUNTER_B_TDEFS_SV__



/// @name Logic vectors
/// @{
typedef logic [31:0]  uvma_tcounter_b_compare_value_i_l_t; ///< Comparator value logic vector
typedef logic [31:0]  uvma_tcounter_b_counter_value_i_l_t; ///< Counter value to be loaded logic vector
typedef logic [31:0]  uvma_tcounter_b_counter_value_o_l_t; ///< Output counter value logic vector
/// @}

/// @name Bit vectors
/// @{
typedef bit [31:0]  uvma_tcounter_b_compare_value_i_b_t; ///< Comparator value bit vector
typedef bit [31:0]  uvma_tcounter_b_counter_value_i_b_t; ///< Counter value to be loaded bit vector
typedef bit [31:0]  uvma_tcounter_b_counter_value_o_b_t; ///< Output counter value bit vector
/// @}


`endif // __UVMA_TCOUNTER_B_TDEFS_SV__