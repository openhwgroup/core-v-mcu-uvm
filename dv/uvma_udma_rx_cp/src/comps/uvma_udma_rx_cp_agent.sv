// Copyright 2022 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_UDMA_RX_CP_AGENT_SV__
`define __UVMA_UDMA_RX_CP_AGENT_SV__


/**
 * Top-level component that encapsulates, builds and connects all others to implement the uDMA Rx Channels Block Control Plane UVM Agent.
 * Capable of driving/monitoring uDMA Rx Channels Block Control Plane virtual interface.
 * @ingroup uvma_udma_rx_cp_comps
 */
class uvma_udma_rx_cp_agent_c extends uvml_agent_c;

   /// @defgroup Objects
   /// @{
   uvma_udma_rx_cp_cfg_c    cfg  ; ///< Configuration handle.  Must be provided by component instantiating this agent.
   uvma_udma_rx_cp_cntxt_c  cntxt; ///< Context handle.  Can be provided by component instantiating this agent.
   /// @}

   /// @defgroup Components
   /// @{
   uvma_udma_rx_cp_sqr_c        sequencer; ///< Provides sequence items for #driver.
   uvma_udma_rx_cp_drv_c        driver   ; ///< Drives the virtual interface with stimulus obtained from the #sequencer.
   uvma_udma_rx_cp_mon_c        monitor  ; ///< Samples transactions from the virtual interface.
   uvma_udma_rx_cp_cov_model_c  cov_model; ///< Functional coverage model sampling #cfg, #cntxt and transactions.
   uvma_udma_rx_cp_logger_c     logger   ; ///< Transaction logger for #driver and #monitor.
   /// @}

   /// @defgroup TLM
   /// @{
   uvm_analysis_port #(uvma_udma_rx_cp_seq_item_c)  drv_ap; ///< Port from #driver for stimulus transactions.
   uvm_analysis_port #(uvma_udma_rx_cp_mon_trn_c )  mon_ap; ///< Port from #monitor for sampled transactions.
   /// @}


   `uvm_component_utils_begin(uvma_udma_rx_cp_agent_c)
      `uvm_field_object(cfg  , UVM_DEFAULT)
      `uvm_field_object(cntxt, UVM_DEFAULT)
   `uvm_component_utils_end


   /**
    * Default constructor.
    */
   extern function new(string name="uvma_udma_rx_cp_agent", uvm_component parent=null);

   /**
    * 1. Ensures #cfg & #cntxt handles are not null
    * 2. Builds all components
    */
   extern virtual function void build_phase(uvm_phase phase);

   /**
    * 1. Links agent's analysis ports to sub-components'
    * 2. Connects #cov_model and #logger
    */
   extern virtual function void connect_phase(uvm_phase phase);

   /**
    * Uses uvm_config_db to retrieve #cfg and hand out to sub-components.
    */
   extern function void get_and_set_cfg();

   /**
    * Uses uvm_config_db to retrieve #cntxt and hand out to sub-components.
    */
   extern function void get_and_set_cntxt();

   /**
    * Uses uvm_config_db to retrieve the virtual interface associated with this agent.
    */
   extern function void retrieve_vif();

   /**
    * Creates sub-components.
    */
   extern function void create_components();

   /**
    * Connects #sequencer and #driver's TLM port(s).
    */
   extern function void connect_sequencer_and_driver();

   /**
    * Connects agent's TLM ports to #driver's and #monitor's.
    */
   extern function void connect_analysis_ports();

   /**
    * Connects #cov_model to #monitor and #driver's analysis ports.
    */
   extern function void connect_cov_model();

   /**
    * Connects #logger to #monitor and #driver's analysis ports.
    */
   extern function void connect_trn_loggers();

endclass : uvma_udma_rx_cp_agent_c


function uvma_udma_rx_cp_agent_c::new(string name="uvma_udma_rx_cp_agent", uvm_component parent=null);

   super.new(name, parent);

endfunction : new


function void uvma_udma_rx_cp_agent_c::build_phase(uvm_phase phase);

   super.build_phase(phase);
   get_and_set_cfg  ();
   get_and_set_cntxt();
   retrieve_vif     ();
   create_components();

endfunction : build_phase


function void uvma_udma_rx_cp_agent_c::connect_phase(uvm_phase phase);

   super.connect_phase(phase);
   connect_sequencer_and_driver();
   connect_analysis_ports      ();
   if (cfg.cov_model_enabled) begin
      connect_cov_model();
   end
   if (cfg.trn_log_enabled) begin
      connect_trn_loggers();
   end

endfunction: connect_phase


function void uvma_udma_rx_cp_agent_c::get_and_set_cfg();

   void'(uvm_config_db#(uvma_udma_rx_cp_cfg_c)::get(this, "", "cfg", cfg));
   if (!cfg) begin
      `uvm_fatal("UDMA_RX_CP_AGENT", "Configuration handle is null")
   end
   else begin
      `uvm_info("UDMA_RX_CP_AGENT", $sformatf("Found configuration handle:\n%s", cfg.sprint()), UVM_DEBUG)
      uvm_config_db#(uvma_udma_rx_cp_cfg_c)::set(this, "*", "cfg", cfg);
   end

endfunction : get_and_set_cfg


function void uvma_udma_rx_cp_agent_c::get_and_set_cntxt();

   void'(uvm_config_db#(uvma_udma_rx_cp_cntxt_c)::get(this, "", "cntxt", cntxt));
   if (!cntxt) begin
      `uvm_info("UDMA_RX_CP_AGENT", "Context handle is null; creating.", UVM_DEBUG)
      cntxt = uvma_udma_rx_cp_cntxt_c::type_id::create("cntxt");
   end
   uvm_config_db#(uvma_udma_rx_cp_cntxt_c)::set(this, "*", "cntxt", cntxt);

endfunction : get_and_set_cntxt


function void uvma_udma_rx_cp_agent_c::retrieve_vif();

   if (!uvm_config_db#(virtual uvma_udma_rx_cp_if)::get(this, "", "vif", cntxt.vif)) begin
      `uvm_fatal("UDMA_RX_CP_AGENT", $sformatf("Could not find vif handle of type %s in uvm_config_db", $typename(cntxt.vif)))
   end
   else begin
      `uvm_info("UDMA_RX_CP_AGENT", $sformatf("Found vif handle of type %s in uvm_config_db", $typename(cntxt.vif)), UVM_DEBUG)
   end

endfunction : retrieve_vif


function void uvma_udma_rx_cp_agent_c::create_components();

   sequencer = uvma_udma_rx_cp_sqr_c      ::type_id::create("sequencer", this);
   driver    = uvma_udma_rx_cp_drv_c      ::type_id::create("driver"   , this);
   monitor   = uvma_udma_rx_cp_mon_c      ::type_id::create("monitor"  , this);
   cov_model = uvma_udma_rx_cp_cov_model_c::type_id::create("cov_model", this);
   logger    = uvma_udma_rx_cp_logger_c   ::type_id::create("logger"   , this);

endfunction : create_components


function void uvma_udma_rx_cp_agent_c::connect_sequencer_and_driver();

   sequencer.set_arbitration(cfg.sqr_arb_mode);
   driver.seq_item_port.connect(sequencer.seq_item_export);

endfunction : connect_sequencer_and_driver


function void uvma_udma_rx_cp_agent_c::connect_analysis_ports();

   drv_ap = driver .ap;
   mon_ap = monitor.ap;

endfunction : connect_analysis_ports


function void uvma_udma_rx_cp_agent_c::connect_cov_model();

   drv_ap.connect(cov_model.seq_item_export);
   mon_ap.connect(cov_model.mon_trn_export );

endfunction : connect_cov_model


function void uvma_udma_rx_cp_agent_c::connect_trn_loggers();

   drv_ap.connect(logger.seq_item_export);
   mon_ap.connect(logger.mon_trn_export );

endfunction : connect_trn_loggers


`endif // __UVMA_UDMA_RX_CP_AGENT_SV__
