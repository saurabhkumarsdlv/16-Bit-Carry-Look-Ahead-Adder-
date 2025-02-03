`timescale 1ns / 1ps

// Module for 16-bit Carry Look-Ahead Adder
module CLA(a, b, cin, sum, cout);
input [15:0] a, b; // 16-bit input operands
input cin;         // Carry input
output [15:0] sum; // 16-bit sum output
output cout;       // Carry output
wire c1, c2, c3;   // Internal carry wires

// Instantiate four 4-bit Carry Look-Ahead Adders
CLA_4bit cla1 (.a(a[3:0]), .b(b[3:0]), .cin(cin), .sum(sum[3:0]), .cout(c1));
CLA_4bit cla2 (.a(a[7:4]), .b(b[7:4]), .cin(c1), .sum(sum[7:4]), .cout(c2));
CLA_4bit cla3 (.a(a[11:8]), .b(b[11:8]), .cin(c2), .sum(sum[11:8]), .cout(c3));
CLA_4bit cla4 (.a(a[15:12]), .b(b[15:12]), .cin(c3), .sum(sum[15:12]), .cout(cout));

endmodule

////////////////////////////////////////////////////////
// Module for 4-bit Carry Look-Ahead Adder 
////////////////////////////////////////////////////////

module CLA_4bit(a, b, cin, sum, cout);
input [3:0] a, b; // 4-bit input operands
input cin;        // Carry input
output [3:0] sum; // 4-bit sum output
output cout;      // Carry output

wire [3:0] p, g, c; // Propagate, Generate, and Carry wires

// Compute propagate and generate signals
assign p = a ^ b; // Propagate
assign g = a & b; // Generate

// Compute carry signals
assign c[0] = cin;
assign c[1] = g[0] | (p[0] & c[0]);
assign c[2] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & c[0]);
assign c[3] = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & c[0]);
assign cout = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]) | (p[3] & p[2] & p[1] & p[0] & c[0]);
assign sum = p ^ c; // Compute sum

endmodule