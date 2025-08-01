// ------------------------------------------------
// Module: N-bit Johnson Counter
// Description:
//   - A Johnson counter is a twisted ring counter.
//   - It shifts the bits to the left,
//     and inserts the inverted MSB into LSB.
//   - Produces 2N unique states before repeating.
//   - On reset, the counter is initialized to all 0s.
// ------------------------------------------------

module johnson_counter #(
    parameter N = 4  // Width of the counter (must be >= 2)
)(
    input  logic clk,       // Clock input
    input  logic rst_n,     // Active-low synchronous reset
    output logic [N-1:0] q  // Output of the counter
);

    // Sequential logic
    always_ff @(posedge clk) begin
        if (!rst_n) begin
            // On reset: set all bits to 0
            q <= '0;
        end else begin
            // Shift left, insert inverted MSB at LSB
            q <= {q[N-2:0], ~q[N-1]};
        end
    end

endmodule
