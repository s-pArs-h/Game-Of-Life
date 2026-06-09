module grid_router (
    input  wire [15:0][15:0] grid,
    output reg  [15:0][15:0] up,
    output reg  [15:0][15:0] down,
    output reg  [15:0][15:0] left,
    output reg  [15:0][15:0] right,
    output reg  [15:0][15:0] cor1,
    output reg  [15:0][15:0] cor2,
    output reg  [15:0][15:0] cor3,
    output reg  [15:0][15:0] cor4
);
    integer i;
    always @(*) begin
        up   = {grid[14:0], grid[15]};
        down = {grid[0], grid[15:1]};
        for (i = 0; i < 16; i = i + 1) begin
            left[i]  = {grid[i][14:0], grid[i][15]};
            right[i] = {grid[i][0], grid[i][15:1]};
        end
        cor1 = {right[14:0], right[15]};
        cor2 = {right[0], right[15:1]};
        cor3 = {left[0], left[15:1]};
        cor4 = {left[14:0], left[15]};
    end
endmodule