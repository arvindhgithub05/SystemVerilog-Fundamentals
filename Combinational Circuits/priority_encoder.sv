module priority_encoder #(
    parameter WIDTH = 8,
    parameter OUT_BITS = $clog2(WIDTH)
)(
    input  logic [WIDTH-1:0] in,
    output logic [OUT_BITS-1:0] out,
    output logic valid
);

    integer i;

    always_comb begin
        out = '0;
        valid = 1'b0;
        for (i = WIDTH-1; i >= 0; i--) begin
            if (in[i]) begin
                out = i[OUT_BITS-1:0];
                valid = 1'b1;
                break;
            end
        end
    end

endmodule
