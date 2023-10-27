# Makefile
# See https://docs.cocotb.org/en/stable/quickstart.html for more info

# Defaults
SIM ?= icarus
TOPLEVEL_LANG ?= verilog

# normal simulation
ifneq ($(GATES),yes)

# this is the only part you should need to modify:
VERILOG_SOURCES += $(PWD)/tb.v $(PWD)/tt_um_joerdsonsilva_top.v $(PWD)/modem.v $(PWD)/bask.v $(PWD)/mult1.v $(PWD)/clk_rdg1.v $(PWD)/rdg1.v $(PWD)/ffd1.v $(PWD)/wave11.v $(PWD)/bfsk.v $(PWD)/clk_rdg2.v $(PWD)/clk_25MHz.v $(PWD)/wave12.v $(PWD)/wave22.v $(PWD)/rdg2.v $(PWD)/ffd2.v $(PWD)/freq_select.v $(PWD)/bpsk.v $(PWD)/clk_rdg3.v $(PWD)/rdg3.v $(PWD)/ffd3.v $(PWD)/wave13.v $(PWD)/wave23.v $(PWD)/control_0.v $(PWD)/demod_bask.v $(PWD)/demod_bfsk.v $(PWD)/wave122.v $(PWD)/mult2.v $(PWD)/integrator2.v $(PWD)/demod_bpsk.v $(PWD)/wave133.v $(PWD)/mult3.v $(PWD)/integrator3.v $(PWD)/control_1.v

else

# gate level simulation requires some extra setup, you shouldn't need to touch this
COMPILE_ARGS    += -DGL_TEST
COMPILE_ARGS    += -DFUNCTIONAL
COMPILE_ARGS    += -DUSE_POWER_PINS
COMPILE_ARGS    += -DSIM
COMPILE_ARGS    += -DUNIT_DELAY=\#1
VERILOG_SOURCES += $(PDK_ROOT)/sky130A/libs.ref/sky130_fd_sc_hd/verilog/primitives.v
VERILOG_SOURCES += $(PDK_ROOT)/sky130A/libs.ref/sky130_fd_sc_hd/verilog/sky130_fd_sc_hd.v

# this gets copied in by the GDS action workflow
VERILOG_SOURCES += $(PWD)/tb.v $(PWD)/gate_level_netlist.v
endif

# TOPLEVEL is the name of the toplevel module in your Verilog or VHDL file
TOPLEVEL = tb

# MODULE is the basename of the Python test file
MODULE = test

# include cocotb's make rules to take care of the simulator setup
include $(shell cocotb-config --makefiles)/Makefile.sim
