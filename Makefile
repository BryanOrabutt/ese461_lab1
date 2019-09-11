#====================================================================================================
# Description:                 MakeFile
#                              
# Author:                      Bryan Orabutt, Washington University in St. Louis
#                              
# Email:                       borabutt@wustl.edu
#                             
# Version:                     1.00
#
# Rev History:  
#       <Author>        <Date>        <Hardware>     <Version>        <Description>
#    Bryan Orabutt   09/06/2019 11:22     --            1.00             Create
#====================================================================================================
src = problem1.v problem2.v problem3.v problem4.v problem5.v lab1_tb.v

vcs_flag = -full64 -PP +lint=all,noVCDE +v2k -timescale=1ns/10ps

all: simv

simv: $(src)
	vcs $(vcs_flag) $^

run: simv
	./simv +verbose=1

.PHONY: clean
clean : 
	rm -rf csrc
	rm -f simv
	rm -rf simv.daidir
	rm -f *.vcd
	rm -f ucli.key
	rm -f *.vcd.vpd
