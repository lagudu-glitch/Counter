`timescale 1ms/10ns

module tb ();
	localparam T=10;
	logic clk, rst, en;
	logic [7:0] Q;

	//*********************************************************************
	// DUT instantiation
	//*********************************************************************
	b_cntr test (.clk(clk), .rst(rst), .en(en), .Q(Q));

	//*********************************************************************
	// clock
	//*********************************************************************
	always begin
		clk = 1'b1;
		#(T/2);
		clk = 1'b0;
		#(T/2);
	end

	//*********************************************************************
	// reset high for the first cycle
	//*********************************************************************
	initial begin
		rst = 1'b1;
		#T;
		rst = 1'b0;
	end

	//*********************************************************************
	// Test
	//*********************************************************************
	initial begin
		// Wait for reset to go low
		@(negedge rst);          
		$monitor("Q=%b", Q);

		//*****************************************************************
		// Enable is 1
		//*****************************************************************
		en = 1;
		// Wait for 100 negative edges of clk
		repeat (100) @(negedge clk);

		//*****************************************************************
		// Enable is 0
		//*****************************************************************
		en = 0;
		// Wait for 100 negative edges of clk
		repeat (100) @(negedge clk);
		en = 1;

		// continue till q = 255
		wait (Q == 255);

		// Finsh Simulation
        $finish();
		$display("TEST COMPLETE");
	end

	//********************************************************************
	// Dump the signals and variables
	//********************************************************************
	initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb); 
    end

endmodule
