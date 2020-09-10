`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.09.2020 12:19:46
// Design Name: 
// Module Name: mac_tb
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


module mac_tb;
reg[15:0] in;
reg[159:0] ws; //weight stream
reg[9:0] bias;
reg reset;
wire[9:0] mac_out;
MAC m(in, ws, bias,reset, mac_out);

initial
begin
#5 reset = 1;#5 reset = 0;
#5 in = 16'b1111111111111111; #5 ws = {10'b0011111111,10'b1000001100,10'b0,10'b0,
                                       10'b0,10'b0,10'b0,10'b0,
                                       10'b0,10'b0,10'b0,10'b0,
                                       10'b0,10'b0,10'b0011001000,10'b0001100100};
bias = 5;
#5 reset = 0;
end
endmodule
