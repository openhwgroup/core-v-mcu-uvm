// Copyright 2023 Acme Enterprises
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_DBG_PHY_MON_TRN_SV__
`define __UVMA_CVMCU_DBG_PHY_MON_TRN_SV__


/**
 * PHY Monitor Transaction sampled by monitor (uvma_cvmcu_dbg_phy_mon_c).
 * @ingroup uvma_cvmcu_dbg_obj
 */
class uvma_cvmcu_dbg_phy_mon_trn_c extends uvmx_mon_trn_c #(
   .T_CFG  (uvma_cvmcu_dbg_cfg_c  ),
   .T_CNTXT(uvma_cvmcu_dbg_cntxt_c)
);

   /// @name SYS
   /// @{
   logic  debug_req_i; ///< Request input
   /// @}

   /// @name CORE
   /// @{
   logic  stoptimer_o; ///< Timer stop output
   /// @}


   `uvm_object_utils_begin(uvma_cvmcu_dbg_phy_mon_trn_c)
      `uvm_field_int(debug_req_i, UVM_DEFAULT)
      `uvm_field_int(stoptimer_o, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   function new(string name="uvma_cvmcu_dbg_core_phy_mon_trn");
      super.new(name);
   endfunction

   /**
    * Describes transaction as metadata for uvml_logs_metadata_logger_c.
    */
   virtual function uvmx_metadata_t get_metadata();
      string debug_req_i_str;
      string stoptimer_o_str;
      debug_req_i_str = $sformatf("%b", debug_req_i);
      stoptimer_o_str = $sformatf("%b", stoptimer_o);
      `uvmx_metadata_field("debug_req_i", debug_req_i_str)
      `uvmx_metadata_field("stoptimer_o", stoptimer_o_str)
   endfunction

endclass : uvma_cvmcu_dbg_phy_mon_trn_c


`endif // __UVMA_CVMCU_DBG_PHY_MON_TRN_SV__