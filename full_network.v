`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.09.2020 17:18:38
// Design Name: 
// Module Name: full_network
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

module fullnetwork;
reg[15:0] in;
wire d3,d2,d1,d0;
reg reset;
reg[9:0] weights_bank[67:0];
wire[159:0] ws3,ws2,ws1,ws0;
wire[9:0] d0_out,d1_out, d2_out,d3_out;
assign ws3 = {weights_bank[0],weights_bank[1],weights_bank[2],weights_bank[3],weights_bank[4],weights_bank[5],weights_bank[6],weights_bank[7],
              weights_bank[8],weights_bank[9],weights_bank[10],weights_bank[11],weights_bank[12],weights_bank[13],weights_bank[14],weights_bank[15]};
  
assign ws2 = {weights_bank[16],weights_bank[17],weights_bank[18],weights_bank[19],weights_bank[20],weights_bank[21],weights_bank[22],10'b1110000111,
             weights_bank[24],weights_bank[25],weights_bank[26],weights_bank[27],weights_bank[28],weights_bank[29],weights_bank[30],weights_bank[31]};
  
assign ws1 = {weights_bank[32],weights_bank[33],weights_bank[34],weights_bank[35],weights_bank[36],weights_bank[37],weights_bank[38],weights_bank[39],
              weights_bank[40],weights_bank[41],weights_bank[42],weights_bank[43],weights_bank[44],weights_bank[45],weights_bank[46],weights_bank[47]};
  
assign ws0 = {weights_bank[48],weights_bank[49],weights_bank[50],weights_bank[51],weights_bank[52],weights_bank[53],weights_bank[54],weights_bank[55],
              weights_bank[56],weights_bank[57],weights_bank[58],weights_bank[59],weights_bank[60],weights_bank[61],weights_bank[62],weights_bank[63]};

MAC n3(in, ws3, weights_bank[64], reset, d3_out);
a_f af3(d3_out, d3);

MAC n2(in, ws2, weights_bank[65], reset, d2_out);
a_f af2(d2_out, d2);

MAC n1(in, ws1, weights_bank[66], reset, d1_out);
a_f af1(d1_out, d1);

MAC n0(in, ws0, weights_bank[67], reset, d0_out);
a_f af0(d0_out, d0);

initial 
begin
$readmemb("weights_bias _10bit.txt", weights_bank);
//$readmemb("bias_bank.txt", bias_bank);
#5 reset = 1;
#5 reset = 0;
//#5 in = 16'b0000000000000001;
//#5 in = 16'b0000000000000011;
//#5 in = 16'b0000000000000111;
//#5 in = 16'b0000000000001111;
//#5 in = 16'b0000000000011111;
//#5 in = 16'b0000000000111111;
//#5 in = 16'b0000000001111111;
//#5 in = 16'b0000000011111111;
//#5 in = 16'b0000000111111111;
//#5 in = 16'b0000001111111111;
//#5 in = 16'b0000011111111111;
//#5 in = 16'b0000111111111111;
//#5 in = 16'b0001111111111111;
//#5 in = 16'b0011111111111111;
//#5 in = 16'b0111111111111111;
#5 in = 16'b1111111111111111;
#5 $finish;
end
endmodule

