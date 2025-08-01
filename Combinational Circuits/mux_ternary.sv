// Simple 4x1 MUX using ternary operator statement

module mux_ternary #(
    parameter WIDTH = 8,
    parameter SEL_BITS = 2
)(
    input  logic [WIDTH-1:0] in0, in1, in2, in3,    // 4 inputs
    input  logic [SEL_BITS-1:0] sel,               // Select
    output logic [WIDTH-1:0] out                   // Output
);

    // Assign output using nested ternary operators
    assign out = (sel == 2'b00) ? in0 :
                 (sel == 2'b01) ? in1 :
                 (sel == 2'b10) ? in2 :
                                 in3;

endmodule