`timescale 1ns / 1ps //// 1 ns es el total medido y 1 ps tiempo de muestreo

///// simulacion deco///

module simulaciondeco();

logic [1:0]entrada;
logic [3:0]salida;

decodificadoronehot DUT(

    .entrada(entrada),
    .salida(salida)

);

initial begin

entrada = 2'b00;

#5

entrada = 2'b01;

#5

entrada = 2'b10;

#5

entrada = 2'b11;

end

endmodule
