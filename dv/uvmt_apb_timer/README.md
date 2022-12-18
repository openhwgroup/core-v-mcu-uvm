# APB Timer Sub-System UVM Test Bench


# About
This IP contains the APB Timer Sub-System UVM Test Bench.

# Block Diagram
![alt text](./docs/tb_block_diagram.svg "APB Timer Sub-System UVM Test Bench Block Diagram")


# Regressions
| Name | Description |
| ---- | ----------- |
| `sanity` | Runs only a single known seed for a few basic tests. |
| `nightly` | Nightly bug hunt. |
| `weekly` | Weekly bug hunt. |
| `bugs` | Outstanding bugs. |


# Tests
| Name | Description |
| ---- | ----------- |
| `mem_access` | Ensures accessibility of all memories by executing the uvm_mem_single_access_seq sequence on each. |
| `mem_walk` | Checks all memories by executing the uvm_mem_single_walk_seq sequence on each. |
| `reg_access` | Ensures accessibility of all registers by executing the uvm_reg_single_access_seq sequence on each. |
| `reg_bit_bash` | Checks the implementation of all registers by executing the uvm_reg_single_bit_bash_seq on each. |
| `reg_hw_reset` | Reads all of the registers, via all of the available address maps, comparing the value read with the expected reset value. |
| `shared_access` | Ensures accessibility of all registers by executing the uvm_reg_shared_access_seq sequence on each. |
| `smoke` | Writes to a single memory location and reads back. |


# Directory Structure
* `bin` - Scripts, metadata and other miscellaneous files
* `docs` - Reference documentation
* `examples` - Code samples for adding to this test bench
* `src` - Source code


# Dependencies
It is dependent on the following IP:

* `uvmx`
* `uvml_sb`
* `uvma_clk`
* `uvma_reset`
* `uvma_apb`
* `uvme_apb_timer`
