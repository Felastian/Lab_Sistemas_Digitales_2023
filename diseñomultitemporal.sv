`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
///////    Parte final guía 3 ///////////
//////////////////////////////////////////////////////////////////////////////////


module diseno_temporal (input logic reset, input logic reset_count, input logic clk_in,
output logic [6:0]display, output logic [3:0]on_off);

logic [15:0]salida_cont16;
logic [3:0]in_display;
logic [1:0]salida_cont2;
logic clk2;
logic clk1;

//// Aqui van las salidas de ambos clocks, sin embargo su bus de bits depende de la frecuencia que deseo///

decodificadoronehot dut(
    .entrada(salida_cont2),
    .salida(on_off)
); 

bcddisplay dut1(
    .BCD_in(in_display),
    .sevenSeg(display)
);

cont4para #(.N(2))dut2(
    .reset(reset_count),
    .clk(clk2),
    .count(salida_cont2)   
);

cont4para #(.N(16))dut3(
    .reset(reset_count),
    .clk(clk1),
    .count(salida_cont16)   
);

clkfrec #(.f_in(100_000_000),.f_out(30)) dut4( ////16bits/////
    .clk_in(clk_in),
    .reset(reset),
    .clk_out(clk1)        
);

clkfrec #(.f_in(100_000_000),.f_out(120)) dut5(  ///2bits//
    .clk_in(clk_in),
    .reset(reset),
    .clk_out(clk2)        
);


always_comb begin
    case(salida_cont2)
        default : in_display = 4'd0;
        2'b00: in_display = salida_cont16[3:0];
        2'b01: in_display = salida_cont16[7:4];
        2'b10: in_display = salida_cont16[11:8];
        2'b11: in_display = salida_cont16[15:12];              
    endcase    
end

endmodule

