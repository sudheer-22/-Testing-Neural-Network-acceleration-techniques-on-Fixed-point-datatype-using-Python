`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.09.2020 22:09:43
// Design Name: 
// Module Name: stochastic_rounding
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


module stochastic_rounding(in,out);
input[9:0] in;
output reg[9:0] out;
always @(in)
begin
if (in[9] === 0) begin
                if (in>255) out = 255;
                else out = in;
                end
else
if(in[9] === 1) begin
               if(in>-255) out = -255;
               else out = in; 
               end
end
endmodule
