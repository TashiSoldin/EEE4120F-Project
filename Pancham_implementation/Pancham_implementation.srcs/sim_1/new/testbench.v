`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.05.2023 18:00:42
// Design Name: 
// Module Name: testbench
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


module testbench();
    reg clk;
    parameter clockRate = 0.02;
    //Generate a clock with the above frequency control
    reg [0:172] msg;
    reg [0:7] width;
    reg val;
    reg reset;
    pancham p( .clk(clk), .msg_in(msg), .msg_in_width(width),.msg_in_valid(val),.reset(reset));

    
    initial
    begin 
    clk = 1'b0;
    msg = 40'b0110111101101100011011000110010101101000;//b0110100001100101011011000110110001101111;//b0110111101101100011011000110010101101000;//b0110100001100101011011000110110001101111
    width = 40;
    val = 0;
    reset = 1;
    #1
    reset = 0;
    val = 1;
    end
    always 
    begin
        #clockRate clk = ~clk; //Clock Rate of 0.2 gives #1 is one nano second delay (#x controlls the speed)
        
         
    end
endmodule
