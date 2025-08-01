module encoder_parametric #(
    parameter WIDTH = 8,
    parameter OUT_BITS = $clog2(WIDTH)
)(
    input  logic [WIDTH-1:0] in,
    output logic [OUT_BITS-1:0] out
);

    integer i;

    always_comb begin
        out = '0;  // Default output to avoid latches
        for (i = 0; i < WIDTH; i++) begin
            if (in[i]) begin
                out = i[OUT_BITS-1:0];
            end
        end
    end

endmodule
