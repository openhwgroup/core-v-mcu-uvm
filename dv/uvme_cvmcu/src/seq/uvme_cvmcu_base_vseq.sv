// Copyright 2022-2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_BASE_VSEQ_SV__
`define __UVME_CVMCU_BASE_VSEQ_SV__


/**
 * Abstract virtual sequence from which all other CORE-V MCU environment virtual sequences extend.
 * Subclasses must be run on uvme_cvmcu_vsqr_c.
 * @note Does not generate any sequence items of its own.
 * @ingroup uvme_cvmcu_seq
 */
class uvme_cvmcu_base_vseq_c extends uvmx_seq_c #(
   .T_CFG  (uvme_cvmcu_cfg_c  ),
   .T_CNTXT(uvme_cvmcu_cntxt_c),
   .T_SQR  (uvme_cvmcu_vsqr_c )
);

   `uvm_object_utils(uvme_cvmcu_base_vseq_c)

   /**
    * Default constructor.
    */
   function new(string name="uvme_cvmcu_base_vseq");
      super.new(name);
   endfunction

endclass : uvme_cvmcu_base_vseq_c


`endif // __UVME_CVMCU_BASE_VSEQ_SV__
