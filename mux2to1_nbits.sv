// mux2to1_nbits - parameterized 2:1 multiplexer
//
//
// Roy Kravitz (roy.kravitz@pdx.edu)
// Copyright, Portland State University 2016-2020
//
// Description:
// ------------
// Implements a 2:1 multiplexer.  The single 
// parameter SIZE (default 4 bits) that can be used
// to specify the size of the multiplexer inputs and 
// outputs
//

module mux2to1_nbits
#(
	parameter SIZE = 4
)
(
	input logic	[SIZE-1:0] a, 	// number to compare
	input logic	[SIZE-1:0] b, 	// number to compare against
	input logic					   sel, // selects a if asserted high, b if asserted low
	output logic [SIZE-1:0] out	// multiplexer output
);

assign out = sel ? a : b;

endmodule: mux2to1_nbits

