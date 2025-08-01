module mux_dataflow #(
    parameter WIDTH = 8,
    parameter SEL_BITS = 2,
    parameter INPUTS = 4
)(
    input  logic [WIDTH-1:0] in [INPUTS-1:0], // Array of inputs
    input  logic [SEL_BITS-1:0] sel,          // Select lines
    output logic [WIDTH-1:0] out              // MUX output
);

    // Directly assign selected input to output using array indexing
    assign out = in[sel];

endmodule