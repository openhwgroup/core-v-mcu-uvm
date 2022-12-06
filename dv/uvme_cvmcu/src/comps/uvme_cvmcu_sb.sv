// Copyright 2022 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_SB_SV__
`define __UVME_CVMCU_SB_SV__


/**
 * Component encapsulating scoreboards which compare CORE-V MCU Sub-System's expected (from predictor) vs. actual (monitored) transactions.
 * @ingroup uvme_cvmcu_comps
 */
class uvme_cvmcu_sb_c extends uvmx_sb_c #(
   .T_CFG  (uvme_cvmcu_cfg_c  ),
   .T_CNTXT(uvme_cvmcu_cntxt_c)
);

   /// @name Components
   /// @{
   // TODO Add sub-scoreboards
   //      Ex: uvml_sb_simplex_c  sb_egress ; ///< Describe me!
   //          uvml_sb_simplex_c  sb_ingress; ///< Describe me!
   /// @}


   `uvm_component_utils_begin(uvme_cvmcu_sb_c)
      `uvm_field_object(cfg  , UVM_DEFAULT)
      `uvm_field_object(cntxt, UVM_DEFAULT)
   `uvm_component_utils_end


   /**
    * Default constructor.
    */
   function new(string name="uvme_cvmcu_sb", uvm_component parent=null);
      super.new(name, parent);
   endfunction

   /**
    * Assigns configuration handles.
    */
   virtual function void assign_cfg();
      // TODO Implement uvme_cvmcu_sb_c::assign_cfg()
      //      Ex: uvm_config_db#(uvml_sb_simplex_cfg_c)::set(this, "sb_egress" , "cfg", cfg.sb_egress_cfg );
      //          uvm_config_db#(uvml_sb_simplex_cfg_c)::set(this, "sb_ingress", "cfg", cfg.sb_ingress_cfg);
   endfunction

   /**
    * Assigns context handles.
    */
   virtual function void assign_cntxt();
      // TODO Implement uvme_cvmcu_sb_c::assign_cntxt()
      //      Ex: uvm_config_db#(uvml_sb_simplex_cntxt_c)::set(this, "sb_egress" , "cntxt", cntxt.sb_egress_cntxt );
      //          uvm_config_db#(uvml_sb_simplex_cntxt_c)::set(this, "sb_ingress", "cntxt", cntxt.sb_ingress_cntxt);
   endfunction

   /**
    * Creates scoreboard components.
    */
   virtual function void create_components();
      // TODO Implement uvme_cvmcu_sb_c::create_sbs()
      //      Ex: sb_egress  = uvml_sb_simplex_c::type_id::create("sb_egress" , this);
      //          sb_ingress = uvml_sb_simplex_c::type_id::create("sb_ingress", this);
   endfunction

endclass : uvme_cvmcu_sb_c


`endif // __UVME_CVMCU_SB_SV__