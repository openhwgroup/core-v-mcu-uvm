# Hello from your Code Generator!
Thank you for using the Moore.io Block-Level UVM Agents+Environment+TB Code Template v1.0!

Your parameters are:
* Name: 'udma_tx'
* Full Name: 'uDMA Tx Channels'

If this is incorrect, it is recommended to delete the generated IP and re-generate with the correct parameters.

This code template assumes the DUT has a single datapath (DP) direction and control plane (CP) signals.

What follows is a short guide for developers of this new UVM Test Bench.  You may also use `grep -nr TODO .` for a full list.

## 1 - Connect the DUT to the Interfaces
 1. - [ ] IP Metadata - `ip.yml` - Use the sample code as a guide to add your DUT information.
 1. - [ ] DUT Wrapper - `tb/uvma_udma_tx_dut_wrap.sv` - Use the sample code as a guide to instantiate your DUT and connect its ports.

## Have fun!
Make sure to check out the other IP generated along with this test bench:
* `uvma_udma_tx_cp`
* `uvma_udma_tx_dp_in`
* `uvma_udma_tx_dp_out`
* `uvme_udma_tx`




# uDMA Tx Channels Block UVM Test Bench


# About
This IP contains the uDMA Tx Channels Block UVM Test Bench.

TODO Describe uDMA Tx Channels


# Block Diagram
![alt text](./docs/tb_block_diagram.svg "uDMA Tx Channels Block UVM Test Bench Block Diagram")

# Directory Structure
* `bin` - Scripts, metadata and other miscellaneous files
* `docs` - Reference documentation
* `examples` - Code samples for adding to this test bench
* `src` - Source code


# Dependencies
It is dependent on the following IP:

* `uvm`
* `uvml`
* `uvml_logs`
* `uvml_sb`
* `uvml_ral`
* `uvma_clk`
* `uvma_reset`
* `uvma_udma_tx_cp`
* `uvma_udma_tx_dp_in`
* `uvma_udma_tx_dp_out`
* `uvme_udma_tx`
