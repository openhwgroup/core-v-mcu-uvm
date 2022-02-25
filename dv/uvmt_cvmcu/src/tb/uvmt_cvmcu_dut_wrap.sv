// Copyright 2022 Datum Technology Corporation
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
// Licensed under the Solderpad Hardware License v 2.1 (the "License"); you may not use this file except in compliance
// with the License, or, at your option, the Apache License version 2.0.  You may obtain a copy of the License at
//                                        https://solderpad.org/licenses/SHL-2.1/
// Unless required by applicable law or agreed to in writing, any work distributed under the License is distributed on
// an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations under the License.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_CVMCU_DUT_WRAP_SV__
`define __UVMT_CVMCU_DUT_WRAP_SV__


/**
 * Module wrapper for CORE-V MCU RTL DUT.  All ports are SV interfaces.
 */
module uvmt_cvmcu_dut_wrap(
   uvma_obi_if  obi_if,
   uvmt_cvmcu_probe_if  probe_if
);
   
   // \/ CODE BELOW IS RESPONSABILITY OF DESIGNERS \/
   
   // TODO Instantiate Device Under Test (DUT) and connect it to the interfaces signals
   //      Ex: cvmcu_top  dut(
   //             .clk    (obi_if.clk),
   //             .reset_n(obi_if.reset_n),
   //             .obi_data(obi_if.data),
   //             ...
   //          );
   
   // TODO Connect probe interface signals to design
   //      Ex: assign probe_if.abc = dut.abc;
   
   // /\ CODE ABOVE IS RESPONSABILITY OF DESIGNERS /\
   
endmodule : uvmt_cvmcu_dut_wrap


`endif // __UVMT_CVMCU_DUT_WRAP_SV__
