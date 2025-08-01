// Data Flow Modelling

module encoder_dataflow #(
    parameter WIDTH = 8,
    parameter OUT_BITS = 3
)(
    input  logic [WIDTH-1:0] in,
    output logic [OUT_BITS-1:0] out
);

    assign out = (in[7]) ? 3'd7 :
                 (in[6]) ? 3'd6 :
                 (in[5]) ? 3'd5 :
                 (in[4]) ? 3'd4 :
                 (in[3]) ? 3'd3 :
                 (in[2]) ? 3'd2 :
                 (in[1]) ? 3'd1 :
                 (in[0]) ? 3'd0 : 3'd0;  // Default case

endmodule
