// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_CHIP_CHKR_SV__
`define __UVME_CVMCU_CHIP_CHKR_SV__


/**
 * Encapsulates assertions targeting CORE-V-MCU Chip interfaces.
 * This module must be bound to interfaces in a test bench.
 * @ingroup uvme_cvmcu_chip_misc
 */
module uvme_cvmcu_chip_chkr (
   uvma_jtag_if  jtag_if, ///< JTAG controller interface
   uvma_apb_if  apb_if, ///< APB peripherals monitor interface
   uvma_cvmcu_io_if  io_if, ///< IO ports interface
   uvma_obi_if  instr_obi_if, ///< Instruction memory OBI interface
   uvma_obi_if  data_obi_if, ///< Data memory OBI interface
   uvma_cvmcu_event_if  event_if, ///< Event interface
   uvma_cvmcu_dbg_if  dbg_if, ///< Debug interface
   uvme_cvmcu_chip_probe_if  probe_if ///< Misc. signals interface
);

   // TODO Add assertions to uvme_cvmcu_chip_chkr

endmodule : uvme_cvmcu_chip_chkr


`endif // __UVME_CVMCU_CHIP_CHKR_SV__