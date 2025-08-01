// -------------------------------------------------------
// Module: N-bit Shift Register (Right Shift)
// Description:
//   - Shifts bits to the right on each clock edge.
//   - Serial data comes in from the MSB side.
//   - Active-low synchronous reset.
//   - Parameterized width (N).
// -------------------------------------------------------

module shift_register #(
    parameter N = 8  // Width of the shift register
)(
    input  logic clk,         // Clock input
    input  logic rst_n,       // Active-low synchronous reset
    input  logic serial_in,   // Serial data input (MSB side)
    output logic [N-1:0] q    // Register output
);

    // Sequential logic for shifting
    always_ff @(posedge clk) begin
        if (!rst_n) begin
            // Reset the register to 0
            q <= '0;
        end else begin
            // Right shift by 1, input comes in from MSB
            q <= {serial_in, q[N-1:1]};
        end
    end

endmodule
