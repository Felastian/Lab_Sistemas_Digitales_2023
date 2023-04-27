`timescale 1s / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2023 10:06:13 PM
// Design Name: 
// Module Name: test_multiple
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


module test_multiple();

logic clk_in;
logic reset;
logic clk_out;
logic clk_out1;
logic clk_out2;
logic clk_out3;


divisor_multiple DUT(

    .clk_in(clk_in),
    .reset(reset),
    .clk_out(clk_out),
    .clk_out1(clk_out1),
    .clk_out2(clk_out2),
    .clk_out3(clk_out3)

);

always #5 clk_in = ~clk_in;

initial begin

clk_in = 0;
reset = 1;

#5 

reset = 0;


end




endmodule
