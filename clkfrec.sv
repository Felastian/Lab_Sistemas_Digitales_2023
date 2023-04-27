`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/21/2023 05:24:27 PM
// Design Name: 
// Module Name: clkfrec
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


module clkfrec
 #(parameter f_in = 100_000_000, parameter f_out = 25_000_000)
(
	input  logic clk_in,
	input  logic reset,
	output logic clk_out );

	localparam counter_max = (f_in/(2*(f_out)));
	localparam bits = $clog2(counter_max);
	logic [bits-1:0] counter = 'd0, counter_next;
	logic clk_out_next;
	 
	/*L?gica combinacional para el contador*/
	always_comb
	begin
		if (reset == 1'b1)
			counter_next = 'd0;// Reset sincronico, setea el contador
		else if (counter == (counter_max - 1))
			counter_next = 'd0;// Se resetea el contador
		else
			counter_next = counter + 'd1; // Se incrementa el contador
	end
	 
	 /*L?gica Combinacional para la salida*/
	always_comb
	begin
		if (reset == 1'b1)
			clk_out_next = 'd0; // Reset sincronico, setea la salida a un valor conocido
		else if (counter == counter_max-1)
			clk_out_next = ~clk_out;// Se invierte la salida
		else
			clk_out_next = clk_out;//se mantiene la salida con su valor anterior
	 end

	/*Lggica Secuencial*/
	always_ff@(posedge clk_in)
	begin
		counter <= counter_next;
		clk_out <= clk_out_next;
	end
endmodule
