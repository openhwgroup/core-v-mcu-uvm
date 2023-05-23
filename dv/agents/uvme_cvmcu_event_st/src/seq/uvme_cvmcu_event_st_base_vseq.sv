// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_EVENT_ST_BASE_VSEQ_SV__
`define __UVME_CVMCU_EVENT_ST_BASE_VSEQ_SV__


/**
 * Abstract Virtual Sequence from which all CORE-V-MCU Event Interface UVM Agent Self-Test Environment Virtual Sequences extend.
 * @ingroup uvme_cvmcu_event_st_seq
 */
class uvme_cvmcu_event_st_base_vseq_c extends uvmx_agent_env_vseq_c #(
   .T_CFG  (uvme_cvmcu_event_st_cfg_c  ),
   .T_CNTXT(uvme_cvmcu_event_st_cntxt_c),
   .T_SQR  (uvme_cvmcu_event_st_vsqr_c )
);

   `uvm_object_utils(uvme_cvmcu_event_st_base_vseq_c)

   /**
    * Default constructor.
    */
   function new(string name="uvme_cvmcu_event_st_base_vseq");
      super.new(name);
   endfunction

endclass : uvme_cvmcu_event_st_base_vseq_c


`endif // __UVME_CVMCU_EVENT_ST_BASE_VSEQ_SV__