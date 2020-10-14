
// fulladd4.v - 4-bit binary adder
//
// Chad Coates
// Oct 13, 2020
//
// Description:
// ------------
// 4-bit full adder
//
module fulladd4 (
	input logic  [3:0] a, b,
	input logic				 c_in,
	output logic [3:0] s,
	output logic		   c_out
);

logic C1, C2, C3;

fulladd fulladd0 (.s(s[0]),    .co(C1), .b(b[0]), .a(a[0]), .ci(c_in));
fulladd fulladd1 (.s(s[1]),    .co(C2), .b(b[1]), .a(a[1]), .ci(C1));
fulladd fulladd2 (.s(s[2]),    .co(C3), .b(b[2]), .a(a[2]), .ci(C2));
fulladd fulladd3 (.s(s[3]), .co(c_out), .b(b[3]), .a(a[3]), .ci(C3));

endmodule: fulladd4


