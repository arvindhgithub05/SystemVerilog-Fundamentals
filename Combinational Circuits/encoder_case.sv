module encoder_case #(
    parameter WIDTH = 8,
    parameter OUT_BITS = 3
)(
    input  logic [WIDTH-1:0] in,
    output logic [OUT_BITS-1:0] out
);

    always_comb begin
        case (1'b1) // use the value of each input bit as condition
            in[0]: out = 3'd0;
            in[1]: out = 3'd1;
            in[2]: out = 3'd2;
            in[3]: out = 3'd3;
            in[4]: out = 3'd4;
            in[5]: out = 3'd5;
            in[6]: out = 3'd6;
            in[7]: out = 3'd7;
            default: out = 3'd0;
        endcase
    end

endmodule
