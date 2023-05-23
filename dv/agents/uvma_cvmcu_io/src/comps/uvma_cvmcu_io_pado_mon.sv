// Copyright 2023 Acme Enterprises
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_IO_PADO_MON_SV__
`define __UVMA_CVMCU_IO_PADO_MON_SV__


/**
 * Monitor sampling PADO Monitor Transactions (uvma_cvmcu_io_pado_mon_trn_c).
 * @ingroup uvma_cvmcu_io_comps
 */
class uvma_cvmcu_io_pado_mon_c extends uvmx_mp_mon_c #(
   .T_MP     (virtual uvma_cvmcu_io_if.pado_mon_mp),
   .T_CFG    (uvma_cvmcu_io_cfg_c  ),
   .T_CNTXT  (uvma_cvmcu_io_cntxt_c),
   .T_MON_TRN(uvma_cvmcu_io_pado_mon_trn_c)
);

   `uvm_component_utils(uvma_cvmcu_io_pado_mon_c)
   `uvmx_mp_mon(pado_mon_mp, pado_mon_cb)


   /**
    * Default constructor.
    */
   function new(string name="uvma_cvmcu_io_pado_mon", uvm_component parent=null);
      super.new(name, parent);
   endfunction

   /**
    * Samples #trn from the PADO Monitor modport (pado_mon_cb) on each clock cycle.
    */
   virtual task sample_trn(ref uvma_cvmcu_io_pado_mon_trn_c trn);
      trn.io_out_o = mp.pado_mon_cb.io_out_o;
      foreach (trn.pad_cfg_o[ii]) begin
         trn.pad_cfg_o[ii] = mp.pado_mon_cb.pad_cfg_o[ii];
      end
      trn.io_oe_o = mp.pado_mon_cb.io_oe_o;
      trn.slow_clk_o = mp.pado_mon_cb.slow_clk_o;
   endtask

   /**
    * Trims data outside configured widths.
    */
   virtual function void process_trn(ref uvma_cvmcu_io_pado_mon_trn_c trn);


   endfunction

endclass : uvma_cvmcu_io_pado_mon_c


`endif // __UVMA_CVMCU_IO_PADO_MON_SV__