`timescale 1ns / 1ps

// Testbench for 16-bit Carry Look-Ahead Adder
module CLA_tb;
    reg [15:0] a, b;
    reg cin;
    wire [15:0] sum;
    wire cout;
    
    // Instantiate the Unit Under Test (UUT)
    CLA uut (
        .a(a), 
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );
    
    initial begin
        // Initialize Inputs with smaller 16-bit values
        a = 16'd3; b = 16'd2; cin = 1'd0;
        #10 a = 16'd7; b = 16'd5; cin = 1'd1;
        #10 a = 16'd15; b = 16'd10; cin = 1'd0;
        #10 a = 16'd20; b = 16'd25; cin = 1'd1;
        #10 a = 16'd50; b = 16'd30; cin = 1'd0;
        #10 a = 16'd100; b = 16'd200; cin = 1'd1;
        #10 a = 16'd255; b = 16'd255; cin = 1'd0;
        #10;
        
        // Finish simulation
        $finish;
    end
    
    initial begin
        $monitor("Time=%0t | A=%d, B=%d, Cin=%d, Sum=%d, Cout=%d", $time, a, b, cin, sum, cout);
    end
    
endmodule
