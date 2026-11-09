`timescale 1ns / 1ps

module tb_gates_and_mux;
    reg a;
    reg b;
    reg sel;

    wire and_gate;
    wire or_gate;
    wire xor_gate;
    wire nand_gate;
    wire mux_out;

    // Instantiate Unit Under Test (UUT)
    gates_and_mux uut (
        .a(a), .b(b),
        .and_gate(and_gate), .or_gate(or_gate),
        .xor_gate(xor_gate), .nand_gate(nand_gate),
        .sel(sel), .mux_out(mux_out)
    );

    initial begin
        // Enable waveform dumping for EPWave
        $dumpfile("waveform.vcd");
        $dumpvars(0, tb_gates_and_mux);

        // Test all 8 input combinations

        a = 0; b = 0; sel = 0; #10;
        a = 0; b = 0; sel = 1; #10;

        a = 0; b = 1; sel = 0; #10;
        a = 0; b = 1; sel = 1; #10;

        a = 1; b = 0; sel = 0; #10;
        a = 1; b = 0; sel = 1; #10;

        a = 1; b = 1; sel = 0; #10;
        a = 1; b = 1; sel = 1; #10;

        $finish;
    end

    // Monitor outputs in the console log
    initial begin
        $monitor("Time=%0t | a=%b b=%b sel=%b | AND=%b OR=%b XOR=%b NAND=%b MUX=%b",
                 $time, a, b, sel, and_gate, or_gate, xor_gate, nand_gate, mux_out);
    end

endmodule
