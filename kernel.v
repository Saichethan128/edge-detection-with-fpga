`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.03.2020 20:09:32
// Design Name: 
// Module Name: kernel
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
//module square_root(input[31:0]num,output reg [31:0]sqr_root,output reg sqr_root_integer);
//integer temp;
//reg [31:0] i;
//always@(*)begin
//sqr_root = 'b0;
//sqr_root_integer= 1'b0;
//for(i=0;i<(num/2);i=i+1)begin
//temp= i*i;
//if(temp==num)begin
//    sqr_root_integer = 1;
//    sqr_root = i;
//    end
//    end
//    end
//  endmodule

module kernel(
    input [7:0] ar22,
    input [7:0] ar32,
    input [7:0] ar12,
    input [7:0] ar33,
    input [7:0] ar23,
    input [7:0] ar13,
    input [7:0] ar31,
    input [7:0] ar21,
    input [7:0] ar11,
    output [7:0] dina2
    );
    wire signed [10:0] bw11,bw12,bw13,bw21,bw22,bw23,bw31,bw32,bw33,out2;
    wire signed [11:0] avg,hor,ver;
    wire [7:0] out;
    wire [31:0] sqr;
    integer k; 
    assign bw11 = ar11;
    assign bw12 = ar12;
    assign bw13 = ar13;
    assign bw21 = ar21;
    assign bw22 = ar22;
    assign bw23 = ar23;
    assign bw31 = ar31;
    assign bw32 = ar32;
    assign bw33 = ar33;
    
    assign hor = ( 3*bw11 + 10*bw12 + 3*bw13 - 3*bw31 - 10*bw32 - 3*bw33);// + 510) / 4;
    assign ver = (3*bw11 + 10*bw21 + 3*bw31 - 3*bw13 - 10*bw23 - 3*bw33 );//+ 510) / 4;
   // assign sqr = (hor*hor)+(ver*ver);
   // square_root root(sqr,out2,k);
    assign out2 = (hor + ver) / 2;
    assign out = (out2>80)?255:0;
    
    //assign out2= (hor>0&&ver>0)?(hor+ver):((hor>0&&ver<0) ? (hor-ver):((hor<0&&ver<0)?(-hor-ver):(ver-hor)));   
    //assign out = out2[7:0];
    assign dina2 = out;

//    assign avg = (bw11+bw12+bw13+bw21+bw22+bw23+bw31+bw32+bw33)/9;
//    assign out = avg[7:0];
//    assign dina2 = {out,out,out};
    
//    bw00
    
endmodule
