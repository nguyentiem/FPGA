quietly set ACTELLIBNAME proasic3
quietly set PROJECT_DIR "C:/Documents and Settings/ktmt/Desktop/DIP_SWITCH"

if {[file exists presynth/_info]} {
   echo "INFO: Simulation library presynth already exists"
} else {
   vlib presynth
}
vmap presynth presynth
vmap proasic3 "D:/Libero_v9.1/Designer/lib/modelsim/precompiled/vhdl/proasic3"

vcom -93 -explicit -work presynth "${PROJECT_DIR}/stimulus/mytestbench.vhd"

vsim -L proasic3 -L presynth  -t 1ps presynth.testbench
add wave /testbench/*
run 1000ns
