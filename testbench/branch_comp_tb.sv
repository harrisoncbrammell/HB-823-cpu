`timescale 1ns / 1ps

module branch_comp_tb;

    // testbench signals
    logic signed [15:0] A;
    logic signed [15:0] B;
    logic               BrEq;
    logic               BrLT;

    integer i;
    int unsigned seed;

    // instantiate the branch comparator
    branch_comp uut (
        .A(A),
        .B(B),
        .BrEq(BrEq),
        .BrLT(BrLT)
    );

    // waveform setup for gtkwave
    initial begin
        $dumpfile("branch_comp_waves.vcd");
        $dumpvars(0, branch_comp_tb);
    end

    // main test sequence
    initial begin
        // setup random seed
        if (!$value$plusargs("SEED=%d", seed)) begin
            seed = 32'h1BADB002;
        end
        void'($urandom(seed));
        $display("using random seed: %0d", seed);

        $display("starting branch comparator tests...");

        // --- test 1: equality (beq / bne) ---
        $display("\n--- testing equality (A == B) ---");
        for (i = 0; i < 3; i = i + 1) begin
            A = $urandom;
            B = A; // force them to be the exact same
            #10;
            $display("A: %0d | B: %0d | BrEq: %b | BrLT: %b", A, B, BrEq, BrLT);
        end

        // --- test 2: less than (blt / bge) ---
        $display("\n--- testing less than (A < B) ---");
        // directed test to make sure negative numbers work right
        A = -16'sd50; // the 'sd' means signed decimal
        B = 16'sd10;
        #10;
        $display("A: %0d | B: %0d | BrEq: %b | BrLT: %b", A, B, BrEq, BrLT);
        
        A = 16'sd10;
        B = 16'sd50;
        #10;
        $display("A: %0d | B: %0d | BrEq: %b | BrLT: %b", A, B, BrEq, BrLT);

        // --- test 3: greater than (blt / bge) ---
        $display("\n--- testing greater than (A > B) ---");
        A = 16'sd100;
        B = -16'sd5;
        #10;
        $display("A: %0d | B: %0d | BrEq: %b | BrLT: %b", A, B, BrEq, BrLT);

        // --- test 4: completely random ---
        $display("\n--- testing random values ---");
        for (i = 0; i < 3; i = i + 1) begin
            A = $urandom;
            B = $urandom;
            #10;
            $display("A: %0d | B: %0d | BrEq: %b | BrLT: %b", A, B, BrEq, BrLT);
        end

        $display("\ntests finished.");
        $finish;
    end

endmodule