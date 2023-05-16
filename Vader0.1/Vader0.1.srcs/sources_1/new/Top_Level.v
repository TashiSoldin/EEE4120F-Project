`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// To do:
// Add clock
// Call supervisors
 
//////////////////////////////////////////////////////////////////////////////////


module Top_Level();
    reg clk;
    parameter clockRate = 0.002;
    
    wire [31:0] hashes_c;
    supervisor s1(.clk(clk), .sASCI1("A"), .sASCI2("a"), .sASCI3("a"), .sASCI4("A"),.hashes_completed(hashes_c));
    supervisor s2(.clk(clk), .sASCI1("E"), .sASCI2("8"), .sASCI3("b"), .sASCI4("D"));
    supervisor s3(.clk(clk), .sASCI1("K"), .sASCI2("8"), .sASCI3("b"), .sASCI4("H"));
    supervisor s4(.clk(clk), .sASCI1("I"), .sASCI2("8"), .sASCI3("b"), .sASCI4("L"));
    supervisor s5(.clk(clk), .sASCI1("P"), .sASCI2("8"), .sASCI3("b"), .sASCI4("M"));
    
    initial begin
        clk = 1'b0;
        
        
        // Need to call supervisors
        
    end 
    
    always 
    begin
        #clockRate clk = ~clk;
  
    end
endmodule
