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


`ifndef __UVMT_CVMCU_CONSTANTS_SV__
`define __UVMT_CVMCU_CONSTANTS_SV__


const int unsigned uvmt_cvmcu_default_startup_timeout     =    20_000; //  20 us // TODO Set default Heartbeat Monitor startup timeout
const int unsigned uvmt_cvmcu_default_heartbeat_period    =    20_000; //  20 us // TODO Set default Heartbeat Monitor period
const int unsigned uvmt_cvmcu_default_simulation_timeout  = 1_000_000; //   1 ms // TODO Set default simulation timeout


`endif // __UVMT_CVMCU_CONSTANTS_SV__
