// Copyright 2022 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_REG_BIT_BASH_VSEQ_IGNORE_LIST_SV__
`define __UVME_CVMCU_REG_BIT_BASH_VSEQ_IGNORE_LIST_SV__


string  bb_ignore_list[$] = '{
   // TODO Add registers and/or register blocks to ignore list for automated bit-bash testing
   //      Ex: "reg_name"     , // One register at a time
   //      Ex: "reg_name.abc*", // One register field at a time
};


`endif // __UVME_CVMCU_REG_BIT_BASH_VSEQ_IGNORE_LIST_SV__
