@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.2\\bin
call %xv_path%/xelab  -wto 0ef737e99ea841a797541fd344fe4a8d -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot mips_single_cycle_tb_behav xil_defaultlib.mips_single_cycle_tb -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
