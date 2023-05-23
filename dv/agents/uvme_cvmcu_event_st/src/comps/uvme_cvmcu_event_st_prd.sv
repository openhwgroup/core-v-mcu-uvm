// Copyright 2023 Acme Enterprises
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_EVENT_ST_PRD_SV__
`define __UVME_CVMCU_EVENT_ST_PRD_SV__


/**
 * Component implementing TLM-based prediction for CORE-V-MCU Event Interface UVM Agent Self-Testing Environment.
 * Predicts how the Passive Agent will observe stimulus from CORE & SYS Agents as well as end-to-end.
 * @ingroup uvme_cvmcu_event_st_comps
 */
class uvme_cvmcu_event_st_prd_c extends uvmx_agent_prd_c #(
   .T_CFG  (uvme_cvmcu_event_st_cfg_c  ),
   .T_CNTXT(uvme_cvmcu_event_st_cntxt_c)
);

   /// @name FIFOs
   /// @{
   uvm_tlm_analysis_fifo #(uvma_cvmcu_event_seq_item_c)  agent_fifo; ///< Input Port for Sequence Items from CORE Agent.
   uvm_tlm_analysis_fifo #(uvma_cvmcu_event_mon_trn_c )  e2e_fifo  ; ///< Input Port for Monitor Transactions from CORE Agent.
   /// @}

   /// @name Ports
   /// @{
   uvm_analysis_port #(uvma_cvmcu_event_mon_trn_c )  agent_ap; ///< Output Port for Monitor Transactions for Agent Scoreboard Expected.
   uvm_analysis_port #(uvma_cvmcu_event_mon_trn_c )  e2e_ap  ; ///< Output Port for Monitor Transactions for end-to-end Scoreboard Expected.
   /// @}


   `uvm_component_utils(uvme_cvmcu_event_st_prd_c)


   /**
    * Default constructor.
    */
   function new(string name="uvme_cvmcu_event_st_prd", uvm_component parent=null);
      super.new(name, parent);
   endfunction

   /**
    * Creates TLM FIFOs.
    */
   virtual function void create_fifos();
      agent_fifo = new("agent_fifo", this);
      e2e_fifo   = new("e2e_fifo"  , this);
   endfunction

   /**
    * Creates TLM Ports.
    */
   virtual function void create_ports();
      agent_ap = new("agent_ap", this);
      e2e_ap   = new("e2e_ap"  , this);
   endfunction

   /**
    *
    */
   virtual task predict();
      fork
         predict_agent();
         predict_e2e  ();
      join
   endtask

   /**
    * TODO Describe uvme_cvmcu_event_st_prd_c::predict_agent()
    */
   task predict_agent();
      uvma_cvmcu_event_seq_item_c  in_trn ;
      uvma_cvmcu_event_mon_trn_c   out_trn;
      forever begin
         `uvmx_prd_get(agent_fifo, in_trn)
         out_trn = uvma_cvmcu_event_mon_trn_c::type_id::create("out_trn");
         out_trn.from(in_trn);
         out_trn.data_size = in_trn.data_size;
         out_trn.data      = new[in_trn.data_size];
         foreach (out_trn.data[ii]) begin
            out_trn.data[ii] = in_trn.data[ii];
         end
         `uvmx_prd_send(agent_ap, out_trn)
      end
   endtask

   /**
    * TODO Describe uvme_cvmcu_event_st_prd_c::predict_e2e()
    */
   task predict_e2e();
      uvma_cvmcu_event_mon_trn_c  in_trn, out_trn;
      forever begin
         `uvmx_prd_get(e2e_fifo, in_trn)
         out_trn = uvma_cvmcu_event_mon_trn_c::type_id::create("out_trn");
         out_trn.copy(in_trn);
         `uvmx_prd_send(e2e_ap, out_trn)
      end
   endtask

endclass : uvme_cvmcu_event_st_prd_c


`endif // __UVME_CVMCU_EVENT_ST_PRD_SV__