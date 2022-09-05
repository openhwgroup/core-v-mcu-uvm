// Copyright 2022 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_UDMA_RX_DP_OUT_LOGGER_SV__
`define __UVMA_UDMA_RX_DP_OUT_LOGGER_SV__


/**
 * Component which logs to disk information of the transactions generated and monitored by uvma_udma_rx_dp_out_agent_c.
 * @ingroup uvma_udma_rx_dp_out_comps
 */
class uvma_udma_rx_dp_out_logger_c extends uvm_component;

   /// @name Objects
   /// @{
   uvma_udma_rx_dp_out_cfg_c    cfg  ; ///< Agent configuration handle
   uvma_udma_rx_dp_out_cntxt_c  cntxt; ///< Agent context handle
   /// @}

   /// @name Components
   /// @{
   uvml_logs_metadata_logger_c #(uvma_udma_rx_dp_out_seq_item_c)  seq_item_logger; ///< Logs sequence items from driver.
   uvml_logs_metadata_logger_c #(uvma_udma_rx_dp_out_mon_trn_c )  mon_trn_logger ; ///< Logs transactions from monitor.
   /// @}

   /// @name TLM
   /// @{
   uvm_analysis_export #(uvma_udma_rx_dp_out_seq_item_c)  seq_item_export; ///< Port receiving sequence items
   uvm_analysis_export #(uvma_udma_rx_dp_out_mon_trn_c )  mon_trn_export ; ///< Port receiving monitored transactions
   /// @}


   `uvm_component_utils_begin(uvma_udma_rx_dp_out_logger_c)
      `uvm_field_object(cfg  , UVM_DEFAULT)
      `uvm_field_object(cntxt, UVM_DEFAULT)
   `uvm_component_utils_end


   /**
    * Default constructor.
    */
   extern function new(string name="uvma_udma_rx_dp_out_logger", uvm_component parent=null);

   /**
    * 1. Ensures #cfg & #cntxt handles are not null
    * 2. Builds logger components (#seq_item_logger and #mon_trn_logger)
    */
   extern virtual function void build_phase(uvm_phase phase);

   /**
    * 1. Sets log filenames.
    * 2. Connects #seq_item_export & #mon_trn_export to seq_item_logger & mon_trn_logger, respectively.
    */
   extern virtual function void connect_phase(uvm_phase phase);

   /**
    * Uses uvm_config_db to retrieve cfg.
    */
   extern function void get_cfg();

   /**
    * Uses uvm_config_db to retrieve cntxt.
    */
   extern function void get_cntxt();

   /**
    * Creates logger components.
    */
   extern function void create_components();

   /**
    * Sets filenames for logger components.
    */
   extern function void configure_loggers();

   /**
    * Connects TLM ports to logger components.
    */
   extern function void connect_loggers();

endclass : uvma_udma_rx_dp_out_logger_c


function uvma_udma_rx_dp_out_logger_c::new(string name="uvma_udma_rx_dp_out_logger", uvm_component parent=null);

   super.new(name, parent);

endfunction : new


function void uvma_udma_rx_dp_out_logger_c::build_phase(uvm_phase phase);

   super.build_phase(phase);
   get_cfg  ();
   get_cntxt();
   create_components();

endfunction : build_phase


function void uvma_udma_rx_dp_out_logger_c::connect_phase(uvm_phase phase);

   super.connect_phase(phase);
   configure_loggers();
   connect_loggers  ();

endfunction : connect_phase


function void uvma_udma_rx_dp_out_logger_c::get_cfg();

   void'(uvm_config_db#(uvma_udma_rx_dp_out_cfg_c)::get(this, "", "cfg", cfg));
   if (cfg == null) begin
      `uvm_fatal("UDMA_RX_DP_OUT_LOGGER", "Configuration handle is null")
   end

endfunction : get_cfg


function void uvma_udma_rx_dp_out_logger_c::get_cntxt();

   void'(uvm_config_db#(uvma_udma_rx_dp_out_cntxt_c)::get(this, "", "cntxt", cntxt));
   if (cntxt == null) begin
      `uvm_fatal("UDMA_RX_DP_OUT_LOGGER", "Context handle is null")
   end

endfunction : get_cntxt


function void uvma_udma_rx_dp_out_logger_c::create_components();

   seq_item_logger = uvml_logs_metadata_logger_c #(uvma_udma_rx_dp_out_seq_item_c)::type_id::create("seq_item_logger", this);
   mon_trn_logger  = uvml_logs_metadata_logger_c #(uvma_udma_rx_dp_out_mon_trn_c )::type_id::create("mon_trn_logger" , this);

endfunction : create_components


function void uvma_udma_rx_dp_out_logger_c::configure_loggers();

   seq_item_logger.set_file_name({get_parent().get_full_name(), ".seq_item"});
   mon_trn_logger .set_file_name({get_parent().get_full_name(), ".mon_trn" });

endfunction : configure_loggers


function void uvma_udma_rx_dp_out_logger_c::connect_loggers();

   seq_item_export = seq_item_logger.analysis_export;
   mon_trn_export  = mon_trn_logger .analysis_export;

endfunction : connect_loggers


`endif // __UVMA_UDMA_RX_DP_OUT_LOGGER_SV__
