# instruction: run 'make' for alu or set MODULE=<datapath module>
# this handles compiling and running automatically

MODULE ?= cpu_top
DATAPATH_DIR = datapath
TESTBENCH_DIR = testbench
SIM_OUTPUT_DIR = sim_output

# tool setup
CC = iverilog
CFLAGS = -g2012
SIM = vvp
WAVES = gtkwave
SEED ?= $(shell date +%s%N)

# file naming
OUT = $(SIM_OUTPUT_DIR)/$(MODULE)_sim.vvp
VCD = $(SIM_OUTPUT_DIR)/$(MODULE)_waves.vcd
SRCS = $(DATAPATH_DIR)/*.sv $(TESTBENCH_DIR)/$(MODULE)_tb.sv

all: compile run

# compile sv files
compile: $(SIM_OUTPUT_DIR)
	$(CC) $(CFLAGS) -o $(OUT) $(SRCS)

# run simulation and print results
run: compile
	cd $(SIM_OUTPUT_DIR) && $(SIM) $(notdir $(OUT)) +SEED=$(SEED)

# open waveforms in background
view: run
	$(WAVES) $(VCD) &

# create output directory if missing
$(SIM_OUTPUT_DIR):
	mkdir -p $(SIM_OUTPUT_DIR)

# clean up junk files
clean:
	rm -rf $(SIM_OUTPUT_DIR)