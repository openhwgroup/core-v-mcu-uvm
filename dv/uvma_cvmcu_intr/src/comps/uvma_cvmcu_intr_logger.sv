// Copyright 2022 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_INTR_LOGGER_SV__
`define __UVMA_CVMCU_INTR_LOGGER_SV__


/**
 * Component which logs to disk information of the transactions generated and monitored by uvma_cvmcu_intr_agent_c.
 */
class uvma_cvmcu_intr_logger_c extends uvm_component;

   /// @defgroup Objects
   /// @{
   uvma_cvmcu_intr_cfg_c    cfg  ; ///< Agent configuration handle
   uvma_cvmcu_intr_cntxt_c  cntxt; ///< Agent context handle
   /// @}

   /// @defgroup Components
   /// @{
   uvml_logs_metadata_logger_c #(uvma_cvmcu_intr_seq_item_c)  seq_item_logger; ///< Logs sequence items from driver.
   uvml_logs_metadata_logger_c #(uvma_cvmcu_intr_mon_trn_c )  mon_trn_logger ; ///< Logs transactions from monitor.
   /// @}

   /// @defgroup TLM
   /// @{
   uvm_analysis_export #(uvma_cvmcu_intr_seq_item_c)  seq_item_export; ///< Port receiving sequence items
   uvm_analysis_export #(uvma_cvmcu_intr_mon_trn_c )  mon_trn_export ; ///< Port receiving monitored transactions
   /// @}


   `uvm_component_utils_begin(uvma_cvmcu_intr_logger_c)
      `uvm_field_object(cfg  , UVM_DEFAULT)
      `uvm_field_object(cntxt, UVM_DEFAULT)
   `uvm_component_utils_end


   /**
    * Default constructor.
    */
   extern function new(string name="uvma_cvmcu_intr_logger", uvm_component parent=null);

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

endclass : uvma_cvmcu_intr_logger_c


function uvma_cvmcu_intr_logger_c::new(string name="uvma_cvmcu_intr_logger", uvm_component parent=null);

   super.new(name, parent);

endfunction : new


function void uvma_cvmcu_intr_logger_c::build_phase(uvm_phase phase);

   super.build_phase(phase);

   void'(uvm_config_db#(uvma_cvmcu_intr_cfg_c)::get(this, "", "cfg", cfg));
   if (cfg == null) begin
      `uvm_fatal("CVMCU_INTR_LOGGER", "Configuration handle is null")
   end

   void'(uvm_config_db#(uvma_cvmcu_intr_cntxt_c)::get(this, "", "cntxt", cntxt));
   if (cntxt == null) begin
      `uvm_fatal("CVMCU_INTR_LOGGER", "Context handle is null")
   end

   // Create components
   seq_item_logger = uvml_logs_metadata_logger_c #(uvma_cvmcu_intr_seq_item_c)::type_id::create("seq_item_logger", this);
   mon_trn_logger  = uvml_logs_metadata_logger_c #(uvma_cvmcu_intr_mon_trn_c )::type_id::create("mon_trn_logger" , this);

endfunction : build_phase


function void uvma_cvmcu_intr_logger_c::connect_phase(uvm_phase phase);

   super.connect_phase(phase);

   seq_item_logger.set_file_name({get_parent().get_full_name(), ".seq_item"});
   mon_trn_logger .set_file_name({get_parent().get_full_name(), ".mon_trn" });

   seq_item_export = seq_item_logger.analysis_export;
   mon_trn_export  = mon_trn_logger .analysis_export;

endfunction : connect_phase


`endif // __UVMA_CVMCU_INTR_LOGGER_SV__
