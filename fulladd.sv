// fulladd - one bit full adder using Verilog 
// gate-level modeling
//
// Chad Coates
// Oct 13, 2020
//
// Description:
// ------------
// 1-bit full adder
//

module fulladd (
	input logic		a, b,
	input logic		ci,
	output logic	s,
	output logic	co
);

logic xor0out, and0out, and1out, notOut;

xor 
  xor0 (xor0out, a, b),
  xor1 (s, ci, xor0out);
and 
  and0 (and0out, ci, xor0out),
  and1 (and1out, b, not0out);
not 
  not0 (not0out, xor0out);
or
  or0 (co, and0out, and1out);

endmodule: fulladd

