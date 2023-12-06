// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_EVENT_LOGGER_SV__
`define __UVMA_CVMCU_EVENT_LOGGER_SV__


/**
 * Component which logs to disk information of the transactions generated and monitored by uvma_cvmcu_event_agent_c.
 * @ingroup uvma_cvmcu_event_comps
 */
class uvma_cvmcu_event_logger_c extends uvmx_agent_logger_c #(
   .T_CFG     (uvma_cvmcu_event_cfg_c     ),
   .T_CNTXT   (uvma_cvmcu_event_cntxt_c   ),
   .T_SEQ_ITEM(uvma_cvmcu_event_seq_item_c)
);

   /// @name Loggers
   /// @{
   uvmx_tlm_logger_c #(uvma_cvmcu_event_mon_trn_c )  c2s_mon_trn_logger; ///< Logs C2s Monitor Transactions from vsequencer.
   uvmx_tlm_logger_c #(uvma_cvmcu_event_mon_trn_c )  s2c_mon_trn_logger; ///< Logs S2c Monitor Transactions from vsequencer.
   uvmx_tlm_logger_c #(uvma_cvmcu_event_core_phy_seq_item_c)  core_phy_seq_item_logger; ///< Logs PHY Sequence Items from CORE Driver.
   uvmx_tlm_logger_c #(uvma_cvmcu_event_sys_phy_seq_item_c)  sys_phy_seq_item_logger; ///< Logs PHY Sequence Items from SYS Driver.
   uvmx_tlm_logger_c #(uvma_cvmcu_event_phy_mon_trn_c)  phy_mon_trn_logger; ///< Logs PHY Monitor Transactions from Monitor.
   /// @}


   `uvm_component_utils(uvma_cvmcu_event_logger_c)


   /**
    * Default constructor.
    */
   function new(string name="uvma_cvmcu_event_logger", uvm_component parent=null);
      super.new(name, parent);
   endfunction

   /**
    * Creates logger components.
    */
   virtual function void create_loggers();
      c2s_mon_trn_logger  = uvmx_tlm_logger_c #(uvma_cvmcu_event_mon_trn_c )::type_id::create("c2s_mon_trn_logger", this);
      s2c_mon_trn_logger  = uvmx_tlm_logger_c #(uvma_cvmcu_event_mon_trn_c )::type_id::create("s2c_mon_trn_logger", this);
      phy_mon_trn_logger = uvmx_tlm_logger_c #(uvma_cvmcu_event_phy_mon_trn_c)::type_id::create("phy_mon_trn_logger", this);
      core_phy_seq_item_logger = uvmx_tlm_logger_c #(uvma_cvmcu_event_core_phy_seq_item_c)::type_id::create("core_phy_seq_item_logger", this);
      sys_phy_seq_item_logger = uvmx_tlm_logger_c #(uvma_cvmcu_event_sys_phy_seq_item_c)::type_id::create("sys_phy_seq_item_logger", this);
   endfunction

   /**
    * Sets filenames for logger components.
    */
   virtual function void configure_loggers();
      c2s_mon_trn_logger.set_filename("c2s_mon_trn");
      s2c_mon_trn_logger.set_filename("s2c_mon_trn");
      phy_mon_trn_logger.set_filename("phy.mon_trn");
      core_phy_seq_item_logger.set_filename("core_phy.seq_item");
      sys_phy_seq_item_logger.set_filename("sys_phy.seq_item");
   endfunction

endclass


`endif // __UVMA_CVMCU_EVENT_LOGGER_SV__