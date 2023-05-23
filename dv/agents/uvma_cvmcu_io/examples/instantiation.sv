// Copyright 2023 Acme Enterprises
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// This file contains sample code that demonstrates how to add an instance of the CORE-V-MCU IO UVM Agent to an example UVMx environment.
// NOTE: It is recommended to split up classes into separate files.


`ifndef __UVME_EXAMPLE_ENV_CFG_SV__
`define __UVME_EXAMPLE_ENV_CFG_SV__


/**
 * Object encapsulating all configuration information for uvme_example_env_c.
 */
class uvme_example_env_cfg_c extends uvmx_env_cfg_c;

   rand uvma_cvmcu_io_cfg_c  cvmcu_io_cfg; ///< Handle to CORE-V-MCU IO Agent configuration

   `uvm_object_utils_begin(uvme_example_env_cfg_c)
      `uvm_field_object(cvmcu_io_cfg, UVM_DEFAULT)
   `uvm_object_utils_end

   constraint defaults_cons {
      soft cvmcu_io_cfg.enabled == 1;
   }

   function new(uvm_component parent=null, string name="uvme_example_env_cfg");
      super.new(parent, name);
   endfunction

   virtual function void create_objects();
      cvmcu_io_cfg = uvma_cvmcu_io_cfg_c::type_id::create("cvmcu_io_cfg");
   endfunction

endclass : uvme_example_env_cfg_c


`endif // __UVME_EXAMPLE_ENV_CFG_SV__


`ifndef __UVME_EXAMPLE_ENV_CNTXT_SV__
`define __UVME_EXAMPLE_ENV_CNTXT_SV__


/**
 * Object encapsulating all state variables for uvme_example_env_c.
 */
class uvme_example_env_cntxt_c extends uvmx_env_cntxt_c;

   uvma_cvmcu_io_cntxt_c  cvmcu_io_cntxt; ///< Handle to CORE-V-MCU IO Agent context

   `uvm_object_utils_begin(uvme_example_env_cntxt_c)
      `uvm_field_object(cvmcu_io_cntxt, UVM_DEFAULT)
   `uvm_object_utils_end

   function new(uvm_component parent=null, string name="uvme_example_env_cntxt");
      cntxt = uvma_cvmcu_io_cntxt_c::type_id::create("cvmcu_io_cntxt");
   endfunction

   virtual function void create_objects();
      cvmcu_io_cntxt = uvma_cvmcu_io_cntxt_c::type_id::create("cvmcu_io_cntxt");
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

   uvma_cvmcu_io_env_c  cvmcu_io_agent; ///< CORE-V-MCU IO Agent instance.

   `uvm_component_utils(uvme_example_env_c)

   function new(uvm_component parent=null, string name="uvme_example_env");
      super.new(parent, name);
   endfunction

   virtual function void assign_cfg();
      uvm_config_db#(uvma_cvmcu_io_cfg_c)::set(this, "cvmcu_io_agent", "cfg", cfg.cvmcu_io_cfg);
   endfunction

   virtual function void assign_cntxt();
      uvm_config_db#(uvma_cvmcu_io_cntxt_c)::set(this, "cvmcu_io_agent", "cntxt", cfg.cvmcu_io_cntxt);
   endfunction

   virtual function void create_agents();
      cvmcu_io_agent = uvma_cvmcu_io_env_c::type_id::create("cvmcu_io_agent", this);
   endfunction

endclass : uvme_example_env_c


`endif // __UVME_EXAMPLE_ENV_SV__