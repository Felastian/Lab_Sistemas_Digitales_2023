`timescale 1ns / 1ps

/////// deco //////

module decodificadoronehot (input logic [1:0]entrada,
output logic [3:0]salida
);

always_comb begin

case(entrada)

default: salida = 4'd0;
2'b00: salida = 4'b0001;
2'b01: salida = 4'b0010;
2'b10 : salida = 4'b0100;
2'b11 : salida = 4'b1000;

endcase
end

endmodule
