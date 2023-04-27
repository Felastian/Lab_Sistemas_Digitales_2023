`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
//// Contador de N-bits modificado para la guía evaluada
//// Grupo 5 = Sebastián Donoso, Sebastián Encina, Danny Fajardo
//////////////////////////////////////////////////////////////////////////////////

module contador_N_bits #(parameter N = 32 )( 
input logic clock, reset, load, dec, enable,
input logic [N-1:0]Load_Ref_value,
output logic [N-1:0]counterN,
output logic threshold
);

logic [N-1:0]counter_next;

always_comb
begin
    if(reset == 1'b1)
        counter_next = 'd0;
    else if(load == 1'b1)
        counter_next = Load_Ref_value;
    else if(enable == 1'b0)
        counter_next = counterN;
    else if(dec == 1'b1)
        counter_next = counterN - 'd1;        
    else
        counter_next = counterN + 'd1;
end

always_comb
begin
    if(Load_Ref_value < counterN)
        threshold = 1'b1;
    else
        threshold = 1'b0;               
end

always_ff@(posedge clock)
begin
    counterN <= counter_next;
end








endmodule
