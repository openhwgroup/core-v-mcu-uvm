# About
This project aims to build a UVM test bench and environment for the CORE-V MCU.

## IP
* DV
> * uvma_cvmcu_intr
> * uvme_apb_timer
> * uvme_apb_adv_timer
> * uvme_cvmcu
> * uvma_cvmcu_intr_st
> * uvmt_apb_timer
> * uvmt_apb_adv_timer
> * uvmt_cvmcu
> * uvma_cvmcu_intr_st
* RTL
* Tools


# Installing Toolchain
1. Download and install the latest version of [Xilinx Vivado WebPack]()
1. `export VIVADO_HOME=/path/to/vivado/bin`
1. `pipx install mio-client`


# Simulation
1. Change directory to 'sim'

This is from where all jobs will be launched.
```
cd sim
```


2. To run compilation, elaboration and simulation for test "smoke" and seed "1":

```
mio sim uvmt_cvmcu -t smoke -s 1
```
