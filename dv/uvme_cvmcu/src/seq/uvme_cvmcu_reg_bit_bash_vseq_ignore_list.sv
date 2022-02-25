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


`ifndef __UVME_CVMCU_REG_BIT_BASH_VSEQ_IGNORE_LIST_SV__
`define __UVME_CVMCU_REG_BIT_BASH_VSEQ_IGNORE_LIST_SV__


string  ignore_list[$] = '{
   // TODO Add register blocks to CORE-V MCU ignore list for RAL bit bash automated testing
   //      Ex: "block_name.reg_name", // One register at a time
   //      Ex: "block_name.*", // One block at a time
};


`endif // __UVME_CVMCU_REG_BIT_BASH_VSEQ_IGNORE_LIST_SV__
