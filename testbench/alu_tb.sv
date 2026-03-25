`timescale 1ns / 1ps

module alu_tb;

    // Signals
    logic signed [15:0] A;
    logic signed [15:0] B;
    logic        [1:0]  ALU_select;
    logic signed [15:0] ALU_out;

    // Opcodes
    localparam ADD = 2'b00;
    localparam SUB = 2'b01;
    localparam AND = 2'b10;
    localparam OR  = 2'b11;

    // Loop variable for our random tests
    integer i;
    int unsigned seed;

    // Instantiate the ALU
    alu uut (
        .A(A),
        .B(B),
        .ALU_select(ALU_select),
        .ALU_out(ALU_out)
    );

    // dump waveforms
    initial begin
        $dumpfile("alu_waves.vcd"); 
        $dumpvars(0, alu_tb);       
    end

    // Run the random tests
    initial begin
        if (!$value$plusargs("SEED=%d", seed)) begin
            seed = 32'h1BADB002;
        end
        void'($urandom(seed));
        $display("Using random seed: %0d", seed);

        $display("Starting Randomized ALU simulation...");

        // --- Test ADD ---
        $display("\n--- Testing ADD ---");
        ALU_select = ADD;
        for (i = 0; i < 3; i = i + 1) begin
            A = $urandom;
            B = $urandom;
            #10; // Wait for combinational logic to update
            $display("ADD: %d + %d = %d", A, B, ALU_out);
        end

        // --- Test SUB ---
        $display("\n--- Testing SUB ---");
        ALU_select = SUB;
        for (i = 0; i < 3; i = i + 1) begin
            A = $urandom;
            B = $urandom;
            #10;
            $display("SUB: %d - %d = %d", A, B, ALU_out);
        end

        // --- Test AND ---
        $display("\n--- Testing AND ---");
        ALU_select = AND;
        for (i = 0; i < 3; i = i + 1) begin
            A = $urandom;
            B = $urandom;
            #10;
            // Printing in binary so it's easier to verify the bitwise math
            $display("AND: %b & \n     %b = \n     %b\n", A, B, ALU_out);
        end

        // --- Test OR ---
        $display("\n--- Testing OR ---");
        ALU_select = OR;
        for (i = 0; i < 3; i = i + 1) begin
            A = $urandom;
            B = $urandom;
            #10;
            $display("OR : %b | \n     %b = \n     %b\n", A, B, ALU_out);
        end

        $display("Done!");
        $finish; 
    end

endmodule