transcript on
if ![file isdirectory verilog_libs] {
	file mkdir verilog_libs
}

vlib verilog_libs/altera_ver
vmap altera_ver ./verilog_libs/altera_ver
vlog -vlog01compat -work altera_ver {/package/eda/altera/altera17.0/quartus/eda/sim_lib/altera_primitives.v}

vlib verilog_libs/lpm_ver
vmap lpm_ver ./verilog_libs/lpm_ver
vlog -vlog01compat -work lpm_ver {/package/eda/altera/altera17.0/quartus/eda/sim_lib/220model.v}

vlib verilog_libs/sgate_ver
vmap sgate_ver ./verilog_libs/sgate_ver
vlog -vlog01compat -work sgate_ver {/package/eda/altera/altera17.0/quartus/eda/sim_lib/sgate.v}

vlib verilog_libs/altera_mf_ver
vmap altera_mf_ver ./verilog_libs/altera_mf_ver
vlog -vlog01compat -work altera_mf_ver {/package/eda/altera/altera17.0/quartus/eda/sim_lib/altera_mf.v}

vlib verilog_libs/altera_lnsim_ver
vmap altera_lnsim_ver ./verilog_libs/altera_lnsim_ver
vlog -sv -work altera_lnsim_ver {/package/eda/altera/altera17.0/quartus/eda/sim_lib/altera_lnsim.sv}

vlib verilog_libs/cycloneive_ver
vmap cycloneive_ver ./verilog_libs/cycloneive_ver
vlog -vlog01compat -work cycloneive_ver {/package/eda/altera/altera17.0/quartus/eda/sim_lib/cycloneive_atoms.v}

if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules {/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules/nios_system_video_vga_controller_0.v}
vlog -vlog01compat -work work +incdir+/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules {/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules/nios_system_video_rgb_resampler_0.v}
vlog -vlog01compat -work work +incdir+/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules {/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules/nios_system_video_pixel_buffer_dma_0.v}
vlog -vlog01compat -work work +incdir+/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules {/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules/nios_system_video_dual_clock_buffer_0.v}
vlog -vlog01compat -work work +incdir+/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules {/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules/nios_system_video_character_buffer_with_dma_0.v}
vlog -vlog01compat -work work +incdir+/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules {/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules/nios_system_video_alpha_blender_0.v}
vlog -vlog01compat -work work +incdir+/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules {/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules/nios_system_timer_0.v}
vlog -vlog01compat -work work +incdir+/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules {/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules/nios_system_switches.v}
vlog -vlog01compat -work work +incdir+/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules {/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules/nios_system_sram_0.v}
vlog -vlog01compat -work work +incdir+/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules {/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules/nios_system_rleds.v}
vlog -vlog01compat -work work +incdir+/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules {/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules/nios_system_performance_counter_0.v}
vlog -vlog01compat -work work +incdir+/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules {/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules/nios_system_new_sdram_controller_0.v}
vlog -vlog01compat -work work +incdir+/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules {/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules/nios_system_mm_interconnect_0_avalon_st_adapter_002.v}
vlog -vlog01compat -work work +incdir+/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules {/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules/nios_system_mm_interconnect_0_avalon_st_adapter_001.v}
vlog -vlog01compat -work work +incdir+/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules {/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules/nios_system_mm_interconnect_0_avalon_st_adapter.v}
vlog -vlog01compat -work work +incdir+/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules {/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules/nios_system_mm_interconnect_0.v}
vlog -vlog01compat -work work +incdir+/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules {/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules/nios_system_jtag_uart_0.v}
vlog -vlog01compat -work work +incdir+/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules {/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules/nios_system_gleds.v}
vlog -vlog01compat -work work +incdir+/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules {/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules/nios_system_generic_tristate_controller_0.v}
vlog -vlog01compat -work work +incdir+/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules {/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules/nios_system_dma_0.v}
vlog -vlog01compat -work work +incdir+/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules {/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules/fp_multiplier.v}
vlog -vlog01compat -work work +incdir+/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules {/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules/fp_adder.v}
vlog -vlog01compat -work work +incdir+/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules {/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules/altera_up_video_alpha_blender_simple.v}
vlog -vlog01compat -work work +incdir+/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules {/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules/altera_up_video_128_character_rom.v}
vlog -vlog01compat -work work +incdir+/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules {/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules/altera_up_avalon_video_vga_timing.v}
vlog -vlog01compat -work work +incdir+/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules {/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules/altera_reset_synchronizer.v}
vlog -vlog01compat -work work +incdir+/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules {/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules/altera_reset_controller.v}
vlog -vlog01compat -work work +incdir+/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules {/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules/altera_customins_master_translator.v}
vlog -vlog01compat -work work +incdir+/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules {/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules/altera_avalon_sc_fifo.v}
vlog -vlog01compat -work work +incdir+/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis {/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/nios_system.v}
vlog -vlog01compat -work work +incdir+/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design {/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/pll.v}
vlog -vlog01compat -work work +incdir+/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design {/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/demo.v}
vlog -vlog01compat -work work +incdir+/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/db {/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/db/pll_altpll.v}
vlog -sv -work work +incdir+/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules {/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules/nn_acc_single_non_burst.sv}
vlog -sv -work work +incdir+/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules {/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules/nios_system_tristate_conduit_bridge_0.sv}
vlog -sv -work work +incdir+/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules {/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules/nios_system_nios2_qsys_0_custom_instruction_master_comb_xconnect.sv}
vlog -sv -work work +incdir+/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules {/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules/nios_system_mm_interconnect_0_rsp_mux_003.sv}
vlog -sv -work work +incdir+/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules {/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules/nios_system_mm_interconnect_0_rsp_mux_002.sv}
vlog -sv -work work +incdir+/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules {/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules/nios_system_mm_interconnect_0_rsp_mux_001.sv}
vlog -sv -work work +incdir+/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules {/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules/nios_system_mm_interconnect_0_rsp_mux.sv}
vlog -sv -work work +incdir+/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules {/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules/nios_system_mm_interconnect_0_rsp_demux_009.sv}
vlog -sv -work work +incdir+/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules {/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules/nios_system_mm_interconnect_0_rsp_demux_005.sv}
vlog -sv -work work +incdir+/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules {/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules/nios_system_mm_interconnect_0_rsp_demux_002.sv}
vlog -sv -work work +incdir+/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules {/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules/nios_system_mm_interconnect_0_rsp_demux_001.sv}
vlog -sv -work work +incdir+/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules {/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules/nios_system_mm_interconnect_0_rsp_demux.sv}
vlog -sv -work work +incdir+/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules {/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules/nios_system_mm_interconnect_0_router_014.sv}
vlog -sv -work work +incdir+/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules {/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules/nios_system_mm_interconnect_0_router_013.sv}
vlog -sv -work work +incdir+/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules {/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules/nios_system_mm_interconnect_0_router_010.sv}
vlog -sv -work work +incdir+/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules {/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules/nios_system_mm_interconnect_0_router_007.sv}
vlog -sv -work work +incdir+/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules {/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules/nios_system_mm_interconnect_0_router_006.sv}
vlog -sv -work work +incdir+/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules {/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules/nios_system_mm_interconnect_0_router_005.sv}
vlog -sv -work work +incdir+/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules {/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules/nios_system_mm_interconnect_0_router_003.sv}
vlog -sv -work work +incdir+/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules {/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules/nios_system_mm_interconnect_0_router_002.sv}
vlog -sv -work work +incdir+/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules {/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules/nios_system_mm_interconnect_0_router_001.sv}
vlog -sv -work work +incdir+/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules {/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules/nios_system_mm_interconnect_0_router.sv}
vlog -sv -work work +incdir+/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules {/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules/nios_system_mm_interconnect_0_cmd_mux_009.sv}
vlog -sv -work work +incdir+/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules {/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules/nios_system_mm_interconnect_0_cmd_mux_008.sv}
vlog -sv -work work +incdir+/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules {/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules/nios_system_mm_interconnect_0_cmd_mux_005.sv}
vlog -sv -work work +incdir+/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules {/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules/nios_system_mm_interconnect_0_cmd_mux_002.sv}
vlog -sv -work work +incdir+/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules {/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules/nios_system_mm_interconnect_0_cmd_mux_001.sv}
vlog -sv -work work +incdir+/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules {/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules/nios_system_mm_interconnect_0_cmd_mux.sv}
vlog -sv -work work +incdir+/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules {/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules/nios_system_mm_interconnect_0_cmd_demux_004.sv}
vlog -sv -work work +incdir+/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules {/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules/nios_system_mm_interconnect_0_cmd_demux_003.sv}
vlog -sv -work work +incdir+/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules {/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules/nios_system_mm_interconnect_0_cmd_demux_002.sv}
vlog -sv -work work +incdir+/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules {/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules/nios_system_mm_interconnect_0_cmd_demux_001.sv}
vlog -sv -work work +incdir+/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules {/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules/nios_system_mm_interconnect_0_cmd_demux.sv}
vlog -sv -work work +incdir+/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules {/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules/nios_system_mm_interconnect_0_avalon_st_adapter_error_adapter_0.sv}
vlog -sv -work work +incdir+/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules {/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules/nios_system_mm_interconnect_0_avalon_st_adapter_002_error_adapter_0.sv}
vlog -sv -work work +incdir+/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules {/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules/nios_system_mm_interconnect_0_avalon_st_adapter_001_error_adapter_0.sv}
vlog -sv -work work +incdir+/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules {/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules/nios_system_irq_mapper.sv}
vlog -sv -work work +incdir+/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules {/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules/data_buffer.sv}
vlog -sv -work work +incdir+/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules {/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules/altera_tristate_controller_translator.sv}
vlog -sv -work work +incdir+/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules {/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules/altera_tristate_controller_aggregator.sv}
vlog -sv -work work +incdir+/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules {/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules/altera_merlin_width_adapter.sv}
vlog -sv -work work +incdir+/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules {/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules/altera_merlin_traffic_limiter.sv}
vlog -sv -work work +incdir+/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules {/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules/altera_merlin_slave_translator.sv}
vlog -sv -work work +incdir+/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules {/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules/altera_merlin_slave_agent.sv}
vlog -sv -work work +incdir+/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules {/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules/altera_merlin_master_translator.sv}
vlog -sv -work work +incdir+/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules {/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules/altera_merlin_master_agent.sv}
vlog -sv -work work +incdir+/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules {/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules/altera_merlin_burst_uncompressor.sv}
vlog -sv -work work +incdir+/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules {/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules/altera_merlin_burst_adapter_uncmpr.sv}
vlog -sv -work work +incdir+/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules {/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules/altera_merlin_burst_adapter.sv}
vlog -sv -work work +incdir+/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules {/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules/altera_merlin_arbitrator.sv}
vlog -sv -work work +incdir+/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules {/home/ecegrid/a/695r11/ece695r/soc-project/accelerator_design/nios_system/synthesis/submodules/altera_customins_slave_translator.sv}

