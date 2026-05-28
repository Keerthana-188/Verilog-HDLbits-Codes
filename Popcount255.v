module top_module( 
    input [254:0] in,
    output [7:0] out );
    integer i;
    reg [7:0] count;

    always @* begin
        count = 8'd0;               // start from zero
        for (i = 0; i < 255; i = i + 1) begin
            count = count + in[i];  // add each bit (0 or 1)
        end
    end

    assign out = count;

endmodule
