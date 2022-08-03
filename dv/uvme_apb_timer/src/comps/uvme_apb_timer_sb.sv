// Copyright 2022 Datum Technology Corporation
// Copyright 2022 Low Power Futures
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_APB_TIMER_SB_SV__
`define __UVME_APB_TIMER_SB_SV__


/**
 * Component encapsulating scoreboards which compare CORE-V MCU APB Timer Sub-System's expected (from predictor) vs. actual (monitored) transactions.
 * @ingroup uvme_apb_timer_comps
 */
class uvme_apb_timer_sb_c extends uvm_scoreboard;

   /// @defgroup Objects
   /// @{
   uvme_apb_timer_cfg_c    cfg  ; ///< Environment configuration handle
   uvme_apb_timer_cntxt_c  cntxt; ///< Environment context handle
   /// @}

   /// @defgroup Components
   /// @{
   // TODO Add sub-scoreboards
   //      Ex: uvml_sb_simplex_c  sb_egress ; ///< Describe me!
   //          uvml_sb_simplex_c  sb_ingress; ///< Describe me!
   /// @}


   `uvm_component_utils_begin(uvme_apb_timer_sb_c)
      `uvm_field_object(cfg  , UVM_DEFAULT)
      `uvm_field_object(cntxt, UVM_DEFAULT)
   `uvm_component_utils_end


   /**
    * Default constructor.
    */
   extern function new(string name="uvme_apb_timer_sb", uvm_component parent=null);

   /**
    * Create and configures sub-scoreboards via:
    * 1. assign_cfg()
    * 2. assign_cntxt()
    * 3. create_sbs()
    */
   extern virtual function void build_phase(uvm_phase phase);

   /**
    * Uses uvm_config_db to retrieve cfg.
    */
   extern function void get_cfg();

   /**
    * Uses uvm_config_db to retrieve cntxt.
    */
   extern function void get_cntxt();

   /**
    * Assigns configuration handles.
    */
   extern function void assign_cfg();

   /**
    * Assigns context handles.
    */
   extern function void assign_cntxt();

   /**
    * Creates sub-scoreboard components.
    */
   extern function void create_sbs();

endclass : uvme_apb_timer_sb_c


function uvme_apb_timer_sb_c::new(string name="uvme_apb_timer_sb", uvm_component parent=null);

   super.new(name, parent);

endfunction : new


function void uvme_apb_timer_sb_c::build_phase(uvm_phase phase);

   super.build_phase(phase);
   get_cfg     ();
   get_cntxt   ();
   assign_cfg  ();
   assign_cntxt();
   create_sbs  ();

endfunction : build_phase


function void uvme_apb_timer_sb_c::get_cfg();

   void'(uvm_config_db#(uvme_apb_timer_cfg_c)::get(this, "", "cfg", cfg));
   if (cfg == null) begin
      `uvm_fatal("APB_TIMER_SB", "Configuration handle is null")
   end

endfunction : get_cfg


function void uvme_apb_timer_sb_c::get_cntxt();

   void'(uvm_config_db#(uvme_apb_timer_cntxt_c)::get(this, "", "cntxt", cntxt));
   if (cntxt == null) begin
      `uvm_fatal("APB_TIMER_SB", "Context handle is null")
   end

endfunction : get_cntxt


function void uvme_apb_timer_sb_c::assign_cfg();

   // TODO Implement uvme_apb_timer_sb_c::assign_cfg()
   //      Ex: uvm_config_db#(uvml_sb_simplex_cfg_c)::set(this, "sb_egress" , "cfg", cfg.sb_egress_cfg );
   //          uvm_config_db#(uvml_sb_simplex_cfg_c)::set(this, "sb_ingress", "cfg", cfg.sb_ingress_cfg);

endfunction : assign_cfg


function void uvme_apb_timer_sb_c::assign_cntxt();

   // TODO Implement uvme_apb_timer_sb_c::assign_cntxt()
   //      Ex: uvm_config_db#(uvml_sb_simplex_cntxt_c)::set(this, "sb_egress" , "cntxt", cntxt.sb_egress_cntxt );
   //          uvm_config_db#(uvml_sb_simplex_cntxt_c)::set(this, "sb_ingress", "cntxt", cntxt.sb_ingress_cntxt);

endfunction : assign_cntxt


function void uvme_apb_timer_sb_c::create_sbs();

   // TODO Implement uvme_apb_timer_sb_c::create_sbs()
   //      Ex: sb_egress  = uvml_sb_simplex_c::type_id::create("sb_egress" , this);
   //          sb_ingress = uvml_sb_simplex_c::type_id::create("sb_ingress", this);

endfunction : create_sbs


`endif // __UVME_APB_TIMER_SB_SV__
