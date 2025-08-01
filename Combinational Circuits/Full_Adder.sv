module full_adder_using_half (
    input  logic a,
    input  logic b,
    input  logic cin,
    output logic sum,
    output logic carry
);

    // Intermediate signals
    logic sum1, carry1, carry2;

    // First Half Adder: a + b
    half_adder  HA1 (
        .a(a),
        .b(b),
        .sum(sum1),
        .carry(carry1)
    );

    // Second Half Adder: sum1 + cin
    half_adder HA2 (
        .a(sum1),
        .b(cin),
        .sum(sum),
        .carry(carry2)
    );

    // Final carry: OR of both half adder carries
    always_comb begin
        carry = carry1 | carry2;
    end

endmodule
