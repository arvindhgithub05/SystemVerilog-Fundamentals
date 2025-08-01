module half_adder #(
    parameter WIDTH = 1
)(
    input  logic [WIDTH-1:0] a,
    input  logic [WIDTH-1:0] b,
    output logic [WIDTH-1:0] sum,
    output logic [WIDTH-1:0] carry
);
    always_comb begin
        sum   = a ^ b;
        carry = a & b;
    end
endmodule

module full_adder_using_half #(
    parameter WIDTH = 1
)(
    input  logic [WIDTH-1:0] a,
    input  logic [WIDTH-1:0] b,
    input  logic [WIDTH-1:0] cin,
    output logic [WIDTH-1:0] sum,
    output logic [WIDTH-1:0] carry
);

    // Intermediate signals
    logic [WIDTH-1:0] sum1, carry1, carry2;

    // First Half Adder: a + b
    half_adder #(.WIDTH(WIDTH)) HA1 (
        .a(a),
        .b(b),
        .sum(sum1),
        .carry(carry1)
    );

    // Second Half Adder: sum1 + cin
    half_adder #(.WIDTH(WIDTH)) HA2 (
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

module ripple_carry_adder_4bit (
    input  logic [3:0] a,       // 4-bit input A
    input  logic [3:0] b,       // 4-bit input B
    input  logic       cin,     // Initial carry-in
    output logic [3:0] sum,     // 4-bit output sum
    output logic       cout     // Final carry-out
);

    // Intermediate carry signals
    logic c1, c2, c3;

    // First full adder (bit 0)
    full_adder_using_half fa0 (
        .a    (a[0]),
        .b    (b[0]),
        .cin  (cin),
        .sum  (sum[0]),
        .carry(c1)
    );

    // Second full adder (bit 1)
    full_adder_using_half fa1 (
        .a    (a[1]),
        .b    (b[1]),
        .cin  (c1),
        .sum  (sum[1]),
        .carry(c2)
    );

    // Third full adder (bit 2)
    full_adder_using_half fa2 (
        .a    (a[2]),
        .b    (b[2]),
        .cin  (c2),
        .sum  (sum[2]),
        .carry(c3)
    );

    // Fourth full adder (bit 3)
    full_adder_using_half fa3 (
        .a    (a[3]),
        .b    (b[3]),
        .cin  (c3),
        .sum  (sum[3]),
        .carry(cout)
    );

endmodule
