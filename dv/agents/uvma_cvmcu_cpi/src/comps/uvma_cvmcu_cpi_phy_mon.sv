// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_CPI_PHY_MON_SV__
`define __UVMA_CVMCU_CPI_PHY_MON_SV__


/**
 * Monitor sampling PHY Monitor Transactions (uvma_cvmcu_cpi_phy_mon_trn_c).
 * @ingroup uvma_cvmcu_cpi_comps
 */
class uvma_cvmcu_cpi_phy_mon_c extends uvmx_mp_mon_c #(
   .T_MP     (virtual uvma_cvmcu_cpi_if.phy_mon_mp),
   .T_CFG    (uvma_cvmcu_cpi_cfg_c  ),
   .T_CNTXT  (uvma_cvmcu_cpi_cntxt_c),
   .T_MON_TRN(uvma_cvmcu_cpi_phy_mon_trn_c)
);

   `uvm_component_utils(uvma_cvmcu_cpi_phy_mon_c)
   `uvmx_mp_mon(phy_mon_mp, phy_mon_cb)


   /**
    * Default constructor.
    */
   function new(string name="uvma_cvmcu_cpi_phy_mon", uvm_component parent=null);
      super.new(name, parent);
   endfunction

   /**
    * Samples #trn from the PHY Monitor modport (phy_mon_cb) on each clock cycle.
    */
   virtual task sample_trn(ref uvma_cvmcu_cpi_phy_mon_trn_c trn);
      trn.cam_data_i = mp.phy_mon_cb.cam_data_i;
      trn.cam_hsync_i = mp.phy_mon_cb.cam_hsync_i;
      trn.cam_vsync_i = mp.phy_mon_cb.cam_vsync_i;
   endtask

   /**
    * Trims data outside configured widths.
    */
   virtual function void process_trn(ref uvma_cvmcu_cpi_phy_mon_trn_c trn);
      `uvmx_trim(trn.cam_data_i, cfg.data_width)


   endfunction

endclass : uvma_cvmcu_cpi_phy_mon_c


`endif // __UVMA_CVMCU_CPI_PHY_MON_SV__