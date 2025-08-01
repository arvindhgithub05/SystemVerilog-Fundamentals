// ---------------------------------------------
// Module: N-bit Ring Counter
// Description:
//   - A ring counter rotates a single '1' through a register.
//   - At any time, only one bit is high, others are low.
//   - On reset, the MSB is set to 1, rest are 0.
//   - Shifts left (circularly) on every clock edge.
// ---------------------------------------------

module Ring_Counter #(
    parameter N = 4  // Width of the ring counter (must be >= 2)
)(
    input  logic clk,       // Clock input
    input  logic rst_n,     // Active-low synchronous reset
    output logic [N-1:0] q  // Output of the ring counter
);

    // Sequential logic block
    always_ff @(posedge clk) begin
        if (!rst_n) begin
            // On reset: set MSB to 1, rest to 0 (e.g., 1000 for N=4)
            q <= '0;
            q[N-1] <= 1'b1;
        end else begin
            // Rotate left: shift left and wrap MSB to LSB
            q <= {q[N-2:0], q[N-1]};
        end
    end

endmodule
