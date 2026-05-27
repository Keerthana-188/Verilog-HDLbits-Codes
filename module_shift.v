module top_module ( input clk, input d, output q );
    wire q1,q2;
    my_dff prithiv(clk,d,q1);
    my_dff prithiv2(clk,q1,q2);
    my_dff prithiv3(clk,q2,q);

endmodule
