module top_module(
    input clk,
    input load,
    input [255:0] data,
    output [255:0] q ); 
    logic [ 15 : 0 ] [ 15 : 0 ] grid ;
    logic [15 : 0] [15 : 0] up, down, left, right, cor1, cor2, cor3, cor4 ;
    grid_router inst1 (grid, up, down, left, right, cor1, cor2, cor3, cor4 ) ;
    int j , i, count;
    always @ (posedge clk) begin
        if( load ) grid <= data;
        else begin
            for( i = 0 ; i < 16 ; i++ ) begin
                for( j = 0 ; j < 16 ; j++ ) begin
                    count = up[i][j] + down[i][j] + left[i][j] + right[i][j] + cor1[i][j] + cor2[i][j] + cor3[i][j] + cor4[i][j] ; 
                    case (count) 
                        5'd2 : grid[i][j] <= grid[i][j] ;
                        5'd3 : grid[i][j] <= 1'b1 ;
                        default : grid[i][j] <= 1'b0;
                    endcase
                end
            end
        end
    end
    assign q = grid;
endmodule