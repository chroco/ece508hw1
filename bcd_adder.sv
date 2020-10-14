
// bcd_adder.v - 4-bit BCD Adder with illegal input
// detection using Verilog dataflow modeling
//
// Chad Coates
// Oct 13, 2020
//
// Description:
// ------------
// 4-bit BCD adder
//

module bcd_adder (
	input logic	  [3:0]	X, Y,
	input logic         c_in,
	output logic        c_out,
	output logic	[7:0]	result,
	output logic  			out_of_range
);

logic C0, C1, adjust, gt0, gt1, gt2, eq0, eq1, eq2; 
logic [3:0] sum1, sum2, muxout;

compare comp0 (.gt(gt0), .eq(eq0), .a(X[3:0]), .b(4'b1001));
compare comp1 (.gt(gt1), .eq(eq1), .a(Y[3:0]), .b(4'b1001));

or or0 (out_of_range, gt0, gt1); // check for out of range (>9)

fulladd4 fulladd4_1 ( // add X and Y
  .s(sum1[3:0]), 
  .c_out(C0), 
  .a(X[3:0]), 
  .b(Y[3:0]), 
  .c_in(c_in)
);

// check to see if the sum of the first add is > 9
compare comp3 (.gt(gt2), .eq(eq2), .a(sum1[3:0]), .b(4'b1001));

// if carryout == 1 or sum > 9 then adjust == 1;
or or1 (adjust, C0, gt2);

// if sel ==  then muxout gets 0 if sel == 1 muxout gets 6
mux2to1_nbits mux (
  .out(muxout[3:0]), 
  .sel(adjust),
  .a(4'b0110), 
  .b(4'b0000)
);

// add muxout and the sum of the first add
fulladd4 fulladd4_2 (
  .s(sum2[3:0]), 
  .c_out(C1), 
  .a(muxout[3:0]), 
  .b(sum1[3:0]), 
  .c_in(C0)
);

or or2(c_out, C1, C0);  

assign result[7:0] = {3'b000, c_out, sum2[3:0]};

endmodule: bcd_adder
