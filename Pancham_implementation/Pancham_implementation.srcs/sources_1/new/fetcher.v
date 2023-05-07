`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.05.2023 13:04:57
// Design Name: 
// Module Name: fetcher
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


module fetcher( input clk

    );
  integer file_handle;
  integer data1, data2;

  initial begin
    // Open the file
    file_handle = $fopen("passwordList.txt", "r");

    // Read the first two integers from the file
    $fscanf(file_handle, "%d %d", data1, data2);

    // Close the file
    $fclose(file_handle);

    // Print the data to the console
    $display("Data read from file: %d, %d", data1, data2);
  end
endmodule
