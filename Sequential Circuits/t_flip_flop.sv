// ---------------------------------------------
// Module: 1-bit T Flip-Flop
// Description:
//   - Implements a T (Toggle) Flip-Flop using a 1-bit D Flip-Flop.
//   - When T=1, output toggles on each clock.
//   - When T=0, output holds its value.
//   - Active-low synchronous reset sets output to 0.
// ---------------------------------------------

module t_flip_flop (
    input  logic clk,     // Clock input
    input  logic rst_n,   // Active-low synchronous reset
    input  logic t,       // T input (Toggle control)
    output logic q        // Output
);

    // Internal wire to hold the next value for D input
    logic d;

    // D = T ^ Q --> Toggles output when T=1, holds when T=0
    assign d = t ^ q;

    // Instantiate 1-bit D Flip-Flop (your parameterized module)
    d_flip_flop u_dff (
        .clk(clk),
        .rst_n(rst_n),
        .d(d),
        .q(q)
    );

endmodule
