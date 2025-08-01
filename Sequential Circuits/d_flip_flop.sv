// -------------------------------
// Module: Parameterized D Flip-Flop
// Description: This module implements a positive-edge triggered D Flip-Flop
//              with a parameterizable data width.
// -------------------------------

module d_flip_flop (
    input  logic clk,   // Clock input
    input  logic rst_n, // Active-low synchronous reset
    input  logic d,     // D input (data)
    output logic q      // Q output (data stored)
);

    // Always block triggered on the positive edge of clock
    always_ff @(posedge clk) begin
        if (!rst_n) begin
            // If reset is active (low), set output to zero
            q <= '0;
        end else begin
            // Otherwise, latch the input data to output
            q <= d;
        end
    end

endmodule
