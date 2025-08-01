// Behavioural Modelling - Simple 4x1 MUX using case statement

module mux_case_4x1 #(
    parameter WIDTH = 8,
    parameter SEL_BITS = 2
)(
    input  logic [WIDTH-1:0] in0, in1, in2, in3,   // 4 individual inputs
    input  logic [SEL_BITS-1:0] sel,               // Select line
    output logic [WIDTH-1:0] out                   // Output
);

    always_comb begin
        case (sel)
            2'b00: out = in0;
            2'b01: out = in1;
            2'b10: out = in2;
            2'b11: out = in3;
            default: out = '0;                     // Default case to avoid latches
        endcase
    end

endmodule
