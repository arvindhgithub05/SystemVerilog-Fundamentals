// -------------------------------
// Module: N-bit Register
// Description: A parameterized register built using the reusable D flip-flop module.
// -------------------------------

module register_nbit #(
    parameter N = 8  // Default width of the register is 8 bits
)(
    input  logic          clk,     // Clock signal
    input  logic          rst_n,   // Active-low synchronous reset
    input  logic [N-1:0]  d_in,    // N-bit input data
    output logic [N-1:0]  q_out    // N-bit output data
);

    // Instantiate the N-bit D flip-flop:  it's effectively a bank of N flip-flops, implemented as a vector
    // Clean, scalable, used in real RTL design
    d_flip_flop #(.WIDTH(N)) u_dff_nbit (
        .clk(clk),
        .rst_n(rst_n),
        .d(d_in),
        .q(q_out)
    );

    /*
    // Manual N Instances using generate block
    genvar i;
    generate
        for (i = 0; i < N; i++) begin : gen_dffs
            d_flip_flop #(.WIDTH(1)) u_dff (
                .clk(clk),
                .rst_n(rst_n),
                .d(d_in[i]),
                .q(q_out[i])
            );
        end
    endgenerate
    */

endmodule
