`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2023 04:54:07 PM
// Design Name: 
// Module Name: test_clock
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


module test_clock( );

logic clk_in;
logic reset;
logic clk_out;


clock_divider_mio #(.f_in(100),.f_out(25)) DUT(

    .clk_in(clk_in),
    .reset(reset),
    .clk_out(clk_out)

);

always #5 clk_in = ~clk_in;

initial begin

clk_in = 0;
reset = 1;

#5 

reset = 0;


end




endmodule
