module comparator_parametric #(
    parameter WIDTH = 8  // Bit-width of inputs
)(
    input  logic [WIDTH-1:0] a,  // First input
    input  logic [WIDTH-1:0] b,  // Second input
    output logic a_gt_b,         // a > b
    output logic a_lt_b,         // a < b
    output logic a_eq_b          // a == b
);

    always_comb begin
        a_gt_b = 0;
        a_lt_b = 0;
        a_eq_b = 0;

        if (a > b)
            a_gt_b = 1;
        else if (a < b)
            a_lt_b = 1;
        else
            a_eq_b = 1;
    end

endmodule
