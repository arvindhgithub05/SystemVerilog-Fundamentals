// ----------------------------------------------------
// Module: Binary to Gray Code Converter
// Description:
//   - Converts N-bit binary input to its equivalent Gray code.
//   - Gray code: Only one bit changes between adjacent values.
//   - Purely combinational logic.
// ----------------------------------------------------

module binary_to_gray #(
    parameter N = 4  // Bit width (can be changed to 8, 16, etc.)
)(
    input  logic [N-1:0] binary_in,  // N-bit binary input
    output logic [N-1:0] gray_out    // N-bit gray code output
);

    // Combinational logic for Binary to Gray conversion
    always_comb begin
        // MSB remains the same
        gray_out[N-1] = binary_in[N-1];

        // Each lower bit is XOR of current and next higher binary bit
        for (int i = N-2; i >= 0; i--) begin
            gray_out[i] = binary_in[i+1] ^ binary_in[i];
        end
    end

endmodule
