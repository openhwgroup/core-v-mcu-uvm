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
> * uvmt_cvmcu_intr_st
* RTL
* Tools


# Installing Toolchain
1. Download and install the latest version of [Xilinx Vivado WebPack](https://www.xilinx.com/support/download.html)
1. Set environment variable for Vivado installation location: `export VIVADO_HOME=/path/to/vivado/bin`
1. Install `pipx` if needed: `python3 -m pip install --user pipx && python3 -m pipx ensurepath`
1. Install Moore.io CLI Client: `pipx install mio-client`
1. [Create a free Moore.io IP Marketplace user account](https://mooreio.org/account/register). The VIP libraries for this project are under license from [Datum](https://datumtc.ca/) and credentials are needed to install them.


# Simulation
1. Change directory to 'sim'

This is from where all jobs will be launched.
```
cd sim
```


2. Install IP dependencies for IP `uvmt_apb_timer`:

```
mio install uvmt_apb_timer
```


3. To run compilation, elaboration and simulation for sub-system `apb_timer`, test `reg_hw_reset` and seed `1`:

```
mio sim uvmt_apb_timer -t reg_hw_reset -s 1
```
