// ----------------------------------------------------
// Module: Gray to Binary Converter
// Description:
//   - Converts N-bit Gray code to its equivalent binary value.
//   - Purely combinational logic.
//   - Parameterizable for different bit widths.
// ----------------------------------------------------

module gray_to_binary #(
    parameter N = 4  // Bit width
)(
    input  logic [N-1:0] gray_in,     // N-bit Gray code input
    output logic [N-1:0] binary_out   // N-bit binary output
);

    // Combinational logic for Gray to Binary conversion
    always_comb begin
        // MSB remains the same
        binary_out[N-1] = gray_in[N-1];

        // Each lower bit is XOR of previous binary and current gray bit
        for (int i = N-2; i >= 0; i--) begin
            binary_out[i] = binary_out[i+1] ^ gray_in[i];
        end
    end

endmodule
