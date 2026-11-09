module gates_and_mux (
    input wire a,
    input wire b,
    output wire and_gate,
    output wire or_gate,
    output wire xor_gate,
    output wire nand_gate,
    input wire sel,
    output wire mux_out
);
    // Basic Combinational Logic
    assign and_gate  = a & b;
    assign or_gate   = a | b;
    assign xor_gate  = a ^ b;
    assign nand_gate = ~(a & b);
    
    // 2:1 Multiplexer
    assign mux_out   = (sel) ? a : b;
endmodule
