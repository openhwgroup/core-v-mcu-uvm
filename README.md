# About
This project aims to bring the [OpenHW Group](https://www.openhwgroup.org/)'s [CORE-V MCU Project](https://docs.openhwgroup.org/projects/core-v-mcu/index.html) to TRL-5 and beyond via [Advanced UVM Verification](https://github.com/advanced-uvm) and the [Moore.io](https://mooreio.org/) libraries and toolchain. [Datum](https://datumtc.ca/) and [Low Power Futures](https://lowpowerfutures.com/) are the primary contributor to this effort.

## IP List
 IP Name | Description
 --------|------------
 `uvme_cvmcu` | CORE-V MCU Top-Level Environment
 `uvmt_cvmcu` | CORE-V MCU Top-Level Test Bench
 `uvme_apb_adv_timer` | APB Advanced Timer Sub-System Environment
 `uvme_apb_timer` | APB Timer Sub-System Environment
 `uvmt_apb_adv_timer` | APB Advanced Timer Sub-System Test Bench
 `uvmt_apb_timer` | APB Timer Sub-System Test Bench
 `uvma_cvmcu_intr` | Interrupt Agent
 `uvme_cvmcu_intr_st` | Interrupt Agent Self-Test Environment
 `uvmt_cvmcu_intr_st` | Interrupt Agent Self-Test Bench


# Installing Toolchain
1. Download and install the latest version of [Xilinx Vivado WebPack](https://www.xilinx.com/support/download.html)
1. Set environment variable for Vivado installation location: `export VIVADO_HOME=/path/to/vivado/bin`
1. Install `pipx` if needed: `python3 -m pip install --user pipx; python3 -m pipx ensurepath`
1. Install Moore.io CLI Client: `pipx install mio-client`
1. [Create a free Moore.io IP Marketplace user account](https://mooreio.org/account/register). The VIP libraries for this project are under license from [Datum](https://datumtc.ca/) and credentials are needed to install them.


# Simulation
1. Change directory to 'sim'

This is from where all jobs will be launched.
```
cd sim
```


2. Install IP dependencies for `uvmt_apb_timer`:

```
mio install uvmt_apb_timer
```


3. To run compilation, elaboration and simulation for Test Bench `uvmt_apb_timer`, test `reg_hw_bit_bash` and seed `1`:

```
mio sim uvmt_apb_timer -t reg_hw_bit_bash -s 1
```
