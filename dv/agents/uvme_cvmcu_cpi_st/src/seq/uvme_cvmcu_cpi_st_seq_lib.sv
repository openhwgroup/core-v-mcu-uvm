// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_CPI_ST_SEQ_LIB_SV__
`define __UVME_CVMCU_CPI_ST_SEQ_LIB_SV__


`include "uvme_cvmcu_cpi_st_base_seq.sv"


/**
 * Sequence Library containing Sequences for CORE-V-MCU Camera Parallel Interface UVM Agent Self-Test Environment.
 * @ingroup uvme_cvmcu_cpi_st_seq
 */
class uvme_cvmcu_cpi_st_seq_lib_c extends uvmx_seq_lib_c #(
   .T_SEQ_ITEM(uvmx_seq_item_c)
);

   `uvm_object_utils          (uvme_cvmcu_cpi_st_seq_lib_c)
   `uvm_sequence_library_utils(uvme_cvmcu_cpi_st_seq_lib_c)

   /**
    * Default constructor.
    */
   function new(string name="uvme_cvmcu_cpi_st_seq_lib");
      super.new(name);
   endfunction

   /**
    * Adds sequences to library.
    */
   virtual function void add_lib_sequences();
   endfunction

endclass


`endif // __UVME_CVMCU_CPI_ST_SEQ_LIB_SV__