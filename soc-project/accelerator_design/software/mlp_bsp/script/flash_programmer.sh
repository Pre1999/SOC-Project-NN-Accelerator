#!/bin/sh
#
# This file was automatically generated.
#
# It can be overwritten by nios2-flash-programmer-generate or nios2-flash-programmer-gui.
#

#
# Converting Binary File: /home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/software/mlp_bsp/mnist-nn.zip to: "../flash/mnist-nn_generic_tristate_controller_0.flash"
#
bin2flash --input="/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/software/mlp_bsp/mnist-nn.zip" --output="../flash/mnist-nn_generic_tristate_controller_0.flash" --location=0x0 --verbose 

#
# Programming File: "../flash/mnist-nn_generic_tristate_controller_0.flash" To Device: generic_tristate_controller_0
#
nios2-flash-programmer "../flash/mnist-nn_generic_tristate_controller_0.flash" --base=0x8800000 --accept-bad-sysid --device=1 --instance=0 '--cable=USB-Blaster on localhost [1-9]' --program --verbose 

