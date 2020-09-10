`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.09.2020 11:51:46
// Design Name: 
// Module Name: MAC
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
module MAC(in, ws, bias,reset, mac_out);
input[15:0] in;
input[159:0] ws; //weight stream
input[9:0] bias;
input reset;
integer i;
output reg[9:0] mac_out;
reg[9:0]  i1,i2 ,s1,s2;
parameter c1 = 10 ,c2 = 20, c3 = 30, c4 = 40,c5 = 50, c6 = 60, c7 = 70, c8 = 80, c9 = 90,c10 = 100, c11 = 110, c12 = 120, c13 = 130,c14 = 140, c15 = 150; 
always @(*)
begin
if(reset) mac_out = 0;
else begin
i1 = 0;
if(in[15]) begin
          i1 = {ws[c15+9], ws[c15+8],ws[c15+7], ws[c15+6], ws[c15+5], ws[c15+4], ws[c15+3], ws[c15+2], ws[c15+1], ws[c15+0]};
          s1 = i1;
          if (s1[9] === 0) begin
                          if (s1>255) i1 = 255;
                          else i1 = s1;
                          end
          else
          if(s1[9] === 1) begin
                         if(s1>-255) i1 = -255;
                         else i1 = s1; 
                         end
          end
//-----------------------------------------------------------------------------------------
if(in[14]) begin 
          i1 = i1+{ws[c14+9], ws[c14+8],ws[c14+7], ws[c14+6], ws[c14+5], ws[c14+4], ws[c14+3], ws[c14+2], ws[c14+1], ws[c14+0]};
          s1 = i1;
                    if (s1[9] === 0) begin
                                    if (s1>255) i1 = 255;
                                    else i1 = s1;
                                    end
                    else
                    if(s1[9] === 1) begin
                                  if(s1>-255) i1 = -255;
                                   else i1 = s1; 
                                   end
          end
//-----------------------------------------------------------------------------------------
if(in[13]) begin
          i1 = i1+{ws[c13+9], ws[c13+8],ws[c13+7], ws[c13+6], ws[c13+5], ws[c13+4], ws[c13+3], ws[c13+2], ws[c13+1], ws[c13+0]};
          s1 = i1;
                              if (s1[9] === 0) begin
                                              if (s1>255) i1 = 255;
                                              else i1 = s1;
                                              end
                              else
                              if(s1[9] === 1) begin
                                             if(s1>-255) i1 = -255;
                                             else i1 = s1; 
                                             end
         end 
//-----------------------------------------------------------------------------------------
if(in[12]) begin
          i1 = i1+{ws[c12+9], ws[c12+8],ws[c12+7], ws[c12+6], ws[c12+5], ws[c12+4], ws[c12+3], ws[c12+2], ws[c12+1], ws[c12+0]};
          s1 = i1;
                              if (s1[9] === 0) begin
                                              if (s1>255) i1 = 255;
                                              else i1 = s1;
                                              end
                              else
                              if(s1[9] === 1) begin
                                             if(s1>-255) i1 = -255;
                                             else i1 = s1; 
                                             end
          end
//-----------------------------------------------------------------------------------------
if(in[11]) begin
          i1 = i1+{ws[c11+9], ws[c11+8],ws[c11+7], ws[c11+6], ws[c11+5], ws[c11+4], ws[c11+3], ws[c11+2], ws[c11+1], ws[c11+0]};
          s1 = i1;
                              if (s1[9] === 0) begin
                                              if (s1>255) i1 = 255;
                                              else i1 = s1;
                                              end
                              else
                              if(s1[9] === 1) begin
                                             if(s1>-255) i1 = -255;
                                             else i1 = s1; 
                                             end
          end
//-----------------------------------------------------------------------------------------
if(in[10]) begin 
          i1 = i1+{ws[c10+9], ws[c10+8],ws[c10+7], ws[c10+6], ws[c10+5], ws[c10+4], ws[c10+3], ws[c10+2], ws[c10+1], ws[c10+0]};
          s1 = i1;
                              if (s1[9] === 0) begin
                                              if (s1>255) i1 = 255;
                                              else i1 = s1;
                                              end
                              else
                              if(s1[9] === 1) begin
                                             if(s1>-255) i1 = -255;
                                             else i1 = s1; 
                                             end
          end
//-----------------------------------------------------------------------------------------
if(in[9]) begin 
          i1 = i1+{ws[c9+9], ws[c9+8],ws[c9+7], ws[c9+6], ws[c9+5], ws[c9+4], ws[c9+3], ws[c9+2], ws[c9+1], ws[c9+0]};
          s1 = i1;
                              if (s1[9] === 0) begin
                                              if (s1>255) i1 = 255;
                                              else i1 = s1;
                                              end
                              else
                              if(s1[9] === 1) begin
                                             if(s1>-255) i1 = -255;
                                             else i1 = s1; 
                                             end
          end
//-----------------------------------------------------------------------------------------
if(in[8]) begin 
          i1 = i1+{ws[c8+9], ws[c8+8],ws[c8+7], ws[c8+6], ws[c8+5], ws[c8+4], ws[c8+3], ws[c8+2], ws[c8+1], ws[c8+0]};
          s1 = i1;
                              if (s1[9] === 0) begin
                                              if (s1>255) i1 = 255;
                                              else i1 = s1;
                                              end
                              else
                              if(s1[9] === 1) begin
                                             if(s1>-255) i1 = -255;
                                             else i1 = s1; 
                                             end
          end
//-----------------------------------------------------------------------------------------
if(in[7]) begin
          i1 = i1+{ws[c7+9], ws[c7+8],ws[c7+7], ws[c7+6], ws[c7+5], ws[c7+4], ws[c7+3], ws[c7+2], ws[c7+1], ws[c7+0]};
          s1 = i1;
                              if (s1[9] === 0) begin
                                              if (s1>255) i1 = 255;
                                              else i1 = s1;
                                              end
                              else
                              if(s1[9] === 1) begin
                                             if(s1>-255) i1 = -255;
                                             else i1 = s1; 
                                             end
          end
//-----------------------------------------------------------------------------------------
if(in[6]) begin 
          i1 = i1+{ws[c6+9], ws[c6+8],ws[c6+7], ws[c6+6], ws[c6+5], ws[c6+4], ws[c6+3], ws[c6+2], ws[c6+1], ws[c6+0]};
          s1 = i1;
                              if (s1[9] === 0) begin
                                              if (s1>255) i1 = 255;
                                              else i1 = s1;
                                              end
                              else
                              if(s1[9] === 1) begin
                                             if(s1>-255) i1 = -255;
                                             else i1 = s1; 
                                             end
          end
//-----------------------------------------------------------------------------------------
if(in[5]) begin 
           i1 = i1+{ws[c5+9], ws[c5+8],ws[c5+7], ws[c5+6], ws[c5+5], ws[c5+4], ws[c5+3], ws[c5+2], ws[c5+1], ws[c5+0]};
           s1 = i1;
                               if (s1[9] === 0) begin
                                               if (s1>255) i1 = 255;
                                               else i1 = s1;
                                               end
                               else
                               if(s1[9] === 1) begin
                                              if(s1>-255) i1 = -255;
                                              else i1 = s1; 
                                              end
           end
//-----------------------------------------------------------------------------------------
if(in[4]) begin 
           i1 = i1+{ws[c4+9], ws[c4+8],ws[c4+7], ws[c4+6], ws[c4+5], ws[c4+4], ws[c4+3], ws[c4+2], ws[c4+1], ws[c4+0]};
           s1 = i1;
                               if (s1[9] === 0) begin
                                               if (s1>255) i1 = 255;
                                               else i1 = s1;
                                               end
                               else
                               if(s1[9] === 1) begin
                                              if(s1>-255) i1 = -255;
                                              else i1 = s1; 
                                              end
           end
//-----------------------------------------------------------------------------------------
if(in[3]) begin 
           i1 = i1+{ws[c3+9], ws[c3+8],ws[c3+7], ws[c3+6], ws[c3+5], ws[c3+4], ws[c3+3], ws[c3+2], ws[c3+1], ws[c3+0]};
           s1 = i1;
                               if (s1[9] === 0) begin
                                               if (s1>255) i1 = 255;
                                               else i1 = s1;
                                               end
                               else
                               if(s1[9] === 1) begin
                                              if(s1>-255) i1 = -255;
                                              else i1 = s1; 
                                              end
           end
//-----------------------------------------------------------------------------------------
if(in[2]) begin 
           i1 = i1+{ws[c2+9], ws[c2+8],ws[c2+7], ws[c2+6], ws[c2+5], ws[c2+4], ws[c2+3], ws[c2+2], ws[c2+1], ws[c2+0]};
           s1 = i1;
                               if (s1[9] === 0) begin
                                              if (s1>255) i1 = 255;
                                               else i1 = s1;
                                               end
                               else
                               if(s1[9] === 1) begin
                                              if(s1>-255) i1 = -255;
                                              else i1 = s1; 
                                              end
           end
//-----------------------------------------------------------------------------------------
if(in[1]) begin 
           i1 = i1+{ws[c1+9], ws[c1+8],ws[c1+7], ws[c1+6], ws[c1+5], ws[c1+4], ws[c1+3], ws[c1+2], ws[c1+1], ws[c1+0]};
           s1 = i1;
                               if (s1[9] === 0) begin
                                               if (s1>255) i1 = 255;
                                               else i1 = s1;
                                               end
                               else
                               if(s1[9] === 1) begin
                                              if(s1>-255) i1 = -255;
                                              else i1 = s1; 
                                              end
           end
//-----------------------------------------------------------------------------------------
if(in[0]) begin 
           i1 = i1+{ws[9], ws[8],ws[7], ws[6], ws[5], ws[4], ws[3], ws[2], ws[1], ws[0]};
           s1 = i1;
                               if (s1[9] === 0) begin
                                               if (s1>255) i1 = 255;
                                               else i1 = s1;
                                               end
                               else
                               if(s1[9] === 1) begin
                                              if(s1>-255) i1 = -255;
                                              else i1 = s1; 
                                              end
           end
//-----------------------------------------------------------------------------------------
s2 = i1+bias;
if (s2[9] === 0)    begin
                    if (s2>255) i1 = 255;
                    else i1 = s2;
                    end
else
if(s2[9] === 1)      begin
                     if(s2>-255) i1 = -255;
                     else i1 = s2; 
                     end
mac_out = s2;
end
end
endmodule
