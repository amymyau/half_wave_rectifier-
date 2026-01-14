`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/14/2026 01:53:58 PM
// Design Name: 
// Module Name: test
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


`timescale 1ns / 1ps

module tb_HalfWaveROM();

    reg clk;
    reg en;
    reg [7:0] addr;
    wire [7:0] data_out;

    // Instantiate the Unit Under Test (UUT)
    HalfWaveROM uut (
        .clk(clk),
        .en(en),
        .addr(addr),
        .data_out(data_out)
    );

    // Generate Clock: 100MHz (10ns period)
    always #5 clk = ~clk;

    initial begin
        // Initialize Inputs
        clk = 0;
        en = 0;
        addr = 0;

        // Wait for global reset
        #20;
        en = 1;

        // Cycle through the ROM addresses twice
        repeat (512) begin
            @(posedge clk);
            addr <= addr + 1;
        end

        #20;
        $stop; // Pause simulation
    end

endmodule