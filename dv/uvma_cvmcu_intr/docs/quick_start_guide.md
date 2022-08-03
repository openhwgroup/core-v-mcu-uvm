@page quick_start_guide Quick Start Guide
@htmlonly
<div class="autonumbering">
@endhtmlonly



@tableofcontents



@section quick_start_license_agreement License Agreement
© Copyright 2022 Datum Technology Corporation

SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1



@section quick_start_guide_id Document Information
ID | Name | Version
-- | ---- | -------
001 | Quick Start Guide | v.1.0


@subsection quick_start_guide_description Description
This document is a short guide to running the CORE-V MCU Interrupt UVM Agent in its own Self-Test Bench.

![uvma_cvmcu_intr_agent_c Block Diagram](agent_block_diagram.svg)



@section quick_start_guide_revision_history Revision History
Revision  | Date | Description
--------- | ---- | -----------
1.0 | 2022/01/01 | Initial Version



@section quick_start_guide_definitions Definitions
Symbol | Definition
------ | ----------
 'ABC' | Always Be Closing



@section quick_start_guide_prerequisites Pre-Requisites
The Moore.io Client CLI, used throughout this tutorial is available via "pipx":
@code{.sh}pipx install mio-client@endcode



@section quick_start_guide_introduction Introduction
The CORE-V MCU Interrupt UVM Agent has a Self-Test UVM Environment & Test Bench pair used to verify the former thoroughly
against itself.  One agent is instantiated as "active" and the other as "passive".  Both driver/monitor and 
monitor/monitor scoreboarding is done.

This guide will walk you through running a test generating random traffic.



@section quick_start_guide_installation Installation
1. Install the CORE-V MCU Interrupt UVM Agent: @code{.sh}mio install uvma_cvmcu_intr@endcode
2. Install the CORE-V MCU Interrupt UVM Agent Self-Test UVM Environment: @code{.sh}mio install uvme_cvmcu_intr_st@endcode
3. Install the CORE-V MCU Interrupt UVM Agent Self-Test UVM Test Bench: @code{.sh}mio install uvmt_cvmcu_intr_st@endcode


@section quick_start_guide_compile_elaborate Compile and Elaborate
1. Compile the CORE-V MCU Interrupt UVM Agent Self-Test UVM Test Bench: @code{.sh}mio sim uvmt_cvmcu_intr_st -C@endcode
2. Elaborate the CORE-V MCU Interrupt UVM Agent Self-Test UVM Test Bench with wave capture enabled: @code{.sh}mio sim uvmt_cvmcu_intr_st -E -w@endcode


@section quick_start_guide_simulate Simulate
Launch CORE-V MCU Interrupt UVM Agent Self-Test UVM Test "rand_stim" with seed "1":
@code{.sh}mio sim uvmt_cvmcu_intr_st -S -t rand_stim -s 1@endcode



@section quick_start_guide_results Results
The Moore.io CLI will printout the commands to view both the simulation logs (don't forget to check out the "trn_log"
directory for transaction logs) and waveforms.



@section quick_start_guide_conclusion Conclusion
That's all for this short guide.  For more information, including integration, have a look at the @subpage user_guide "User Guide".



@htmlonly
</div>
@endhtmlonly
