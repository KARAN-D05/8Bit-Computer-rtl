`timescale 1ns/1ns

module testbench;

    reg carry;
    reg neg;
    reg agtb;
    reg aeqb;
    reg zero;
    reg clk;
    reg load;
    reg rst;
    wire carry_out;
    wire neg_out;
    wire agtb_out;
    wire aeqb_out;
    wire zero_out;

    FR dut (
        .carry(carry),
        .neg(neg),
        .agtb(agtb),
        .zero(zero),
        .aeqb(aeqb),
        .clk(clk),
        .load(load),
        .carry_out(carry_out),
        .neg_out(neg_out),
        .agtb_out(agtb_out),
        .zero_out(zero_out),
        .aeqb_out(aeqb_out),
        .rst(rst)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin 

       $monitor("t = %0t | carry = %b | neg = %b | agtb = %b | aeqb = %b | zero = %b | load = %b | rst = %b | carry_out = %b | neg_out = %b | agtb_out = %b | aeqb_out = %b | zero_out = %b"
       , $time, carry, neg, agtb, aeqb, zero, load, rst, carry_out, neg_out, agtb_out, aeqb_out, zero_out);

       $dumpfile("Sim.vcd");
       $dumpvars(0, testbench);

       rst = 1;
       carry = 0;
       neg = 0;
       agtb = 0;
       aeqb = 0;
       zero = 0;
       load = 0;


       @(negedge clk);
       #1;
       rst = 0;

       @(negedge clk);
       #1;
       carry = 1;
       neg = 1;
       agtb = 0;
       aeqb = 0;
       zero = 1;
       load = 1;

       @(negedge clk);
       #1;
       carry = 0;
       neg = 0;
       agtb = 1;
       aeqb = 1;
       zero = 0;
       load = 1;

       @(negedge clk);
       #1;
       carry = 1;
       neg = 1;
       agtb = 1;
       aeqb = 1;
       zero = 1;
       load = 0;

       @(negedge clk);
       #1;
       carry = 1;
       neg = 1;
       agtb = 1;
       aeqb = 1;
       zero = 1;
       load = 1;

       @(negedge clk);
       #1;
       carry = 1;
       neg = 1;
       agtb = 0;
       aeqb = 0;
       zero = 1;
       load = 1;
       rst = 1;

       @(posedge clk);

       $display("Simulation Complete");
       $finish;

    end

endmodule
