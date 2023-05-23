// Copyright 2023 Acme Enterprises
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_TCOUNTER_B_BASE_VSEQ_SV__
`define __UVME_TCOUNTER_B_BASE_VSEQ_SV__


/**
 * Abstract Virtual Sequence from which all  Block Self-Test Environment Virtual Sequences extend.
 * @ingroup uvme_tcounter_b_seq
 */
class uvme_tcounter_b_base_vseq_c extends uvmx_block_env_vseq_c #(
   .T_CFG  (uvme_tcounter_b_cfg_c  ),
   .T_CNTXT(uvme_tcounter_b_cntxt_c),
   .T_SQR  (uvme_tcounter_b_vsqr_c )
);

   `uvm_object_utils(uvme_tcounter_b_base_vseq_c)

   /**
    * Default constructor.
    */
   function new(string name="uvme_tcounter_b_base_vseq");
      super.new(name);
   endfunction

endclass : uvme_tcounter_b_base_vseq_c


`endif // __UVME_TCOUNTER_B_BASE_VSEQ_SV__