// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// This file contains sample code that demonstrates how to add an instance of the CORE-V-MCU
// Sub-System UVM Environment to another UVM environment.
// NOTE: It is recommended to split up class member declaration and definition; these classes are all inline to keep
//       the example short.


`ifndef __UVME_EXAMPLE_ENV_CFG_SV__
`define __UVME_EXAMPLE_ENV_CFG_SV__


/**
 * Object encapsulating all configuration information for uvme_example_env_c.
 */
class uvme_example_env_cfg_c extends uvmx_env_cfg_c;

   rand uvme_cvmcu_chip_cfg_c  cvmcu_chip_cfg; ///< Handle to cvmcu_chip environment configuration

   `uvm_object_utils_begin(uvme_example_env_cfg_c)
      `uvm_field_object(cvmcu_chip_cfg, UVM_DEFAULT)
   `uvm_object_utils_end

   /**
    * Rules for safe default options
    */
   constraint defaults_cons {
      soft cvmcu_chip_cfg.enabled == 1;
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
      cvmcu_chip_cfg = uvme_cvmcu_chip_cfg_c::type_id::create("cvmcu_chip_cfg");
   endfunction

endclass : uvme_example_env_cfg_c


`endif // __UVME_EXAMPLE_ENV_CFG_SV__


`ifndef __UVME_EXAMPLE_ENV_CNTXT_SV__
`define __UVME_EXAMPLE_ENV_CNTXT_SV__


/**
 * Object encapsulating all state variables for uvme_example_env_c.
 */
class uvme_example_env_cntxt_c extends uvmx_env_cntxt_c;

   uvme_cvmcu_chip_cntxt_c  cvmcu_chip_cntxt; ///< Handle to cvmcu_chip environment context

   `uvm_object_utils_begin(uvme_example_env_cntxt_c)
      `uvm_field_object(cvmcu_chip_cntxt, UVM_DEFAULT)
   `uvm_object_utils_end

   /**
    * Creates sub-context objects
    */
   function new(uvm_component parent=null, string name="uvme_example_env_cntxt");
      super.new(parent, name);
      cntxt = uvme_cvmcu_chip_cntxt_c::type_id::create("cvmcu_chip_cntxt");
   endfunction

   /**
    * Creates sub-context objects
    */
   virtual function void create_objects();
      cvmcu_chip_cntxt = uvme_cvmcu_chip_cntxt_c::type_id::create("cvmcu_chip_cntxt");
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
   .T_VSQR     (uvme_example_env_vsqr_c     ),
   .T_PRD      (uvme_example_env_prd_c      ),
   .T_SB       (uvme_example_env_sb_c       ),
   .T_COV_MODEL(uvme_example_env_cov_model_c)
);

   uvme_cvmcu_chip_env_c  cvmcu_chip_env; ///< CORE-V MCU environment instance.

   `uvm_component_utils_begin(uvme_example_env_c)
   `uvm_component_utils_end

   /**
    * Default constructor.
    */
   function new(uvm_component parent=null, string name="uvme_example_env");
      super.new(parent, name);
   endfunction

   virtual function void assign_cfg();
      uvm_config_db#(uvme_cvmcu_chip_cfg_c)::set(this, "cvmcu_chip_env", "cfg", cfg.cvmcu_chip_cfg);
   endfunction

   virtual function void assign_cntxt();
      uvm_config_db#(uvme_cvmcu_chip_cntxt_c)::set(this, "cvmcu_chip_env", "cntxt", cfg.cvmcu_chip_cntxt);
   endfunction

   virtual function void create_envs();
      cvmcu_chip_env = uvme_cvmcu_chip_env_c::type_id::create("cvmcu_chip_env", this);
   endfunction

endclass : uvme_example_env_c


`endif // __UVME_EXAMPLE_ENV_SV__