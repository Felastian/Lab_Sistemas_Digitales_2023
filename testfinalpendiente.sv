`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/24/2023 01:21:01 PM
// Design Name: 
// Module Name: testfinalpendiente
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


module testfinalpendiente();

logic clk_in;
logic reset;
logic reset_count;
logic [6:0]display;
logic [3:0]on_off;

diseno_temporal dut(

    .clk_in(clk_in),
    .reset(reset),
    .reset_count(reset_count),
    .display(display),
    .on_off(on_off)
);




always #10 clk_in = ~clk_in;

initial begin

    clk_in = 0;
    reset = 1;
    reset_count = 1;
    
    #10
    
    reset = 0;
    
    #34000000
    reset_count = 0;
    
 end

endmodule