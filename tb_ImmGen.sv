`timescale 1ns/1ps

module tb_ImmGen;

  // Inputs
  reg [31:0] Inst;
  reg [2:0] ImmSrc;

  // Output
  wire [31:0] ImmExt;

  ImmGen uut (
    .Inst(Inst),
    .ImmSrc(ImmSrc),
    .ImmExt(ImmExt)
  );

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_ImmGen);
    
    // Display the header
    $display("Time\t\tInst (binary)\t\t\t\t\tImmSrc\tImmExt (binary)");

    // Test Case 1: Tipo I
    Inst = 32'b11111111111100000000011110010011;
    ImmSrc = 3'b000;
    #10 $display("%0t\t%b\t%b\t%b", $time, Inst, ImmSrc, ImmExt);

    // Test Case 2: Tipo S
    Inst = 32'b00000000111100010010001000100011; 
    ImmSrc = 3'b001;
    #10 $display("%0t\t%b\t%b\t%b", $time, Inst, ImmSrc, ImmExt);

    // Test Case 3: Tipo B
    Inst = 32'b11111110000000101010000011100011; 
    ImmSrc = 3'b101;
    #10 $display("%0t\t%b\t%b\t%b", $time, Inst, ImmSrc, ImmExt);

    // Test Case 4: Tipo U
    Inst = 32'b00000000000000000000000010110111; 
    ImmSrc = 3'b010;
    #10 $display("%0t\t%b\t%b\t%b", $time, Inst, ImmSrc, ImmExt);

    // Test Case 5: Tipo J
    Inst = 32'b11111111000000000000011011101111; 
    ImmSrc = 3'b110;
    #10 $display("%0t\t%b\t%b\t%b", $time, Inst, ImmSrc, ImmExt);

    // Test Case 6: Default case
    Inst = 32'b00000000000000000000000000000000; 
    ImmSrc = 3'b111;
    #10 $display("%0t\t%b\t%b\t%b", $time, Inst, ImmSrc, ImmExt);

    $stop;
  end
endmodule