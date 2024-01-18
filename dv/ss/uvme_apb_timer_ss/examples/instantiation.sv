// Copyright 2024 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// This file contains sample code that demonstrates how to add an instance of the APB simple timer unit Sub-System UVM Environment to another environment.
// NOTE: It is recommended to split up class member declaration and definition; these classes are all inline to keep
//       the example short.


`ifndef __UVME_EXAMPLE_ENV_CFG_SV__
`define __UVME_EXAMPLE_ENV_CFG_SV__


/**
 * Object encapsulating all configuration information for uvme_example_env_c.
 */
class uvme_example_env_cfg_c extends uvmx_env_cfg_c;

   rand uvme_apb_timer_ss_cfg_c  apb_timer_ss_cfg; ///< Handle to apb_timer_ss environment configuration

   `uvm_object_utils_begin(uvme_example_env_cfg_c)
      `uvm_field_object(apb_timer_ss_cfg, UVM_DEFAULT)
   `uvm_object_utils_end

   /**
    * Rules for safe default options
    */
   constraint defaults_cons {
      soft apb_timer_ss_cfg.enabled == 1;
   }

   /**
    * Default constructor.
    */
   function new(uvm_component parent=null, string name="uvme_example_env_cfg");
      super.new(parent, name);
   endfunction

   /**
    * Creates sub-configuration objects
    */
   virtual function void create_objects();
      apb_timer_ss_cfg = uvme_apb_timer_ss_cfg_c::type_id::create("apb_timer_ss_cfg");
   endfunction

endclass : uvme_example_env_cfg_c


`endif // __UVME_EXAMPLE_ENV_CFG_SV__


`ifndef __UVME_EXAMPLE_ENV_CNTXT_SV__
`define __UVME_EXAMPLE_ENV_CNTXT_SV__


/**
 * Object encapsulating all state variables for uvme_example_env_c.
 */
class uvme_example_env_cntxt_c extends uvmx_env_cntxt_c;

   uvme_apb_timer_ss_cntxt_c  apb_timer_ss_cntxt; ///< Handle to apb_timer_ss environment context

   `uvm_object_utils_begin(uvme_example_env_cntxt_c)
      `uvm_field_object(apb_timer_ss_cntxt, UVM_DEFAULT)
   `uvm_object_utils_end

   /**
    * Creates sub-context objects
    */
   function new(uvm_component parent=null, string name="uvme_example_env_cntxt");
      super.new(parent, name);
      cntxt = uvme_apb_timer_ss_cntxt_c::type_id::create("apb_timer_ss_cntxt");
   endfunction

   /**
    * Creates sub-context objects
    */
   virtual function void create_objects();
      apb_timer_ss_cntxt = uvme_apb_timer_ss_cntxt_c::type_id::create("apb_timer_ss_cntxt");
   endfunction

endclass : uvme_example_env_cntxt_c


`endif // __UVME_EXAMPLE_ENV_CNTXT_SV__


`ifndef __UVME_EXAMPLE_ENV_SV__
`define __UVME_EXAMPLE_ENV_SV__


/**
 * Component encapsulating the environment.
 */
class uvme_example_env_c extends uvmx_env_c #(
   .T_CFG      (uvme_example_env_cfg_c      ),
   .T_CNTXT    (uvme_example_env_cntxt_c    ),
   .T_SQR      (uvme_example_env_sqr_c      ),
   .T_PRD      (uvme_example_env_prd_c      ),
   .T_SB       (uvme_example_env_sb_c       ),
   .T_COV_MODEL(uvme_example_env_cov_model_c)
);

   uvme_apb_timer_ss_env_c  apb_timer_ss_env; ///< CORE-V MCU environment instance.

   `uvm_component_utils_begin(uvme_example_env_c)
   `uvm_component_utils_end

   /**
    * Default constructor.
    */
   function new(uvm_component parent=null, string name="uvme_example_env");
      super.new(parent, name);
   endfunction

   virtual function void assign_cfg();
      uvm_config_db#(uvme_apb_timer_ss_cfg_c)::set(this, "apb_timer_ss_env", "cfg", cfg.apb_timer_ss_cfg);
   endfunction

   virtual function void assign_cntxt();
      uvm_config_db#(uvme_apb_timer_ss_cntxt_c)::set(this, "apb_timer_ss_env", "cntxt", cfg.apb_timer_ss_cntxt);
   endfunction

   virtual function void create_envs();
      apb_timer_ss_env = uvme_apb_timer_ss_env_c::type_id::create("apb_timer_ss_env", this);
   endfunction

endclass : uvme_example_env_c


`endif // __UVME_EXAMPLE_ENV_SV__