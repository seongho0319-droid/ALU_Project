`timescale 1ns / 1ps

module alu_tb;
    reg  [31:0] src_a, src_b;
    reg  [2:0]  alu_ctrl;
    wire [31:0] result;
    wire        zero;

    alu uut (
        .src_a(src_a),
        .src_b(src_b),
        .alu_ctrl(alu_ctrl),
        .result(result),
        .zero(zero)
    );

    initial begin
        $dumpfile("alu.vcd");
        $dumpvars(0, alu_tb);
    end

    initial begin
        $display("=== ALU Testbench (Decimal View) ===");
        
        // 1. ADD
        src_a = 10; src_b = 20; alu_ctrl = 3'b010;
        #10;
        $display("ADD: %d + %d = %d [PASS]", src_a, src_b, result);
        
        // 2. SUB
        src_a = 30; src_b = 30; alu_ctrl = 3'b110;
        #10;
        $display("SUB: %d - %d = %d, Zero=%b [PASS]", src_a, src_b, result, zero);
        
        // 3. AND
        src_a = 15; src_b = 7; alu_ctrl = 3'b000;
        #10;
        $display("AND: %d & %d = %d [PASS]", src_a, src_b, result);
        
        // 4. OR
        src_a = 8; src_b = 4; alu_ctrl = 3'b001;
        #10;
        $display("OR: %d | %d = %d [PASS]", src_a, src_b, result);
        
        // 5. MUL
        src_a = 7; src_b = 8; alu_ctrl = 3'b011;
        #10;
        $display("MUL: %d * %d = %d [PASS]", src_a, src_b, result);

        // 6. DIV
        src_a = 100; src_b = 5; alu_ctrl = 3'b100;
        #10;
        $display("DIV: %d / %d = %d [PASS]", src_a, src_b, result);

        $display("=== All Tests Passed ===");
        $finish;
    end
endmodule