`timescale 1ns / 1ps

module immediate_gen_tb;

    // testbench signals
    logic [15:0] inst;
    logic        imm_sel;
    logic [15:0] imm_out;

    integer i;
    int unsigned seed;

    // instantiate the immediate generator
    immediate_gen uut (
        .inst(inst),
        .imm_sel(imm_sel),
        .imm(imm_out)
    );

    // waveform setup for gtkwave
    initial begin
        $dumpfile("immediate_gen_waves.vcd");
        $dumpvars(0, immediate_gen_tb);
    end

    // main test sequence
    initial begin
        // setup random seed
        if (!$value$plusargs("SEED=%d", seed)) begin
            seed = 32'h1BADB002;
        end
        void'($urandom(seed));
        $display("using random seed: %0d", seed);

        $display("starting randomized immediate generator tests...");
        
        // --- test i-type (8-bit) ---
        $display("\n--- testing i-type (8-bit) ---");
        imm_sel = 0;
        for (i = 0; i < 3; i = i + 1) begin
            inst = $urandom;
            #10; // wait for combo logic
            $display("inst: %b | imm_out: %b (dec: %0d)", inst, imm_out, $signed(imm_out));
        end

        // --- test b/m-type (4-bit) ---
        $display("\n--- testing b/m-type (4-bit) ---");
        imm_sel = 1;
        for (i = 0; i < 3; i = i + 1) begin
            inst = $urandom;
            #10;
            $display("inst: %b | imm_out: %b (dec: %0d)", inst, imm_out, $signed(imm_out));
        end

        // --- directed edge cases ---
        $display("\n--- testing edge cases ---");
        
        // max positive 8-bit (127)
        inst = 16'b1111_0000_0111_1111; 
        imm_sel = 0;
        #10;
        $display("directed i-type pos: inst: %b | imm_out: %b (dec: %0d)", inst, imm_out, $signed(imm_out));

        // negative 4-bit (-8)
        inst = 16'b0110_0000_0000_1000; 
        imm_sel = 1;
        #10;
        $display("directed b/m-type neg: inst: %b | imm_out: %b (dec: %0d)", inst, imm_out, $signed(imm_out));

        $display("\ntests finished.");
        $finish;
    end

endmodule