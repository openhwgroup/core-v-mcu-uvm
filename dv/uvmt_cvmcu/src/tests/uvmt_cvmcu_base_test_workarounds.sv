// Copyright 2022 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_CVMCU_BASE_TEST_WORKAROUNDS_SV__
`define __UVMT_CVMCU_BASE_TEST_WORKAROUNDS_SV__


// This file should be empty by the end of the project
constraint disable_cov_cons {
   env_cfg.cov_model_enabled     == 0;
   env_cfg.scoreboarding_enabled == 0;
}


`endif // __UVMT_CVMCU_BASE_TEST_WORKAROUNDS_SV__
