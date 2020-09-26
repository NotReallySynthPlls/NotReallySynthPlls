###########################################################################################
# EE241B Lab Makefile
###########################################################################################

###########################################################################################
# General Variables
###########################################################################################
base_dir = $(abspath .)
src_dir = $(base_dir)/src/
ENV_YML ?= env.yml
INPUT_CONFS ?= pll.yml
HAMMER_EXEC ?= hammer-vlsi
OBJ_DIR ?= build
vsrcs = \
	$(src_dir)/dco.v \


##########################################################################################
# RTL Simulation
##########################################################################################
.PHONY: rtl-sim

rtl-sim: $(INPUT_CONFS)
	$(HAMMER_EXEC) sim -e $(ENV_YML) -p $(INPUT_CONFS) -p sim_config.yml -p rtl_sim_config.yml --obj_dir $(OBJ_DIR)

##########################################################################################
# AUTO BUILD FLOW
##########################################################################################

.PHONY: buildfile
buildfile: $(OBJ_DIR)/hammer.d $(vsrcs)
# Tip: Set HAMMER_D_DEPS to an empty string to avoid unnecessary RTL rebuilds
# TODO: make this dependency smarter so that we don't need this at all
HAMMER_D_DEPS ?= 
$(OBJ_DIR)/hammer.d: $(HAMMER_D_DEPS)
	$(HAMMER_EXEC) build -e $(ENV_YML) $(foreach x,$(INPUT_CONFS) , -p $(x)) --obj_dir $(OBJ_DIR)

-include $(OBJ_DIR)/hammer.d

#########################################################################################
# general cleanup rule
#########################################################################################
.PHONY: clean
clean:
	rm -rf build hammer-vlsi*.log __pycache__ output.json


