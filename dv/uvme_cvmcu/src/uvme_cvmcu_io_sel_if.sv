// Copyright 2022-2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_IO_SEL_IF_SV__
`define __UVME_CVMCU_IO_SEL_IF_SV__


/**
 *
 * @ingroup uvme_cvmcu_misc
 */
interface uvme_cvmcu_io_sel_if (
   input  clk    ,
   input  reset_n
);

   // TODO Add uvme_cvmcu_io_sel_if signals
   //      Ex: wire        locked; ///< Describe me!
   //          wire [7:0]  state ; ///< Describe me!

   clocking cb @(posedge clk);
      // TODO Add signals to uvma_st_if::cb()
      //      Ex: input  locked, state;
   endclocking

   modport mp (
      clocking cb     ,
      input    clk    ,
      input    reset_n
   );

endinterface : uvme_cvmcu_io_sel_if


`endif // __UVME_CVMCU_IO_SEL_IF_SV__
