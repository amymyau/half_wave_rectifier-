`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/14/2026 01:25:11 PM
// Design Name: 
// Module Name: top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module HalfWaveROM (
    input wire clk,
    input wire en,
    input wire [7:0] addr, // 256 entries
    output reg [7:0] data_out
);

    // Declare the ROM array: 256 words, each 8 bits wide
    reg [7:0] rom [0:255];

    // Load the rectified sine values from an external file
    initial begin
        $readmemh("rectifier_values_1024.mem", rom);
    end

    always @(posedge clk) begin
        if (en) begin
            data_out <= rom[addr];
        end
    end

endmodule