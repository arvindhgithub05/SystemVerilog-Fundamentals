// ----------------------------------------------------
// Module: Simple 2-State FSM (IDLE ↔ ACTIVE)
// Description:
//   - FSM with 2 states controlled by 'toggle' input
//   - Output 'out' is high only in ACTIVE state
// ----------------------------------------------------

module simple_fsm (
    input  logic clk,       // Clock
    input  logic rst_n,     // Active-low reset
    input  logic toggle,    // Input to toggle state
    output logic out        // Output: high in ACTIVE state
);

    // Define state type and values
    typedef enum logic [1:0] {
        IDLE   = 2'b00,
        ACTIVE = 2'b01
    } state_t;

    // State registers
    state_t current_state, next_state;

    // Sequential block: state transition
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            current_state <= IDLE;
        else
            current_state <= next_state;
    end

    // Combinational block: next state logic
    always_comb begin
        case (current_state)
            IDLE:   next_state = toggle ? ACTIVE : IDLE;
            ACTIVE: next_state = toggle ? IDLE   : ACTIVE;
            default: next_state = IDLE;
        endcase
    end

    // Output logic based on state
    assign out = (current_state == ACTIVE);

endmodule
