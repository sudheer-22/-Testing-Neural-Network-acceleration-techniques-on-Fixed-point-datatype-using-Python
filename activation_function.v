`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.09.2020 16:41:44
// Design Name: 
// Module Name: a_f
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
module a_f(in, out);
input[9:0] in;
output reg out;
always @(in)
begin
if((in[9]== 0)&&(in>0)) out = 1'b1;
else 
out = 1'b0;
end
endmodule