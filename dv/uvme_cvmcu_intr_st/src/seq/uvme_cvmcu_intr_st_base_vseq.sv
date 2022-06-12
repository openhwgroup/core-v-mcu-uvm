// Copyright 2022 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_INTR_ST_BASE_VSEQ_SV__
`define __UVME_CVMCU_INTR_ST_BASE_VSEQ_SV__


/**
 * Abstract virtual sequence from which CORE-V MCU Interrupt UVM Agent Self-Test environment virtual sequences extend.
 * Subclasses must be run on uvme_cvmcu_intr_st_vsqr_c.
 * @note Does not generate any sequence items of its own.
 */
class uvme_cvmcu_intr_st_base_vseq_c extends uvml_vseq_c #(
   .REQ(uvm_sequence_item),
   .RSP(uvm_sequence_item)
);

   /// @defgroup Objects
   /// @{
   uvme_cvmcu_intr_st_cfg_c    cfg  ; ///< Environment configuration handle
   uvme_cvmcu_intr_st_cntxt_c  cntxt; ///< Environment context handle
   /// @}


   `uvm_object_utils(uvme_cvmcu_intr_st_base_vseq_c)
   `uvm_declare_p_sequencer(uvme_cvmcu_intr_st_vsqr_c)


   /**
    * Default constructor.
    */
   extern function new(string name="uvme_cvmcu_intr_st_base_vseq");

   /**
    * Retrieve #cfg and #cntxt handles from p_sequencer.
    */
   extern virtual task pre_start();

endclass : uvme_cvmcu_intr_st_base_vseq_c


function uvme_cvmcu_intr_st_base_vseq_c::new(string name="uvme_cvmcu_intr_st_base_vseq");

   super.new(name);

endfunction : new


task uvme_cvmcu_intr_st_base_vseq_c::pre_start();

   cfg   = p_sequencer.cfg;
   cntxt = p_sequencer.cntxt;

endtask : pre_start


`endif // __UVME_CVMCU_INTR_ST_BASE_VSEQ_SV__
