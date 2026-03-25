`timescale 1ns / 1ps

module reg_file (
    input  logic        clk,
    input  logic        reset,     // Required by rubric for sequential components
    input  logic        RegWEn,    // Write enable from Control Unit
    input  logic [3:0]  rsR1,      // Read register 1 address
    input  logic [3:0]  rsR2,      // Read register 2 address
    input  logic [3:0]  rdW,       // Write register address
    input  logic [15:0] dataW,     // Data to write back
    input  logic [3:0]  inr,       // Debug: target register to view on FPGA
    output logic [15:0] dataR1,    // Data from read register 1
    output logic [15:0] dataR2,    // Data from read register 2
    output logic [15:0] outvalue   // Debug: data from target register
);

    logic [15:0] registers [15:0];  // create the 16x16 memory array

    integer i; // loop variable for the reset block

    // asynchronous reads (combination)
    // if address is 0, always output 0 otherwise output the register data
    assign dataR1   = (rsR1 == 4'd0) ? 16'd0 : registers[rsR1];
    assign dataR2   = (rsR2 == 4'd0) ? 16'd0 : registers[rsR2];
    assign outvalue = (inr == 4'd0)  ? 16'd0 : registers[inr];

    // synchronous writes (sequential)
    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin  // clear all registers to 0 on reset
            for (i = 0; i < 16; i = i + 1) begin // loop thru registers and reset
                registers[i] <= 16'd0;
            end
        end else if (RegWEn && rdW != 4'd0) begin
            // write data if enabled AND we aren't trying to overwrite R0
            registers[rdW] <= dataW;
        end
    end

endmodule