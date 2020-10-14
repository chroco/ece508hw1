module test_fa;

logic [4:0] i, j, k;
logic [3:0] s1, a1, b1, sum, muxout;
logic co, s, ci, a, b, co1, ci1, adjust;

fulladd fa (.co(co), .s(s), .ci(ci), .a(a), .b(b));
fulladd4 fa4 (
  .s(s1[3:0]), 
  .c_out(co1), 
  .c_in(ci1), 
  .a(a1[3:0]), 
  .b(b1[3:0])
);

compare comp (.gt(gt), .eq(eq), .a(sum[3:0]), .b(4'b1001));
mux2to1_nbits mux (
  .out(muxout[3:0]),
  .sel(adjust),
  .a(4'b0110),
  .b(4'b0000)
);


initial
  begin
    $display("ABC co s");
    for(i=4'b0;i<4'b1000;i=i+1'b1)begin
      {b,a,ci}=i[2:0];
      #20;
      $display("%b   %b   %b",i[2:0],co,s);
    end
    
    
    for(k=4'b0;k<4'b0010;k=k+1'b1)begin
      ci1 = k;
      $display("a      b      s      co  ci");
      for(i=5'b0;i<5'b10000;i=i+1'b1)begin
        for(j=5'b0;j<5'b10000;j=j+1'b1)begin
          a1[3:0] = i[3:0];
          b1[3:0] = j[3:0];
          #20;
          $display("%b   %b   %b   %b   %b",i[3:0],j[3:0],s1,co1,ci1);
        end
      end
    end

    $display("sum    gt  eq");
    for(i=5'b0;i<5'b10000;i=i+1'b1)begin
      sum[3:0] = i[3:0];
      #20;
      $display("%b   %b   %b",i[3:0],gt,eq);
    end
   
    for(k=4'b0;k<4'b0010;k=k+1'b1)begin
      adjust = k[0];
      #20;
      $display("%b %b",k[0],muxout[3:0]);
    end

    $finish();
  end
endmodule: test_fa

