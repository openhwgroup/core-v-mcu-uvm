// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_IO_MON_SV__
`define __UVMA_CVMCU_IO_MON_SV__


/**
 * Component sampling Monitor Transactions from  Interface (uvma_cvmcu_io_if).
 * @ingroup uvma_cvmcu_io_comps
 */
class uvma_cvmcu_io_mon_c extends uvmx_mon_c #(
   .T_CFG  (uvma_cvmcu_io_cfg_c  ),
   .T_CNTXT(uvma_cvmcu_io_cntxt_c)
);

   /// @name Components
   /// @{
   uvma_cvmcu_io_padi_mon_c  padi_monitor; ///<
   uvma_cvmcu_io_pado_mon_c  pado_monitor; ///<
   /// @}


   `uvm_component_utils(uvma_cvmcu_io_mon_c)
   `uvmx_mon_reset(rstn_i, UVMX_ACTIVE_LOW)


   /**
    * Default constructor.
    */
   function new(string name="uvma_cvmcu_io_mon", uvm_component parent=null);
      super.new(name, parent);
   endfunction

   /**
    *
    */
   virtual function void create_monitors();
      padi_monitor = uvma_cvmcu_io_padi_mon_c::type_id::create("padi_monitor", this);
      pado_monitor = uvma_cvmcu_io_pado_mon_c::type_id::create("pado_monitor", this);
   endfunction

endclass : uvma_cvmcu_io_mon_c


`endif // __UVMA_CVMCU_IO_MON_SV__