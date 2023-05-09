`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//Here is the supervisor
//////////////////////////////////////////////////////////////////////////////////


module supervisor( input clk
    
    );
    
    reg [127:0] msg;
    reg [0:7] width;
    reg val;
    reg reset;
    wire rdy;
    
    integer i;
    integer j;
    integer k;
    
    integer  a;
    reg ad = 0;
    
    integer b;
    reg bd = 0;
    
    integer  c;
    reg cd = 0;
    
    integer  d;
    reg dd = 0;
    
    // Components of msg
    reg [7:0] m1;
    reg [7:0] m2;
    reg [7:0] m3;
    reg [7:0] m4;
    
    // Call its pancham module
    pancham p1( .clk(clk), .msg_in(msg), .msg_in_width(width),.msg_in_valid(val),.reset(reset),.ready(rdy));
    
    initial begin
        
        val = 0;
        reset = 1;
        width = 40;
        m1 = "a";
        m2 = "a";
        m3 = "a";
        m4 = "a";
        i = "a";
        j = "a";
        k = "a";
        
        assign msg = {m1, m2, m3, m4};
        #10
        reset = 0;
        val = 1;
        
    end
    
    always @ (posedge rdy) begin
        //first go through small letters
        if (!ad) begin
        
            m1 <= i;
            i <= i +1;
            
            if(i == "z") i <= "A";
            if(i == "Z") i <= "1";
            if(i == "9") begin
                i <= "a";
                ad <= 1; 
            end
        end  
        
        else if (!bd) begin
            ad <= 0;
            m2 <= j;
            j <= j+1;
            if(j == "z") j <= "A";
            if(j == "Z") j <= "1";
            if(j == "9") begin
                j <= "a";
                bd <= 1; 
            end
            
        end
        else if (!cd) begin
            bd <= 0;
            m3 <= k;
            k <= k+1;
            if(k == "z") k <= "A";
            if(k == "Z") k <= "1";
            if(k == "9") begin
                k <= "a";
                cd <= 1; 
            end
        
        end
        else if (!dd) begin
        
        end
    end
endmodule
