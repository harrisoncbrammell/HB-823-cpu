`timescale 1ns / 1ps

module reg_file_tb;

    // testbench signals
    logic        clk;
    logic        reset;
    logic        RegWEn;
    logic [3:0]  rsR1, rsR2, rdW, inr;
    logic [15:0] dataW;
    logic [15:0] dataR1, dataR2, outvalue;

    integer i;
    int unsigned seed;

    // instantiate the regfile
    reg_file uut (.*);

    // clock generator (100mhz)
    always #5 clk = ~clk;

    // waveform setup for gtkwave
    initial begin
        $dumpfile("reg_file_waves.vcd");
        $dumpvars(0, reg_file_tb);
    end

    // main test sequence
    initial begin
        if (!$value$plusargs("SEED=%d", seed)) begin
            seed = 32'h1BADB002;
        end
        void'($urandom(seed));
        $display("Using random seed: %0d", seed);

        $display("starting randomized regfile tests...");

        // init signals
        clk = 0;
        reset = 1;
        RegWEn = 0;
        rsR1 = 0;
        rsR2 = 0;
        rdW = 0;
        inr = 0;
        dataW = 0;

        // hold reset to clear array
        #15;
        reset = 0;
        $display("reset done. all registers cleared.");

        // test 1: write random values to all registers
        $display("\n--- writing random data to r1-r15 ---");
        for (i = 1; i < 16; i = i + 1) begin
            @(negedge clk);
            RegWEn = 1;
            rdW = i[3:0];
            dataW = $urandom;
            @(negedge clk);
            RegWEn = 0;
            $display("wrote %h to r%0d", dataW, i);
        end

        // test 2: read back random values
        $display("\n--- reading back values ---");
        for (i = 1; i < 16; i = i + 2) begin
            rsR1 = i[3:0];       // read odd registers
            rsR2 = i[3:0] + 4'd1; // read even registers
            inr  = i[3:0];       // check debug port on odd
            #1; // wait for combo logic
            $display("r%0d: %h | r%0d: %h | debug(r%0d): %h", i, dataR1, i+1, dataR2, inr, outvalue);
        end

        // test 3: verify r0 protection with random data
        $display("\n--- verifying r0 is protected ---");
        @(negedge clk);
        RegWEn = 1;
        rdW = 4'd0;
        dataW = $urandom;
        @(negedge clk);
        RegWEn = 0;
        
        rsR1 = 4'd0;
        #1;
        $display("tried writing %h to r0. result r0: %h", dataW, dataR1);

        $display("\ntests finished.");
        $finish;
    end

endmodule