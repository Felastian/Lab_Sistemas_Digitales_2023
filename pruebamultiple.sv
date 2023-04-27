`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Múltiples CLK_DIVIDER en la salida ///
//////////////////////////////////////////////////////////////////////////////////


module pruebamultiple();


logic clk_in;
logic reset;
logic clk_out;
logic clk_out1;
logic clk_out2;
logic clk_out3;


clkfrec #(.f_in(100_000_000),.f_out(50_000_000))DUT(

    .clk_in(clk_in),
    .reset(reset), 
    .clk_out(clk_out)
);

clkfrec  #(.f_in(100_000_000),.f_out(30_000_000))DUT1(

    .clk_in(clk_in),
    .reset(reset), 
    .clk_out(clk_out1)
);

clkfrec  #(.f_in(100_000_000),.f_out(10_000_000))DUT2(

    .clk_in(clk_in),
    .reset(reset), 
    .clk_out(clk_out2)
);

clkfrec  #(.f_in(100_000_000),.f_out(1_000_000))DUT3(

    .clk_in(clk_in),
    .reset(reset), 
    .clk_out(clk_out3)
);



always #5 clk_in = ~clk_in;

initial begin

clk_in = 0;
reset = 1;

#5

reset = 0;


end


endmodule
