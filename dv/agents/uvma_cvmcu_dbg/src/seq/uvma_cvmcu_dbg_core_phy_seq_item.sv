// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_DBG_CORE_PHY_SEQ_ITEM_SV__
`define __UVMA_CVMCU_DBG_CORE_PHY_SEQ_ITEM_SV__


/**
 * Sequence Item created by CORE-V-MCU Debug Interface Virtual Sequences for driving uvma_cvmcu_dbg_core_phy_drv_c.
 * @ingroup uvma_cvmcu_dbg_seq
 */
class uvma_cvmcu_dbg_core_phy_seq_item_c extends uvmx_seq_item_c #(
   .T_CFG  (uvma_cvmcu_dbg_cfg_c  ),
   .T_CNTXT(uvma_cvmcu_dbg_cntxt_c)
);

   /// @name Data
   /// @{
   rand bit  stoptimer_o; ///< Timer stop output
   /// @}


   `uvm_object_utils_begin(uvma_cvmcu_dbg_core_phy_seq_item_c)
      `uvm_field_int(stoptimer_o, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   function new(string name="uvma_cvmcu_dbg_core_phy_seq_item");
      super.new(name);
   endfunction

   /**
    * Describes transaction as metadata for uvml_logs_metadata_logger_c.
    */
   virtual function uvmx_metadata_t get_metadata();
      string stoptimer_o_str;
      stoptimer_o_str = $sformatf("%b", stoptimer_o);
      `uvmx_metadata_field("stoptimer_o", stoptimer_o_str)
   endfunction

endclass : uvma_cvmcu_dbg_core_phy_seq_item_c


`endif // __UVMA_CVMCU_DBG_CORE_PHY_SEQ_ITEM_SV__