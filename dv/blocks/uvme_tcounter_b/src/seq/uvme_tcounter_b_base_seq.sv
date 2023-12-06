// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_TCOUNTER_B_BASE_SEQ_SV__
`define __UVME_TCOUNTER_B_BASE_SEQ_SV__


/**
 * Abstract Sequence from which all Timer unit counter Block Self-Test Environment Virtual Sequences extend.
 * @ingroup uvme_tcounter_b_seq
 */
class uvme_tcounter_b_base_seq_c extends uvmx_block_env_seq_c #(
   .T_CFG  (uvme_tcounter_b_cfg_c  ),
   .T_CNTXT(uvme_tcounter_b_cntxt_c),
   .T_SQR  (uvme_tcounter_b_sqr_c  )
);

   `uvm_object_utils(uvme_tcounter_b_base_seq_c)

   /**
    * Default constructor.
    */
   function new(string name="uvme_tcounter_b_base_seq");
      super.new(name);
   endfunction

endclass : uvme_tcounter_b_base_seq_c


`endif // __UVME_TCOUNTER_B_BASE_SEQ_SV__