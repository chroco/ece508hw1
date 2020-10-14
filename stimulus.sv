/*
================================
Homework #1 4-bit BCD Adder testbench
ECE 508 WKSP:  (System)Verilog Workshop
by Roy Kravitz (03-Oct-2020)
================================
*/

// stimulus.sv - stimulus module for 4-bit BCD adder
//
//
// Roy Kravitz (roy.kravitz@pdx.edu)
// Copyright, Portland State University 2016-2020
//
// Description:
// ------------
// Test bench for 4-bit BCD adder.  Drives all input combinations and displays the results.  Since all of the inputs
// are tested the out-of-range cases should also be covered.  Populates and makes use of single test vector array that
// contains the X and Y and carry-in inputs.  Makes use of a clock to go from test case to test case even though the circuit,
// itself, is purely combinatorial
//
module stimulus;

parameter		tva_size = 512;					// number of test vectors in test vector array

logic 			clk;							// clock is used to advance the test vector pointer
logic	[8:0]	testvectors[0 : tva_size-1];	// contains test vectors of the form {carry_in, X[3:0, Y[3:0]}
logic	[3:0]	x, y;							// x and y inputs to the BCD adder. Pulled out of the test vector array
logic			cin;							// carry-in to the BCD adder.  Pulled out of the test vector array

logic			cout, error;					// carry out and out-of-range error outputs
logic	[7:0]	rslt;							// packed BCD result of the add	
int				tvi;							// test vector index

// instantiate the design block
bcd_adder BCDADD (
	.X(x),
	.Y(y),
	.c_in(cin),
	.c_out(cout),
	.result(rslt),
	.out_of_range(error)
);

// Generate the test vector clock
initial clk = 1'b0;
always #5 clk = ~clk;

// populate the test vector array
initial begin: populate_test_vectors
	int i, j;
	
	// start w/ carry-in = 0 and iterate through all of the input combinations;
	tvi = 0;	
	for (i = 0; i < 16; i++) begin
		for (j = 0; j < 16; j++) begin
			testvectors[tvi][8] = 1'b0;
			testvectors[tvi][7:4] = i % 16;
			testvectors[tvi][3:0] = j % 16;
			tvi = tvi + 1;
		end
	end
	
	// set carry-in = 1 and iterate through all of the input combinations
	tvi = tva_size / 2;
	for (i = 0; i < 16; i++) begin
		for (j = 0; j < 16; j++) begin
			testvectors[tvi][8] = 1'b1;
			testvectors[tvi][7:4] = i % 16;
			testvectors[tvi][3:0] = j % 16;
			tvi = tvi + 1;
		end
	end	
		
	// re-initialize the test vector index to prepare for testing
	tvi = 0;
end: populate_test_vectors

// Monitor the outputs 
initial begin: monitor_outputs
	$monitor($time, "\tX: %d\tY: %d\t Cin: %b\t\tError: %b\tResult: %d %d\tCout: %b", x, y, cin, error, rslt[7:4], rslt[3:0], cout);
end: monitor_outputs


// run the test
always @(posedge clk) begin: run_test
	cin <= testvectors[tvi][8];
	x <= testvectors[tvi][7:4];
	y <= testvectors[tvi][3:0];
	tvi <= tvi + 1;
	if (tvi >= tva_size)
		$stop;
end: run_test

endmodule: stimulus
