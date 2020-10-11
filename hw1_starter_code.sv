/*
================================
Homework #1 Starter Code
ECE 508 WKSP:  (System)Verilog Workshop
by Roy Kravitz (03-Oct-2020)
================================
*/

// compare - compares two unsigned numbers 
//
// Roy Kravitz (roy.kravitz@pdx.edu)
// Copyright, Portland State University 2016-2020
//
// Description:
// ------------
// Compares two unsigned numbers and signals whether the first number (a) is
// greater than and/or equal to the second (b).  a < b would be indicated as
//    assign lt = ~gt * ~eq
//
// There is a single parameter SIZE (default 4 bits) that can be used
// to specify the size of the compare.  Any numbers that require more
// bits than SIZE will be truncated
//
module compare
#(
	parameter SIZE = 4
)
(
	input logic	[SIZE-1:0]		a,			// number to compare
	input logic	[SIZE-1:0]		b,			// number to compare against
	output logic				gt,			// asserted high if a > b, low otherwise
	output logic				eq			// asserted high if a == b, low otherwise
);

assign gt = a > b;
assign eq = a == b;

endmodule: compare


// mux2to1_nbits - parameterized 2:1 multiplexer
//
//
// Roy Kravitz (roy.kravitz@pdx.edu)
// Copyright, Portland State University 2016-2020
//
// Description:
// ------------
// Implements a 2:1 multiplexer.  The single parameter SIZE (default 4 bits) that can be used
// to specify the size of the multiplexer inputs and outputs
//
module mux2to1_nbits
#(
	parameter SIZE = 4
)
(
	input logic	[SIZE-1:0]		a,			// number to compare
	input logic	[SIZE-1:0]		b,			// number to compare against
	input logic					sel,		// selects a if asserted high, b if asserted low
	output logic	[SIZE-1:0]	out			// multiplexer output
);

assign out = sel ? a : b;

endmodule: mux2to1_nbits



// fulladd - one bit full adder using Verilog gate-level modeling
//
// <your name>
// <date>
//
// Description:
// ------------
// <your description of what the module does>
//
module fulladd (
	input logic		a, b,
	input logic		ci,
	output logic	s,
	output logic	co
);

// ADD YOUR CODE HERE

endmodule: fulladd


// fulladd4.v - 4-bit binary adder
//
// <your name>
// <date>
//
// Description:
// ------------
// <your description of what the module does>
//
module fulladd4 (
	input logic	[3:0]		a, b,
	input logic				c_in,
	output logic	[3:0]	s,
	output logic			c_out
);

// ADD YOUR CODE HERE

endmodule: fulladd4


// bcd_adder.v - 4-bit BCD Adder with illegal input detection using Verilog dataflow modeling
//
// <your name>
// <date>
//
// Description:
// ------------
// <your description of what the module does>
//
module bcd_adder (
	input logic	[3:0]		X, Y,
	input logic				c_in,
	output logic			c_out,
	output logic	[7:0]	result,
	output logic			out_of_range
);

// ADD YOUR CODE HERE

endmodule: bcd_adder
