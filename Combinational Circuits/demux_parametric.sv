module demux_parametric #(
    parameter OUTPUTS = 8,                          // Number of output lines
    parameter SEL_BITS = $clog2(OUTPUTS),           // Select bits
    parameter DATA_WIDTH = 1                        // Width of data input/output
)(
    input  logic [DATA_WIDTH-1:0]  data_in,          // Input data line
    input  logic [SEL_BITS-1:0]    sel,              // Select lines
    output logic [DATA_WIDTH-1:0]  data_out[OUTPUTS] // Output array
);

    integer i;

    always_comb begin
        // Default: zero all outputs
        for (i = 0; i < OUTPUTS; i++) begin
            data_out[i] = '0;
        end

        // Set only selected output to data_in
        data_out[sel] = data_in;
    end

endmodule
