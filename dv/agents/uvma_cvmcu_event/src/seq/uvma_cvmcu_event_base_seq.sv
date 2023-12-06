// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_EVENT_BASE_SEQ_SV__
`define __UVMA_CVMCU_EVENT_BASE_SEQ_SV__


/**
 * Abstract Sequence from which all CORE-V-MCU Event Interface Agent Sequences must extend.
 * @ingroup uvma_cvmcu_event_seq
 */
class uvma_cvmcu_event_base_seq_c extends uvmx_agent_seq_c #(
   .T_CFG     (uvma_cvmcu_event_cfg_c     ),
   .T_CNTXT   (uvma_cvmcu_event_cntxt_c   ),
   .T_SQR     (uvma_cvmcu_event_sqr_c     ),
   .T_SEQ_ITEM(uvma_cvmcu_event_seq_item_c)
);
   `uvm_object_utils(uvma_cvmcu_event_base_seq_c)

   /**
    * Default constructor.
    */
   function new(string name="uvma_cvmcu_event_base_seq");
      super.new(name);
   endfunction

endclass


`endif // __UVMA_CVMCU_EVENT_BASE_SEQ_SV__