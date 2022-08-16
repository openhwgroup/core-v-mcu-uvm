#########################################################
# TODO Change the next line to match your Vivado bin path
export VIVADO_HOME=/tools/vivado/2022.1/Vivado/2022.1/bin
#########################################################

# Vivado binaries
export xvlog=$VIVADO_HOME/xvlog
export xelab=$VIVADO_HOME/xelab
export xsim=$VIVADO_HOME/xsim


# Variables for flists
export PROJECT_ROOT=$(pwd)/..
export LIBS_PATH=$PROJECT_ROOT/.mio/vendors
export DV_PATH=$PROJECT_ROOT/dv
export RTL_PATH=$PROJECT_ROOT/rtl
export UVML_SRC_PATH=$LIBS_PATH/uvml/src
export UVML_LOGS_SRC_PATH=$LIBS_PATH/uvml_logs/src
export UVML_SB_SRC_PATH=$LIBS_PATH/uvml_sb/src
export UVML_RAL_SRC_PATH=$LIBS_PATH/uvml_ral/src
export UVMA_CLK_SRC_PATH=$LIBS_PATH/uvma_clk/src
export UVMA_RESET_SRC_PATH=$LIBS_PATH/uvma_reset/src
export UVMA_OBI_SRC_PATH=$LIBS_PATH/uvma_obi/src
export UVMA_CVMCU_INTR_SRC_PATH=$DV_PATH/uvma_cvmcu_intr/src
export UVME_CVMCU_SRC_PATH=$DV_PATH/uvme_cvmcu/src
export UVMT_CVMCU_SRC_PATH=$DV_PATH/uvmt_cvmcu/src


# Run
$xvlog --incr -sv -L uvm -f dut.flist --work dut_lib=./dut_lib  --log dut_cmp.log
$xvlog --incr -sv -L uvm -f tb.flist  --work tb_lib=./tb_lib    --log tb_cmp.log
$xelab tb_lib.uvmt_cvmcu_tb tb_lib.uvml_sim_summary --debug all --incr -relax --O0 -v 0 -s elab_out -timescale 1ns/1ps -L dut_lib=./dut_lib -L tb_lib=./tb_lib --log elab.log
$xsim  elab_out --runall --onerror quit --log sim.log -testplusarg UVM_TESTNAME=uvmt_cvmcu_smoke_test_c
