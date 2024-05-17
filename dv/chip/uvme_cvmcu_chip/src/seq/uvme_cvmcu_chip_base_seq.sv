// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_CHIP_BASE_SEQ_SV__
`define __UVME_CVMCU_CHIP_BASE_SEQ_SV__


/**
 * Abstract Sequence from which all other CORE-V-MCU Chip environment Sequences extend.
 * Subclasses must be run on uvme_cvmcu_chip_sqr_c.
 * @ingroup uvme_cvmcu_chip_seq
 */
class uvme_cvmcu_chip_base_seq_c extends uvmx_chip_env_seq_c #(
   .T_CFG  (uvme_cvmcu_chip_cfg_c  ),
   .T_CNTXT(uvme_cvmcu_chip_cntxt_c),
   .T_SQR  (uvme_cvmcu_chip_sqr_c  )
);

   `uvm_object_utils(uvme_cvmcu_chip_base_seq_c)

   /**
    * Default constructor.
    */
   function new(string name="uvme_cvmcu_chip_base_seq");
      super.new(name);
   endfunction

endclass


`endif // __UVME_CVMCU_CHIP_BASE_SEQ_SV__
