`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/21/2023 03:39:35 PM
// Design Name: 
// Module Name: clockprofetest
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


module clockprofetest();


logic clk_in;
logic reset;
logic clk_out;


clock_divider_2 #(.COUNTER_MAX(8)) DUT(

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
