@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.2\\bin
call %xv_path%/xsim mips_single_cycle_tb_behav -key {Behavioral:sim_1:Functional:mips_single_cycle_tb} -tclbatch mips_single_cycle_tb.tcl -view C:/Users/agbas/Desktop/645/Final_Project_MIPS_Alex_Griffin/Final_Project_MIPS_Single_Cycle/07_MIPS_Single_Cycle/simulation_sources/mips_single_cycle_wave.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
