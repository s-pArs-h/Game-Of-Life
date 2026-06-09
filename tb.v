`timescale 1ns / 1ps
module tb();
    reg clk;
    reg load;
    reg [255:0] data;
    wire [255:0] q;
    top_module uut (
        .clk(clk),
        .load(load),
        .data(data),
        .q(q)
    );
    always #5 clk = ~clk;
    reg [15:0][15:0] initial_grid;
    integer r, c, cycle;
    initial begin
        clk = 0;
        load = 0;
        data = 0;
        initial_grid = 0;
        initial_grid[1][2] = 1'b1;
        initial_grid[2][3] = 1'b1;
        initial_grid[3][1] = 1'b1;
        initial_grid[3][2] = 1'b1;
        initial_grid[3][3] = 1'b1;
        data = initial_grid;
        #10 load = 1;
        #10 load = 0;
        $display("--- Starting Game of Life Simulation ---");
        for (cycle = 0; cycle < 20; cycle = cycle + 1) begin
            @(posedge clk);
            #1;
            $display("\n--- Generation %0d ---", cycle);
            for (r = 0; r < 16; r = r + 1) begin
                for (c = 0; c < 16; c = c + 1) begin
                    if (uut.grid[r][c]) 
                        $write(" * ");
                    else 
                        $write(" . ");
                end
                $display(""); 
            end
        end
        $display("\n--- Simulation Complete ---");
        $finish;
    end

endmodule