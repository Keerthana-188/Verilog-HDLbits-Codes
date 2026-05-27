module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);//
    wire c1,c2;
    add16 keets(a[15:0],b[15:0],1'b0,sum[15:0],c1);
    add16 keets1(a[31:16],b[31:16],c1,sum[31:16],c2);

endmodule

module add1 ( input a, input b, input cin,   output sum, output cout );

	always @(*)begin
    case({a,b,cin})
        3'b000:begin
             sum=1'b0;
            cout=1'b0;end
        3'b001:begin
              sum=1'b1;
            cout=1'b0;end
        3'b010:begin
            sum=1'b1;
            cout=1'b0;end
        3'b011:begin
            sum=1'b0;
            cout=1'b1;end
        3'b100:begin
           sum=1'b1;
            cout=1'b0;end
        3'b101:begin
          sum=1'b0;
            cout=1'b1;end
        3'b110:begin
     sum=1'b0;
            cout=1'b1;end
        3'b111:begin
           sum=1'b1;
            cout=1'b1;end
    endcase
    end

endmodule


