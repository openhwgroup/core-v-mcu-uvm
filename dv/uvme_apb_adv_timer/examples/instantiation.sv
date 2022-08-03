// Copyright 2022 Datum Technology Corporation
// Copyright 2022 Low Power Futures
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// This file contains sample code that demonstrates how to add an instance of the CORE-V MCU APB Advanced Timer
// Sub-System UVM Environment to another UVM environment.
// NOTE: It is recommended to split up class member declaration and definition; these classes are all inline to keep
//       the example short.


`ifndef __MY_ENV_CFG_SV__
`define __MY_ENV_CFG_SV__


/**
 * Object encapsulating all configuration information for my_env.
 */
class my_env_cfg_c extends uvm_object;

   rand uvme_apb_adv_timer_cfg_c  apb_adv_timer_cfg; ///< Handle to apb_adv_timer environment configuration

   `uvm_object_utils_begin(my_env_cfg_c)
      `uvm_field_object(apb_adv_timer_cfg, UVM_DEFAULT)
   `uvm_object_utils_end

   /**
    * Rules for safe default options
    */
   constraint defaults_cons {
      soft apb_adv_timer_cfg.enabled == 1;
   }

   /**
    * Creates sub-configuration objects
    */
   function new(uvm_component parent=null, string name="my_env");
      super.new(parent, name);
      cfg = uvme_apb_adv_timer_cfg_c::type_id::create("apb_adv_timer_cfg");
   endfunction : new

endclass : my_env_cfg_c


`endif // __MY_ENV_CFG_SV__


`ifndef __MY_ENV_CNTXT_SV__
`define __MY_ENV_CNTXT_SV__


/**
 * Object encapsulating all state variables for my_env.
 */
class my_env_cntxt_c extends uvm_object;

   uvme_apb_adv_timer_cntxt_c  apb_adv_timer_cntxt; ///< Handle to apb_adv_timer environment context

   `uvm_object_utils_begin(my_env_cntxt_c)
      `uvm_field_object(apb_adv_timer_cntxt, UVM_DEFAULT)
   `uvm_object_utils_end

   /**
    * Creates sub-context objects
    */
   function new(uvm_component parent=null, string name="my_env");
      super.new(parent, name);
      cntxt = uvme_apb_adv_timer_cntxt_c::type_id::create("apb_adv_timer_cntxt");
   endfunction : new

endclass : my_env_cntxt_c


`endif // __MY_ENV_CNTXT_SV__


`ifndef __MY_ENV_SV__
`define __MY_ENV_SV__


/**
 * Component encapsulating the environment.
 */
class my_env_c extends uvm_env;

   my_env_cfg_c    cfg  ; ///< Configuration handle.  Must be provided by component instantiating this environment.
   my_env_cntxt_c  cntxt; ///< Context handle.  Can be provided by component instantiating this environment.
   uvme_apb_adv_timer_env_c  apb_adv_timer_env; ///< CORE-V MCU APB Advanced Timer environment instance.

   `uvm_component_utils_begin(my_env_c)
      `uvm_field_object(cfg  , UVM_DEFAULT)
      `uvm_field_object(cntxt, UVM_DEFAULT)
   `uvm_component_utils_end

   /**
    * Default constructor.
    */
   function new(uvm_component parent=null, string name="my_env");
      super.new(parent, name);
   endfunction : new

   /**
    * 1. Ensures #cfg & #cntxt handles are not null
    * 2. Assigns #cfg and #cntxt handles
    * 3. Creates #apb_adv_timer_env
    */
   virtual function void build_phase(uvm_phase phase);
      super.build_phase(phase);

      void'(uvm_config_db#(my_env_cfg_c)::get(this, "", "cfg", cfg));
      if (!cfg) begin
         `uvm_fatal("MY_ENV", "Configuration handle is null")
      end
      else begin
         `uvm_info("MY_ENV", $sformatf("Found configuration handle:\n%s", cfg.sprint()), UVM_DEBUG)
         void'(uvm_config_db#(my_env_cntxt_c)::get(this, "", "cntxt", cntxt));
         if (!cntxt) begin
            `uvm_info("MY_ENV", "Context handle is null; creating.", UVM_DEBUG)
            cntxt = my_env_cntxt_c::type_id::create("cntxt");
         end
         uvm_config_db#(my_env_cfg_c  )::set(this, "*", "cfg"  , cfg  );
         uvm_config_db#(my_env_cntxt_c)::set(this, "*", "cntxt", cntxt);
         uvm_config_db#(uvme_apb_adv_timer_cfg_c  )::set(this, "apb_adv_timer_env", "cfg"  , cfg  .apb_adv_timer_cfg  );
         uvm_config_db#(uvme_apb_adv_timer_cntxt_c)::set(this, "apb_adv_timer_env", "cntxt", cntxt.apb_adv_timer_cntxt);
         apb_adv_timer_env = uvme_apb_adv_timer_env_c::type_id::create("apb_adv_timer_env", this);
         end
      end
   endfunction : build_phase

endclass : my_env_c


`endif // __MY_ENV_SV__
