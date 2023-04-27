`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//// Multiplexación temporal para múltiples display
//// Grupo 5 = Sebastián Donoso, Sebastián Encina, Danny Fajardo
//////////////////////////////////////////////////////////////////////////////////

module MTMD(
input logic [31:0]HEX_in,
input logic clock, reset,
output logic [6:0]segments,
output logic [7:0]anodes
);

logic [3:0]pre_display;
logic [2:0]select;

bcddisplay DUT(
    .BCD_in(pre_display),
    .sevenSeg(segments)
);

cont4para #(.N(3)) DUT1(
    .clk(clock),
    .reset(reset),
    .count(select)
);

Decodificador_parametrizable #(.N(3))DUT2(
    .entrada(select),
    .salida(anodes)
);

/*always_comb
begin
    case(select)
        default: pre_display = 4'd0;
        3'd0: pre_display = HEX_in[3:0];
        3'd1: pre_display = HEX_in[7:4];
        3'd2: pre_display = HEX_in[11:8];
        3'd4: pre_display = HEX_in[15:12];
        3'd5: pre_display = HEX_in[19:16];
        3'd6: pre_display = HEX_in[23:20];
        3'd7: pre_display = HEX_in[27:24];
        3'd8: pre_display = HEX_in[31:28];
    endcase
end*/

always_ff@(posedge clock)
begin
    if(reset == 1)
        pre_display = 4'd0;
    else
    case(select)
        default: pre_display = 7'b0000001;
        4'd0: pre_display = HEX_in[3:0];
        4'd1: pre_display = HEX_in[7:4];
        4'd2: pre_display = HEX_in[11:8];
        4'd4: pre_display = HEX_in[15:12];
        4'd5: pre_display = HEX_in[19:16];
        4'd6: pre_display = HEX_in[23:20];
        4'd7: pre_display = HEX_in[27:24];
        4'd8: pre_display = HEX_in[31:28];
    endcase
        
end
endmodule
