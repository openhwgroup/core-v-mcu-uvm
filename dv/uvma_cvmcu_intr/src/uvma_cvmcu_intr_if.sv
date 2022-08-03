// Copyright 2022 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_INTR_IF_SV__
`define __UVMA_CVMCU_INTR_IF_SV__


/**
 * Encapsulates all signals and clocking of CORE-V MCU Interrupt interface.
 * Used by monitor (uvma_cvmcu_intr_mon_c) and driver (uvma_cvmcu_intr_drv_c).
 * Assertions must be captured within uvma_cvmcu_intr_if_chkr.
 * @ingroup uvma_cvmcu_intr_misc
 */
interface uvma_cvmcu_intr_if (
   input  clk    ,
   input  reset_n
);

   // TODO Add uvma_cvmcu_intr_if signals
   // Ex:  wire        enable;
   //      wire [7:0]  data;


   /**
    * Used by uvma_cvmcu_intr_drv_c.
    */
   clocking drv_cb @(posedge clk);
      // TODO Add signals to uvma_cvmcu_intr_if::drv_cb()
      //      Ex: output  enable,
      //                  data  ;
   endclocking : drv_cb

   /**
    * Used by uvma_cvmcu_intr_mon_c.
    */
   clocking mon_cb @(posedge clk);
      // TODO Add signals to uvma_cvmcu_intr_if::mon_cb()
      //      Ex: input  enable,
      //                 data  ;
   endclocking : mon_cb


   /**
    * Used by uvma_cvmcu_intr_drv_c.
    */
   modport drv_mp (
      clocking drv_cb ,
      input    clk    ,
      input    reset_n
   );

   /**
    * Used by uvma_cvmcu_intr_mon_c.
    */
   modport mon_mp (
      clocking mon_cb ,
      input    clk    ,
      input    reset_n
   );

endinterface : uvma_cvmcu_intr_if


`endif // __UVMA_CVMCU_INTR_IF_SV__
