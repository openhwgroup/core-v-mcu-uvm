// Copyright 2022 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_CHKR_SV__
`define __UVME_CVMCU_CHKR_SV__


/**
 * Encapsulates assertions targeting uvme_cvmcu interfaces.
 * This module must be bound to interfaces in a test bench.
 * @ingroup uvme_cvmcu_misc
 */
module uvme_cvmcu_chkr (
   uvma_obi_if  obi_instr_if, ///< Register access interface
   uvme_cvmcu_probe_if  probe_if ///< Misc. signals interface
);

   // TODO Add assertions to uvme_$[name}_chkr

endmodule : uvme_cvmcu_chkr


`endif // __UVME_CVMCU_CHKR_SV__