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
    reg [172:0] msg;
    reg [172:0] msg2;
    reg [0:7] width;
    reg val;
    reg reset;
    wire rdy;
    pancham p( .clk(clk), .msg_in(msg), .msg_in_width(width),.msg_in_valid(val),.reset(reset),.ready(rdy));
    //fetcher fetch(.clk(clk));
    integer a1;
    integer i;
    integer r;
    reg [7:0] data[0:3];  // Array of four 8-bit characters
    initial
        begin 
        clk = 1'b0;
        msg = "olleh";//40'b0110111101101100011011000110010101101000;//b0110100001100101011011000110110001101111;//b0110111101101100011011000110010101101000;//b0110100001100101011011000110110001101111
       // msg = 40'b0;
        width = 40;
        val = 0;
        reset = 1;
        #1
        reset = 0;
        val = 1;
        
        a1= $fopen("passwordList.txt","r");
            // Read the first two integers from the file
        for (i = 0; i < 4; i = i + 1) begin
          $fscanf(a1, "%c", data[i]);
        end
    
        // Close the file
        //$fclose(a1);
        $display("data %h", data[0]);

    end
    always 
    begin
        #clockRate clk = ~clk;
  
    end
    
    always @ (posedge clk) begin
        
        if(rdy == 1) begin
            for(i = 0; i < 1; i = i + 1) begin
                $fscanf(a1, "%c", r);
            end
            for (i = 0; i < 4; i = i + 1) begin
               $fscanf(a1, "%c", data[i]);
            end
        end
    
    end
endmodule
