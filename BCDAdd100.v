module top_module( 
    input  [399:0] a, b,   // 100 BCD digits packed into 400 bits
    input          cin,
    output         cout,
    output [399:0] sum
);

    wire [99:0] carry;

    // First digit adder uses cin
    bcd_fadd fa0 (
        .a   (a[3:0]),
        .b   (b[3:0]),
        .cin (cin),
        .cout(carry[0]),
        .sum (sum[3:0])
    );

    // Remaining 99 digit adders
    genvar i;
    generate
        for (i = 1; i < 100; i = i + 1) begin : ripple
            bcd_fadd fa (
                .a   (a[4*i+3 : 4*i]),
                .b   (b[4*i+3 : 4*i]),
                .cin (carry[i-1]),
                .cout(carry[i]),
                .sum (sum[4*i+3 : 4*i])
            );
        end
    endgenerate

    // Final carry-out
    assign cout = carry[99];

endmodule
