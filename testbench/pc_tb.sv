`timescale 1ns / 1ps

module pc_tb;

    // testbench signals
    logic        clk;
    logic        reset;
    logic [15:0] PC_write;
    logic [15:0] PC;

    integer i;
    integer errors;
    int unsigned seed;

    // instantiate the pc
    pc uut (
        .clk(clk),
        .reset(reset),
        .PC_write(PC_write),
        .PC(PC)
    );

    // clock generator (100mhz)
    always #5 clk = ~clk;

    // waveform setup for gtkwave
    initial begin
        $dumpfile("pc_waves.vcd");
        $dumpvars(0, pc_tb);
    end

    // main test sequence
    initial begin
        if (!$value$plusargs("SEED=%d", seed)) begin
            seed = 32'h1BADB002;
        end
        void'($urandom(seed));
        $display("Using random seed: %0d", seed);

        $display("starting randomized pc tests...");

        // init signals
        clk = 0;
        reset = 0;
        PC_write = 0;
        errors = 0;

        // test 1: verify asynchronous reset
        $display("\n--- testing async reset ---");
        PC_write = $urandom;
        #2;
        reset = 1;
        #1;
        if (PC !== 16'h0000) begin
            errors = errors + 1;
            $display("ERROR: reset failed. PC=%h expected=0000", PC);
        end else begin
            $display("reset asserted. PC=%h", PC);
        end
        #7;
        reset = 0;

        // test 2: random next-pc updates on clock edge
        $display("\n--- testing random pc loads ---");
        for (i = 0; i < 10; i = i + 1) begin
            @(negedge clk);
            PC_write = $urandom;
            @(posedge clk);
            #1;
            if (PC !== PC_write) begin
                errors = errors + 1;
                $display("ERROR: iter=%0d PC_write=%h PC=%h", i, PC_write, PC);
            end else begin
                $display("iter=%0d PC_write=%h | PC=%h", i, PC_write, PC);
            end
        end

        // test 3: random reset pulses between clock edges
        $display("\n--- testing random async reset pulses ---");
        for (i = 0; i < 5; i = i + 1) begin
            @(negedge clk);
            PC_write = $urandom;
            @(posedge clk);
            #1;

            // assert reset away from edge to verify async behavior
            #($urandom_range(1, 4));
            reset = 1;
            #1;
            if (PC !== 16'h0000) begin
                errors = errors + 1;
                $display("ERROR: pulse=%0d reset failed. PC=%h", i, PC);
            end else begin
                $display("pulse=%0d reset asserted. PC=%h", i, PC);
            end

            #($urandom_range(1, 3));
            reset = 0;
        end

        if (errors == 0) begin
            $display("\nall pc tests passed.");
        end else begin
            $display("\npc tests finished with %0d error(s).", errors);
        end

        $finish;
    end

endmodule
