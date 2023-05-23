// Copyright 2023 Acme Enterprises
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_CHIP_BASE_VSEQ_SV__
`define __UVME_CVMCU_CHIP_BASE_VSEQ_SV__


/**
 * Abstract virtual sequence from which all other CORE-V-MCU Chip environment virtual sequences extend.
 * Subclasses must be run on uvme_cvmcu_chip_vsqr_c.
 * @note Does not generate any sequence items of its own.
 * @ingroup uvme_cvmcu_chip_seq
 */
class uvme_cvmcu_chip_base_vseq_c extends uvmx_chip_env_vseq_c #(
   .T_CFG  (uvme_cvmcu_chip_cfg_c  ),
   .T_CNTXT(uvme_cvmcu_chip_cntxt_c),
   .T_SQR  (uvme_cvmcu_chip_vsqr_c )
);

   `uvm_object_utils(uvme_cvmcu_chip_base_vseq_c)

   /**
    * Default constructor.
    */
   function new(string name="uvme_cvmcu_chip_base_vseq");
      super.new(name);
   endfunction

endclass : uvme_cvmcu_chip_base_vseq_c


`endif // __UVME_CVMCU_CHIP_BASE_VSEQ_SV__