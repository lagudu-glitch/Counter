Implementation of a free running counter. Increments value from 0 at the positive edge of every clock cycle. It is an 8-bit counter so the max value it can count till is 255 without overflow. Testbench for testing is present in the repo. 
Makefile also persent./n  
Make file commands:
'''
make build
'''
Compiles the the counter with the test bench.
'''
make verify
'''
Runs the simulation and opens gtkwave to where you can see the signal dump
