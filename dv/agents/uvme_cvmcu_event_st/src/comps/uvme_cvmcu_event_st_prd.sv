// Copyright 2023 Datum Technology Corporation
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
   uvm_tlm_analysis_fifo #(uvma_cvmcu_event_seq_item_c)  core_fifo; ///< FIFO of Sequence Items from CORE Agent.
   uvm_tlm_analysis_fifo #(uvma_cvmcu_event_seq_item_c)  sys_fifo; ///< FIFO of Sequence Items from SYS Agent.
   uvm_tlm_analysis_fifo #(uvma_cvmcu_event_mon_trn_c )  c2s_fifo; ///< FIFO of Sequence Items from C2s Agent.
   uvm_tlm_analysis_fifo #(uvma_cvmcu_event_mon_trn_c )  s2c_fifo; ///< FIFO of Sequence Items from S2c Agent.
   /// @}

   /// @name Ports
   /// @{
   uvm_analysis_port #(uvma_cvmcu_event_mon_trn_c )  core_ap; ///< Output Port for Monitor Transactions for CORE Scoreboard Expected.
   uvm_analysis_port #(uvma_cvmcu_event_mon_trn_c )  sys_ap; ///< Output Port for Monitor Transactions for SYS Scoreboard Expected.
   uvm_analysis_port #(uvma_cvmcu_event_mon_trn_c )  c2s_ap; ///< Output Port for Monitor Transactions for C2s Scoreboard Expected.
   uvm_analysis_port #(uvma_cvmcu_event_mon_trn_c )  s2c_ap; ///< Output Port for Monitor Transactions for S2c Scoreboard Expected.
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
      core_fifo = new("core_fifo", this);
      sys_fifo = new("sys_fifo", this);
      c2s_fifo = new("c2s_fifo", this);
      s2c_fifo = new("s2c_fifo", this);
      endfunction

   /**
    * Creates TLM Ports.
    */
   virtual function void create_ports();
      core_ap = new("core_ap", this);
      sys_ap = new("sys_ap", this);
      c2s_ap = new("c2s_ap", this);
      s2c_ap = new("s2c_ap", this);
      endfunction

   /**
    * Starts prediction threads.
    */
   virtual task predict();
      fork
         predict_core();
         predict_sys();
         predict_c2s();
         predict_s2c();
      join
   endtask

   /**
    * TODO Describe uvme_cvmcu_event_st_prd_c::predict_core()
    */
   task predict_core();
      uvma_cvmcu_event_seq_item_c  in_trn ;
      uvma_cvmcu_event_mon_trn_c   out_trn;
      forever begin
         `uvmx_prd_get(core_fifo, in_trn)
         out_trn = uvma_cvmcu_event_mon_trn_c::type_id::create("out_trn");
         out_trn.copy(in_trn);
         `uvmx_prd_send(core_ap, out_trn)
      end
   endtask

   /**
    * TODO Describe uvme_cvmcu_event_st_prd_c::predict_sys()
    */
   task predict_sys();
      uvma_cvmcu_event_seq_item_c  in_item;
      uvma_cvmcu_event_mon_trn_c   out_trn;
      forever begin
         `uvmx_prd_get(sys_fifo, in_item)
         out_trn = uvma_cvmcu_event_mon_trn_c::type_id::create("out_trn");
         out_trn.copy(in_item);
         `uvmx_prd_send(sys_ap, out_trn)
      end
   endtask

   /**
    * TODO Describe uvme_cvmcu_event_st_prd_c::predict_c2s()
    */
   task predict_c2s();
      uvma_cvmcu_event_mon_trn_c  in_trn, out_trn;
      forever begin
         `uvmx_prd_get(c2s_fifo, in_trn)
         out_trn = uvma_cvmcu_event_mon_trn_c::type_id::create("out_trn");
         out_trn.copy(in_trn);
         `uvmx_prd_send(c2s_ap, out_trn)
      end
   endtask

   /**
    * TODO Describe uvme_cvmcu_event_st_prd_c::predict_s2c()
    */
   task predict_s2c();
      uvma_cvmcu_event_mon_trn_c  in_trn, out_trn;
      forever begin
         `uvmx_prd_get(s2c_fifo, in_trn)
         out_trn = uvma_cvmcu_event_mon_trn_c::type_id::create("out_trn");
         out_trn.copy(in_trn);
         `uvmx_prd_send(s2c_ap, out_trn)
      end
   endtask


endclass


`endif // __UVME_CVMCU_EVENT_ST_PRD_SV__