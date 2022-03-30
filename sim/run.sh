#! /bin/bash
########################################################################################################################
## Copyright 2022 Datum Technology Corporation
########################################################################################################################
## SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
########################################################################################################################


### Project ###
export PROJECT_ROOT_DIR=$(pwd)/..
export PROJECT_DV_DIR=${PROJECT_ROOT_DIR}/dv
export PROJECT_DV_IMPORTS_DIR=${PROJECT_DV_DIR}/.imports
export PROJECT_RTL_DIR=${PROJECT_ROOT_DIR}/rtl
export PROJECT_SIM_DIR=${PROJECT_ROOT_DIR}/sim
export PROJECT_SIM_ARTIFACTS_DIR=${PROJECT_SIM_DIR}/out
export PROJECT_SIM_RESULTS_DIR=${PROJECT_SIM_DIR}/results
export PROJECT_TOOLS_DIR=${PROJECT_ROOT_DIR}/tools
export PROJECT_TOOLS_IMPORT_DIR=${PROJECT_TOOLS_DIR}/.imports


### RTL ###
# Local
# Imports
export RTL_COREV_MCU=${PROJECT_RTL_DIR}


### DV ###
# Local
export DV_UVME_CVMCU_SRC_PATH=${PROJECT_DV_DIR}/uvme_cvmcu/src
export DV_UVMT_CVMCU_SRC_PATH=${PROJECT_DV_DIR}/uvmt_cvmcu/src

# Imports
export UVM_HOME=${PROJECT_DV_IMPORTS_DIR}/uvm/src
export DV_UVM_SRC_PATH=${PROJECT_DV_IMPORTS_DIR}/uvm/src
export DV_UVML_SRC_PATH=${PROJECT_DV_IMPORTS_DIR}/uvml/src
export DV_UVML_LOGS_SRC_PATH=${PROJECT_DV_IMPORTS_DIR}/uvml_logs/src
export DV_UVML_RAL_SRC_PATH=${PROJECT_DV_IMPORTS_DIR}/uvml_ral/src
export DV_UVML_MEM_SRC_PATH=${PROJECT_DV_IMPORTS_DIR}/uvml_mem/src
export DV_UVML_SB_SRC_PATH=${PROJECT_DV_IMPORTS_DIR}/uvml_sb/src
export DV_UVMA_CLK_SRC_PATH=${PROJECT_DV_IMPORTS_DIR}/uvma_clk/src
export DV_UVMA_RESET_SRC_PATH=${PROJECT_DV_IMPORTS_DIR}/uvma_reset/src
export DV_UVMA_OBI_SRC_PATH=${PROJECT_DV_IMPORTS_DIR}/uvma_obi/src
export DV_UVMA_APB_SRC_PATH=${PROJECT_DV_IMPORTS_DIR}/uvma_apb/src

# PATH
export PATH=${PATH}:${MIO_HOME}/src



# RUN
${VIVADO_HOME}/bin/xvlog --incr --relax -sv -f ${RTL_COREV_MCU}/core-v-mcu.flist --log ./dut_cmp.log --work core-v-mcu=./out/core-v-mcu
${VIVADO_HOME}/bin/xvlog --incr -sv -f ${DV_UVMT_CVMCU_SRC_PATH}/uvmt_cvmcu_pkg.flist.xsim -L uvm --work uvmt_cvmcu=./out/uvmt_cvmcu --log ./tb_cmp.log
${VIVADO_HOME}/bin/xelab --define VERILATOR --define XSIM --incr -dup_entity_as_module -relax --O0 -v 0 -timescale 1ns/1ps -L uvmt_cvmcu=./out/uvmt_cvmcu -L core-v-mcu=./out/core-v-mcu --snapshot uvmt_cvmcu_tb uvmt_cvmcu.uvmt_cvmcu_tb --log ./tb_elab.log
${VIVADO_HOME}/bin/xsim uvmt_cvmcu_tb -ignore_coverage  --runall --onerror quit -testplusarg "UVM_TESTNAME=uvmt_cvmcu_smoke_test_c" --stats --log ./sim.log

