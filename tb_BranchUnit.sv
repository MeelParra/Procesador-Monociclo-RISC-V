`timescale 1ns/1ps

module tb_BranchUnit;

  reg signed [31:0] RUrs2;
  reg signed [31:0] RUrs1;
  reg [4:0] BrOp;

  wire NextPCSrc;

  // Instantiate the Unit Under Test (UUT)
  BranchUnit uut (
    .RUrs2(RUrs2),
    .RUrs1(RUrs1),
    .BrOp(BrOp),
    .NextPCSrc(NextPCSrc)
  );

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_BranchUnit);
    
    // Display the header
    $display("Time\t\tRUrs1\t\t\tRUrs2\t\tBrOpNextPCSrc");

    // Test Case 1: Default case (No branch)
    RUrs1 = 10; RUrs2 = 20; BrOp = 5'b00000;
    #10 $display("%0t\t%d\t\t%d\t\t%b\t%b", $time, RUrs1, RUrs2, BrOp, NextPCSrc);

    // Test Case 2: Unconditional branch
    RUrs1 = 10; RUrs2 = 20; BrOp = 5'b10000;
    #10 $display("%0t\t%d\t\t%d\t\t%b\t%b", $time, RUrs1, RUrs2, BrOp, NextPCSrc);

    // Test Case 3: BEQ (Branch if Equal)
    RUrs1 = 30; RUrs2 = 30; BrOp = 5'b01000;
    #10 $display("%0t\t%d\t\t%d\t\t%b\t%b", $time, RUrs1, RUrs2, BrOp, NextPCSrc);

    // Test Case 4: BNE (Branch if Not Equal)
    RUrs1 = 30; RUrs2 = 20; BrOp = 5'b01001;
    #10 $display("%0t\t%d\t\t%d\t\t%b\t%b", $time, RUrs1, RUrs2, BrOp, NextPCSrc);

    // Test Case 5: BLT (Branch if Less Than, signed)
    RUrs1 = -10; RUrs2 = -20; BrOp = 5'b01100;
    #10 $display("%0t\t%d\t\t%d\t\t%b\t%b", $time, RUrs1, RUrs2, BrOp, NextPCSrc);

    // Test Case 6: BGE (Branch if Greater or Equal, signed)
    RUrs1 = -20; RUrs2 = -10; BrOp = 5'b01101;
    #10 $display("%0t\t%d\t\t%d\t\t%b\t%b", $time, RUrs1, RUrs2, BrOp, NextPCSrc);

    // Test Case 7: BLTU (Branch if Less Than, unsigned)
    RUrs1 = 10; RUrs2 = -20; BrOp = 5'b01110;
    #10 $display("%0t\t%d\t\t%d\t\t%b\t%b", $time, RUrs1, RUrs2, BrOp, NextPCSrc);

    // Test Case 8: BGEU (Branch if Greater or Equal, unsigned)
    RUrs1 = -20; RUrs2 = 10; BrOp = 5'b01111;
    #10 $display("%0t\t%d\t\t%d\t\t%b\t%b", $time, RUrs1, RUrs2, BrOp, NextPCSrc);

    $stop;
  end
endmodule