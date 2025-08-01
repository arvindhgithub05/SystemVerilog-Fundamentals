module Half_Adder (
    input  logic  a,      // Input A
    input  logic  b,      // Input B
    output logic  sum,    // Sum 
    output logic  carry   // Carry 
);

    // Pure combinational logic
    always_comb begin
        sum   = a ^ b;
        carry = a & b;
    end

endmodule