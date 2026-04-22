`timescale 1ns / 1ps

module sev_seg_driver(
    input logic clk,
    input logic [15:0] value,
    output logic CA,
    output logic CB,
    output logic CC,
    output logic CD,
    output logic CE,
    output logic CF,
    output logic CG,
    output logic DP,
    output logic [7:0] AN
);
    logic [18:0] refresh_counter = 19'd0;
    logic [2:0] digit_select;
    logic [3:0] digit;
    logic [6:0] segments;

    logic [3:0] ones;
    logic [3:0] tens;
    logic [3:0] hundreds;
    logic [3:0] thousands;
    logic [3:0] ten_thousands;

    assign digit_select = refresh_counter[18:16];
    assign {CA, CB, CC, CD, CE, CF, CG} = segments;
    assign DP = 1'b1;

    always_ff @(posedge clk) begin
        refresh_counter <= refresh_counter + 19'd1;
    end

    always_comb begin
        ones = value % 10;
        tens = (value / 10) % 10;
        hundreds = (value / 100) % 10;
        thousands = (value / 1000) % 10;
        ten_thousands = (value / 10000) % 10;
    end

    always_comb begin
        AN = 8'b1111_1111;
        digit = 4'd0;

        case (digit_select)
            3'd0: begin
                AN = 8'b1111_1110;
                digit = ones;
            end
            3'd1: begin
                AN = 8'b1111_1101;
                digit = tens;
            end
            3'd2: begin
                AN = 8'b1111_1011;
                digit = hundreds;
            end
            3'd3: begin
                AN = 8'b1111_0111;
                digit = thousands;
            end
            3'd4: begin
                AN = 8'b1110_1111;
                digit = ten_thousands;
            end
            default: begin
                AN = 8'b1111_1111;
                digit = 4'd0;
            end
        endcase

        case (digit)
            4'd0: segments = 7'b0000001;
            4'd1: segments = 7'b1001111;
            4'd2: segments = 7'b0010010;
            4'd3: segments = 7'b0000110;
            4'd4: segments = 7'b1001100;
            4'd5: segments = 7'b0100100;
            4'd6: segments = 7'b0100000;
            4'd7: segments = 7'b0001111;
            4'd8: segments = 7'b0000000;
            4'd9: segments = 7'b0000100;
            default: segments = 7'b1111111;
        endcase
    end
endmodule
