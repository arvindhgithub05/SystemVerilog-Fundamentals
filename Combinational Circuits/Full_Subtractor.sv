module Half_Subtractor (
    input  logic a, b,       // Inputs: a - b
    output logic diff,       // Difference output
    output logic borrow      // Borrow output
);

    always_comb begin
        diff   = a ^ b;       // XOR gives difference
        borrow = ~a & b;      // Borrow when a=0 and b=1
    end

endmodule

module Full_Subtractor (
    input  logic a, b, bin,     // Inputs: a - b - bin
    output logic diff,          // Final difference
    output logic bout           // Final borrow out
);

    logic diff1, borrow1, borrow2;

    // First half subtractor: a - b
    half_subtractor hs1 (
        .a(a),
        .b(b),
        .diff(diff1),
        .borrow(borrow1)
    );

    // Second half subtractor: (a - b) - bin
    half_subtractor hs2 (
        .a(diff1),
        .b(bin),
        .diff(diff),
        .borrow(borrow2)
    );

    // Final borrow: borrow1 OR borrow2
    assign bout = borrow1 | borrow2;

endmodule
