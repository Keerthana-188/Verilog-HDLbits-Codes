module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,output c1,
    output [31:0] sum
);
    wire [31:0]sub1;
    wire [31:0]b1;
    assign sub1={32{sub}};
    always @(*)begin
        case(sub1)
            {32{1'b0}}:b1=b;
            {32{1'b1}}:b1=~b;endcase
    end
            add16 prithiv(a[15:0],b1[15:0],sub,sum[15:0],c1);
            add16 prithiv2(a[31:16],b1[31:16],c1,sum[31:16]);

endmodule
