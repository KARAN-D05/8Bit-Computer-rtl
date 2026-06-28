`timescale 1ns/1ns

module testbench;

reg clk;
reg rst;

Computer dut(
    .clk(clk),
    .rst(rst)
);

always #5 clk = ~clk;

initial begin

    $monitor(
        "t=%0t | PC=%02h | T=%0d | A=%02h | B=%02h | ALU=%02h | RAM=%02h | Flags[CZNGE]=%b%b%b%b%b",
    $time,
    dut.pc,
    dut.t_state,
    dut.a_out,
    dut.b_out,
    dut.alu_out,
    dut.ram_out,
    dut.carry_flag,
    dut.zero_flag,
    dut.neg_flag,
    dut.agtb_flag,
    dut.aeqb_flag
    );

    $dumpfile("Sim.vcd");
    $dumpvars(0, testbench);

    clk = 0;
    rst = 1;

    #10;
    rst = 0;#500;

    $finish;

end

endmodule