src = b_cntr.sv
tb  = tb.sv
sim = sim.vvp
dump = dump.vcd

build: $(src) $(tb)
	iverilog -g2012 -o $(sim) $(src) $(tb)

verify: $(dump)
	vvp $(sim)
	gtkwave $(dump)

.PHONY: test verify