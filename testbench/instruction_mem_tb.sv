`timescale 1ns / 1ps

module instruction_mem_tb;

    // testbench signals
    logic [15:0] pc;
    logic [15:0] inst;

    integer i;
    int unsigned seed;

    // instantiate the instruction memory
    instruction_mem uut (
        .PC(pc),
        .instruction(inst)
    );

    // waveform setup for gtkwave
    initial begin
        $dumpfile("instruction_mem_waves.vcd");
        $dumpvars(0, instruction_mem_tb);
    end

    initial begin
        // setup random seed
        if (!$value$plusargs("SEED=%d", seed)) begin
            seed = 32'h1BADB002;
        end
        void'($urandom(seed));
        $display("using random seed: %0d", seed);

        $display("starting word-addressable imem tests...");

        // --- load dummy data into memory ---
        $display("\n--- loading test program into memory ---");
        // manually stuffing some fake machine code into the first few slots
        uut.memory[0] = 16'hAAAA; // instruction 1 at pc 0
        uut.memory[1] = 16'hBBBB; // instruction 2 at pc 1
        uut.memory[2] = 16'hCCCC; // instruction 3 at pc 2
        uut.memory[3] = 16'hDDDD; // instruction 4 at pc 3
        
        // stuff a random instruction further down
        uut.memory[500] = 16'hFACE; // pc 500

        // --- test sequential reading ---
        $display("\n--- testing sequential fetch (pc + 1) ---");
        pc = 16'h0000;
        for (i = 0; i < 4; i = i + 1) begin
            #10; // wait for combo read
            $display("pc: %0d | hex: %h | inst out: %h", pc, pc, inst);
            pc = pc + 16'd1; // simulate the pc+1 adder
        end

        // --- test random jumps ---
        $display("\n--- testing random jumps ---");
        for (i = 0; i < 3; i = i + 1) begin
            // generate a random pc value between 0 and 1023
            pc = $urandom_range(0, 1023);
            
            // load a random value into that memory slot so we know what to expect
            uut.memory[pc[9:0]] = $urandom;
            
            #10;
            $display("jump to pc: %0d | inst out: %h", pc, inst);
        end

        // --- test the face instruction ---
        $display("\n--- testing directed jump ---");
        pc = 16'd500; 
        #10;
        $display("jump to pc: 500 | inst out: %h (expected FACE)", inst);

        $display("\ntests finished.");
        $finish;
    end

endmodule