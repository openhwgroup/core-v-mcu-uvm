// Copyright 2022 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_UDMA_TX_BASE_TEST_WORKAROUNDS_SV__
`define __UVMT_UDMA_TX_BASE_TEST_WORKAROUNDS_SV__


// Temporary configuration constraints here (this file should be empty by the end of the project).
constraint no_sb_cons { env_cfg.scoreboarding_enabled == 0; } // TODO Remove this to enable scoreboards end-of-test error reporting!


`endif // __UVMT_UDMA_TX_BASE_TEST_WORKAROUNDS_SV__
