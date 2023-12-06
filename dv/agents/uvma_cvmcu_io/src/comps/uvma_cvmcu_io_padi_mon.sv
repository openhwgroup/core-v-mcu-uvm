// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_IO_PADI_MON_SV__
`define __UVMA_CVMCU_IO_PADI_MON_SV__


/**
 * Monitor sampling PADI Monitor Transactions (uvma_cvmcu_io_padi_mon_trn_c).
 * @ingroup uvma_cvmcu_io_comps
 */
class uvma_cvmcu_io_padi_mon_c extends uvmx_mp_mon_c #(
   .T_MP     (virtual uvma_cvmcu_io_if.padi_mon_mp),
   .T_CFG    (uvma_cvmcu_io_cfg_c  ),
   .T_CNTXT  (uvma_cvmcu_io_cntxt_c),
   .T_MON_TRN(uvma_cvmcu_io_padi_mon_trn_c)
);

   `uvm_component_utils(uvma_cvmcu_io_padi_mon_c)
   `uvmx_mp_mon(padi_mon_mp, padi_mon_cb)


   /**
    * Default constructor.
    */
   function new(string name="uvma_cvmcu_io_padi_mon", uvm_component parent=null);
      super.new(name, parent);
   endfunction

   /**
    * Samples #trn from the PADI Monitor modport (padi_mon_cb) on each clock cycle.
    */
   virtual task sample_trn(ref uvma_cvmcu_io_padi_mon_trn_c trn);
      `uvmx_mp_mon_signal(trn, io_in_i)
   endtask


endclass


`endif // __UVMA_CVMCU_IO_PADI_MON_SV__