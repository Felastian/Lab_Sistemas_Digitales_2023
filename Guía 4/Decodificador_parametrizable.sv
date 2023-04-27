`timescale 1ns / 1ps

/////// deco //////

module Decodificador_parametrizable #(parameter N = 3) (input logic [N-1:0]entrada,
output logic [(2**N):0]salida
);

always_comb begin

case(entrada)

default: salida = 'b0;
'b000: salida = 8'b00000001;
'b001: salida = 8'b00000010;
'b010 : salida = 8'b00000100;
'b011 : salida = 8'b00001000;
'b100: salida = 8'b00010000;
'b101: salida = 8'b00100000;
'b110: salida = 8'b01000000;
'b111: salida = 8'b10000000;

endcase
end

endmodule
