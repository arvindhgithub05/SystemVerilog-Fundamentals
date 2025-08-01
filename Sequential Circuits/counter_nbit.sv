// ----------------------------------------------------
// Module: N-bit Binary Up Counter
// Description:
//   - Increments by 1 on each positive clock edge.
//   - Has an active-low synchronous reset.
//   - Parameterized width (N) for flexibility.
// ----------------------------------------------------

module counter_nbit #(
    parameter N = 8  // Width of the counter (default is 8 bits)
)(
    input  logic clk,        // Clock input
    input  logic rst_n,      // Active-low synchronous reset
    output logic [N-1:0] q   // Current counter value
);

    // Sequential logic
    always_ff @(posedge clk) begin
        if (!rst_n) begin
            // Reset counter to 0
            q <= '0;
        end else begin
            // Increment counter by 1
            q <= q + 1;
        end
    end

    /*
    // To instantiate a 4-bit counter
    
    counter_nbit #(.N(4)) u_counter4 (
    .clk(clk),
    .rst_n(rst_n),
    .q(count_4bit)
    );
    */

endmodule
