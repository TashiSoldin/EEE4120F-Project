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
    //supervisor s1(.clk(clk), .sASCI1("A"), .sASCI2("a"), .sASCI3("a"), .sASCI4("A"),.hashes_completed(hashes_c));
    parameter N = 4;
    
    
    genvar i;
    
    generate
        if (N == 1)
            supervisor s1(.clk(clk), .sASCI1("a"), .sASCI2("a"), .sASCI3("a"), .sASCI4("a"));
            
        else if (N ==2)   begin
            supervisor s1(.clk(clk), .sASCI1("a"), .sASCI2("a"), .sASCI3("a"), .sASCI4("a"));
            supervisor s2(.clk(clk), .sASCI1("9"), .sASCI2("9"), .sASCI3("9"), .sASCI4("E"));
            end
        
        else if (N == 4) begin
            supervisor s1(.clk(clk), .sASCI1("a"), .sASCI2("a"), .sASCI3("a"), .sASCI4("a"));
            supervisor s2(.clk(clk), .sASCI1("9"), .sASCI2("9"), .sASCI3("E"), .sASCI4("P"));
            supervisor s3(.clk(clk), .sASCI1("9"), .sASCI2("9"), .sASCI3("9"), .sASCI4("E"));
            supervisor s4(.clk(clk), .sASCI1("9"), .sASCI2("9"), .sASCI3("E"), .sASCI4("U"));     
            end  
    endgenerate
    
//    generate 
//        for (i = 0; i < N;  i = i + 1) begin
//            supervisor s1(.clk(clk), .sASCI1("a"), .sASCI2("a"), .sASCI3("a"), .sASCI4("D"));
//        end   
//    endgenerate 
    //supervisor s2(.clk(clk), .sASCI1("E"), .sASCI2("8"), .sASCI3("b"), .sASCI4("D"));
    //supervisor s3(.clk(clk), .sASCI1("K"), .sASCI2("8"), .sASCI3("b"), .sASCI4("H"));
    //supervisor s4(.clk(clk), .sASCI1("I"), .sASCI2("8"), .sASCI3("b"), .sASCI4("L"));
    //supervisor s5(.clk(clk), .sASCI1("P"), .sASCI2("8"), .sASCI3("b"), .sASCI4("M"));
    
    initial begin
        clk = 1'b0;
        
        
    end 
    
    always 
    begin
        #clockRate clk = ~clk;
  
    end
endmodule
