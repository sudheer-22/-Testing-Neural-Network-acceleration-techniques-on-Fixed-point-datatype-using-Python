`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.09.2020 22:34:36
// Design Name: 
// Module Name: SR_TB
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


module SR_TB;
reg[9:0] in;
wire[9:0] out;
stochastic_rounding sr(in, out);
initial
begin
#5 in = 0; #5 in = 256;#5 in = 500; #5 in = 255;#5 in = 100;
#5 in = -255; #5 in = -258;#5 in = -500; #5 in = -100;
#5 $finish;
end
endmodule
