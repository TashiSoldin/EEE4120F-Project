`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// To do:
// Add clock
// Call supervisors
 
//////////////////////////////////////////////////////////////////////////////////


module Top_Level();
    reg clk;
    parameter clockRate = 0.002;
    
    supervisor s1(.clk(clk));
    
    initial begin
        clk = 1'b0;
        
        
        // Need to call supervisors
        
    end 
    
    always 
    begin
        #clockRate clk = ~clk;
  
    end
endmodule
