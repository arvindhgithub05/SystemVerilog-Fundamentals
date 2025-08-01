// Behavioural Modelling - Simple 4x1 MUX using if-else

module mux_ifelse #(
    parameter WIDTH = 8,
    parameter SEL_BITS = 2
)(
    input  logic [WIDTH-1:0] in0, in1, in2, in3,    // 4 individual inputs
    input  logic [SEL_BITS-1:0] sel,               // Select line (2-bit)
    output logic [WIDTH-1:0] out                   // MUX output
);

    // Combinational logic block
    always_comb begin
        if (sel == 2'b00)
            out = in0;
        else if (sel == 2'b01)
            out = in1;
        else if (sel == 2'b10)
            out = in2;
        else
            out = in3;
    end

endmodule