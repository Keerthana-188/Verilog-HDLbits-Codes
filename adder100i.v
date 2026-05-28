module top_module( 
    input  [99:0] a, b,
    input         cin,
    output [99:0] cout,
    output [99:0] sum
);

    integer i;
    reg [99:0] sum_reg;
    reg [99:0] cout_reg;
    reg carry;

    always @* begin
        carry = cin;
        for (i = 0; i < 100; i = i + 1) begin
            sum_reg[i]  = a[i] ^ b[i] ^ carry;
            cout_reg[i] = (a[i] & b[i]) | (a[i] & carry) | (b[i] & carry);
            carry       = cout_reg[i];   // ripple forward
        end
    end

    assign sum  = sum_reg;
    assign cout = cout_reg;

endmodule
