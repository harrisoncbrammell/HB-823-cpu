`timescale 1ns / 1ps

module data_mem_tb;

    // testbench signals
    logic        clk;
    logic        MemWrite;
    logic [15:0] addr;
    logic [15:0] dataW;
    logic [15:0] dataR;

    integer i;
    int unsigned seed;

    // instantiate the data memory
    data_mem uut (
        .clk(clk),
        .MemWrite(MemWrite),
        .addr(addr),
        .dataW(dataW),
        .dataR(dataR)
    );

    // clock generator (100mhz)
    always #5 clk = ~clk;

    // waveform setup for gtkwave
    initial begin
        $dumpfile("data_mem_waves.vcd");
        $dumpvars(0, data_mem_tb);
    end

    // main test sequence
    initial begin
        // setup random seed
        if (!$value$plusargs("SEED=%d", seed)) begin
            seed = 32'h1BADB002;
        end
        void'($urandom(seed));
        $display("using random seed: %0d", seed);

        $display("starting randomized data memory tests...");
        
        // init signals
        clk = 0;
        MemWrite = 0;
        addr = 0;
        dataW = 0;

        // wait a bit for things to settle
        #15;

        // --- test 1: write random data to random addresses ---
        $display("\n--- testing memory writes (sw) ---");
        for (i = 0; i < 5; i = i + 1) begin
            @(negedge clk); // setup signals on falling edge so they are ready for posedge
            MemWrite = 1;
            
            // pick a random address between 0 and 1023
            addr = $urandom_range(0, 1023);
            dataW = $urandom;
            
            @(negedge clk); // wait for clock cycle to finish the write
            MemWrite = 0;
            $display("wrote %h to address %0d", dataW, addr);
        end

        // --- test 2: directed read/write test ---
        $display("\n--- testing directed read/write ---");
        
        // write to address 42
        @(negedge clk);
        MemWrite = 1;
        addr = 16'd42;
        dataW = 16'hDEAD;
        @(negedge clk);
        MemWrite = 0;
        
        // read from address 42
        addr = 16'd42;
        #1; // wait a tiny bit for the combinational read to update
        $display("read from address 42: %h (expected DEAD)", dataR);

        // --- test 3: write protection (make sure we dont write when MemWrite is 0) ---
        $display("\n--- testing write protection ---");
        @(negedge clk);
        MemWrite = 0; // write disabled
        addr = 16'd42;
        dataW = 16'hBEEF; // try to overwrite the DEAD value
        @(negedge clk);
        
        #1; 
        $display("tried writing BEEF to address 42 with MemWrite=0. read back: %h (should still be DEAD)", dataR);

        $display("\ntests finished.");
        $finish;
    end

endmodule