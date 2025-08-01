module half_adder (
    input  logic a, b,
    output logic sum, carry
);
    always_comb begin
        sum   = a ^ b;
        carry = a & b;
    end
endmodule

module full_adder (
    input  logic a, b, cin,
    output logic sum, cout
);

    logic sum1, carry1, carry2;

    // First half adder
    half_adder ha1 (
        .a(a), .b(b),
        .sum(sum1), .carry(carry1)
    );

    // Second half adder
    half_adder ha2 (
        .a(sum1), .b(cin),
        .sum(sum), .carry(carry2)
    );

    // Final carry-out
    assign cout = carry1 | carry2;

endmodule

module ripple_carry_adder #(
    parameter N = 4  // Number of bits
)(
    input  logic [N-1:0] a, b,
    input  logic cin,
    output logic [N-1:0] sum,
    output logic cout
);

    logic [N:0] carry;
    assign carry[0] = cin;

    genvar i;
    generate
        for (i = 0; i < N; i++) begin : full_adder_stage
            full_adder fa (
                .a(a[i]),
                .b(b[i]),
                .cin(carry[i]),
                .sum(sum[i]),
                .cout(carry[i+1])
            );
        end
    endgenerate

    assign cout = carry[N];

endmodule
