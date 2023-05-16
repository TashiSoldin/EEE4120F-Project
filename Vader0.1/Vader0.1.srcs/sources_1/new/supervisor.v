`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//Here is the supervisor
//////////////////////////////////////////////////////////////////////////////////


<<<<<<< HEAD
module supervisor( input clk, input [7:0] sASCI1, input [7:0] sASCI2, input [7:0] sASCI3, input [7:0] sASCI4,
    
    output [31:0] hashes_completed);
    
    reg [127:0] msg;
    //reg [127:0] msg_out;
    reg [127:0] target_hash;
=======
module supervisor( input clk
    
    );
    
    reg [127:0] msg;
>>>>>>> pancham_implementation
    reg [0:7] width;
    reg val;
    reg reset;
    wire rdy;
<<<<<<< HEAD
    wire [127:0] msg_out;
    wire msg_out_valid;
    
    reg [31:0] count;
    
    // Stuff for brute force method
    integer i;
    integer j;
    integer k;
    integer z;
=======
    
    integer i;
    integer j;
    integer k;
>>>>>>> pancham_implementation
    
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
<<<<<<< HEAD
    pancham p1( .clk(clk), .msg_in(msg), .msg_output(msg_out), .msg_in_width(width),.msg_in_valid(val),.reset(reset),.ready(rdy), .msg_out_valid(msg_out_valid)); //.msg_output(msg_out),
    
    initial begin
        count = 0;
        target_hash = 128'he7246975075027a780cca9f41d97b648;
        val = 0;
        reset = 1;
        width = 32;
//        m1 = "a";
//        m2 = "a";
//        m3 = "a";
//        m4 = "a";
        i = sASCI1 -1;
        j = sASCI2 ;
        k = sASCI3 ;
        z = sASCI4 ;
        m1 = i;
        m2 = j;
        m3 = k;
        m4 = z;
        
        assign msg = {m1, m2, m3, m4};
        
=======
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
>>>>>>> pancham_implementation
        #10
        reset = 0;
        val = 1;
        
    end
    
<<<<<<< HEAD
    assign hashes_completed = count;
    
    always @ (posedge msg_out_valid) begin
    count <= count + 1;
    // Hey password found
        if (msg_out == target_hash) begin
            reset <= 1;
            $display("Password found to be %c%c%c%c", m4, m3, m2, m1);
        end
    end
    
    always @ (posedge rdy) begin
        //first go through small letters
        // BEGIN BRUTE FORCE SEQUENCE:
        if (!ad) begin
        
            
            i = i +1; // Blocking maybe
            m1 <= i;
=======
    always @ (posedge rdy) begin
        //first go through small letters
        if (!ad) begin
        
            m1 <= i;
            i <= i +1;
>>>>>>> pancham_implementation
            
            if(i == "z") i <= "A";
            if(i == "Z") i <= "1";
            if(i == "9") begin
                i <= "a";
                ad <= 1; 
            end
        end  
        
        else if (!bd) begin
            ad <= 0;
<<<<<<< HEAD
            j <= j+1;
            m2 <= j;
=======
            m2 <= j;
            j <= j+1;
>>>>>>> pancham_implementation
            if(j == "z") j <= "A";
            if(j == "Z") j <= "1";
            if(j == "9") begin
                j <= "a";
                bd <= 1; 
            end
            
        end
        else if (!cd) begin
            bd <= 0;
<<<<<<< HEAD
            k <= k+1;
=======
>>>>>>> pancham_implementation
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
        
<<<<<<< HEAD
            cd <= 0;
            m4 <= z;
            z <= z+1;
            if(z == "z") z <= "A";
            if(z == "Z") z <= "1";
            if(z == "9") begin
                z <= "a";
                dd <= 1; 
            end
        
        // END OF BRUTE FORCE SEQUENCE     
=======
>>>>>>> pancham_implementation
        end
    end
endmodule
