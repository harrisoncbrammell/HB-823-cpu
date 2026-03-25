`timescale 1ns / 1ps

module pc(
    input logic clk,
    input logic reset, // asynchronous reset
    input logic [15:0] PC_write, // next PC value to be loaded from PCSel mux
    output logic [15:0] PC // current PC
);

    always_ff @(posedge clk or posedge reset) begin
        if (reset == 1'b1) begin
            PC <= 16'b0; //reset pc to all 0's
        end else begin
            PC <= PC_write; //load next 
        end
    end

endmodule