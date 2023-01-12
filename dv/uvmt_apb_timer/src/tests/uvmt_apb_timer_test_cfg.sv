// Copyright 2022-2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_APB_TIMER_TEST_CFG_SV__
`define __UVMT_APB_TIMER_TEST_CFG_SV__


/**
 * Object encapsulating common configuration parameters for APB Timer Sub-System tests.
 * @ingroup uvmt_apb_timer_tests
 */
class uvmt_apb_timer_test_cfg_c extends uvmx_test_cfg_c #(
   .T_REG_MODEL(uvme_apb_timer_reg_block_c)
);

   /// @name Integrals
   /// @{
   rand int unsigned          sys_clk_frequency; ///<
   rand uvmx_reset_type_enum  reset_type   ; ///<
   /// @}

   /// @name Command line arguments
   /// @{
   bit           cli_num_items_override; ///< Set to '1' if argument was found for num_items
   int unsigned  cli_num_items         ; ///< Parsed integer value from the CLI for num_items
   /// @}

   /// @name Objects
   /// @{
   rand uvma_clk_cfg_c    sys_clk_agent_cfg; ///<
   rand uvma_reset_cfg_c  sys_reset_agent_cfg; ///<
   /// @}


   `uvm_object_utils_begin(uvmt_apb_timer_test_cfg_c)
      `uvm_field_int   (                      sys_clk_frequency, UVM_DEFAULT + UVM_DEC)
      `uvm_field_enum  (uvmx_reset_type_enum, reset_type   , UVM_DEFAULT          )
      `uvm_field_int   (auto_ral_update         , UVM_DEFAULT          )
      `uvm_field_int   (trn_log_enabled         , UVM_DEFAULT          )
      `uvm_field_int   (cov_model_enabled       , UVM_DEFAULT          )
      `uvm_field_int   (startup_timeout         , UVM_DEFAULT + UVM_DEC)
      `uvm_field_int   (heartbeat_period        , UVM_DEFAULT + UVM_DEC)
      `uvm_field_int   (heartbeat_refresh_period, UVM_DEFAULT + UVM_DEC)
      `uvm_field_int   (simulation_timeout      , UVM_DEFAULT + UVM_DEC)
      `uvm_field_int   (cli_num_items_override  , UVM_DEFAULT          )
      `uvm_field_int   (cli_num_items           , UVM_DEFAULT + UVM_DEC)
      `uvm_field_int   (cli_block_name_override , UVM_DEFAULT          )
      `uvm_field_string(cli_block_name          , UVM_DEFAULT          )
      `uvm_field_object(sys_clk_agent_cfg, UVM_DEFAULT)
      `uvm_field_object(sys_reset_agent_cfg, UVM_DEFAULT)
      `uvm_field_object(selected_reg_block, UVM_DEFAULT)
      `uvm_field_object(reg_model, UVM_DEFAULT + UVM_NOPRINT)
   `uvm_object_utils_end


   /**
    * Sets safe defaults for all simulation timing parameters.
    */
   constraint defaults_cons {
      sys_clk_frequency == uvmt_apb_timer_default_sys_clk_frequency;
      reset_type               == UVMX_RESET_SYNC                                 ;
      startup_timeout          == uvmt_apb_timer_default_startup_timeout         ;
      heartbeat_period         == uvmt_apb_timer_default_heartbeat_period        ;
      heartbeat_refresh_period == uvmt_apb_timer_default_heartbeat_refresh_period;
      simulation_timeout       == uvmt_apb_timer_default_simulation_timeout      ;
      soft auto_ral_update     == 1;
   }

   /**
    * Describe rules_cons
    */
   constraint rules_cons {
      sys_reset_agent_cfg.reset_type == reset_type;
      sys_reset_agent_cfg.reset_type == reset_type;
      sys_clk_agent_cfg.enabled == 1;
      sys_reset_agent_cfg.enabled == 1;
      sys_clk_agent_cfg.is_active == UVM_ACTIVE;
      sys_reset_agent_cfg.is_active == UVM_ACTIVE;
      sys_clk_agent_cfg.trn_log_enabled == trn_log_enabled;
      sys_reset_agent_cfg.trn_log_enabled == trn_log_enabled;
      sys_clk_agent_cfg.cov_model_enabled == 0;
      sys_reset_agent_cfg.cov_model_enabled == 0;
   }

   /**
    * Default constructor.
    */
   function new(string name="uvmt_apb_timer_test_cfg");
      super.new(name);
   endfunction


   /**
    *
    */
   virtual function void create_objects();
      sys_clk_agent_cfg = uvma_clk_cfg_c::type_id::create("sys_clk_agent_cfg");
      sys_reset_agent_cfg = uvma_reset_cfg_c::type_id::create("sys_reset_agent_cfg");
   endfunction

   /**
    * Processes command line interface arguments.
    */
   virtual function void process_cli_args();
      string  cli_num_items_str  = "";
      cli_num_items_override = 0;
      if (uvm_cmdline_proc.get_arg_value("NUM_ITEMS=", cli_num_items_str)) begin
         if (cli_num_items_str != "") begin
            cli_num_items_override = 1;
            cli_num_items = cli_num_items_str.atoi();
         end
      end
   endfunction

endclass : uvmt_apb_timer_test_cfg_c


`endif // __UVMT_APB_TIMER_TEST_CFG_SV__
