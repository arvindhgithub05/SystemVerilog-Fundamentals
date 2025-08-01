// -----------------------------------------------------
// Module: Divide-by-N Clock Divider
// Description:
//   - Divides input clock frequency by an even value N.
//   - Output toggles every N/2 clock cycles.
//   - Active-low synchronous reset.
//   - Only supports even N values (2, 4, 6, ...); for odd N, the duty cycle will not be 50%.
// -----------------------------------------------------

module clock_divider_by_n #(
    parameter N = 4  // Must be an even number
)(
    input  logic clk,      // Input clock
    input  logic rst_n,    // Active-low synchronous reset
    output logic clk_out   // Divided clock output
);

    // Internal counter to count clock edges
    logic [$clog2(N)-1:0] count;

    // Sequential logic: counter and clk_out toggle
    always_ff @(posedge clk) begin
        if (!rst_n) begin
            count   <= 0;
            clk_out <= 0;
        end else begin
            if (count == (N/2 - 1)) begin  
                count   <= 0;
                clk_out <= ~clk_out;  // Toggle the output clock
            end else begin
                count <= count + 1;
            end
        end
    end

endmodule
