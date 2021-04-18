`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Central Florida
// Engineers: Nick Miller, Chris Upchurch
// 
// Create Date: 04/15/2021 07:31:58 PM
// Design Name: SMVP Systolic Array Accelerator
// Module Name: smvp_systolic_main
// Project Name: CDA5110 Final Project
// Target Devices: Digilent Basys3 (Artix-7 XC7A35T-1CPG236C)
// Tool Versions: Vivado 2020.2
// Description: 
// 
// Dependencies:
// Digilent Basys3 Board Definitions (ref: https://github.com/Xilinx/XilinxBoardStore/tree/2020.2/boards/Digilent/basys3/C.0)
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


// Top Module: Sparse Matrix Vector Multiplication Accelerator
module smvp_systolic_top
    // Parameter Notes:
    // PE array of 16x4 was the optimal topology indicated in research paper "SYSTOLIC SPARSE MATRIX VECTOR MULTIPLY IN THE AGE OF TPUS AND ACCELERATORS"
    // Data bit length of 1 BECAUSE PATTERNS
    #(parameter SYS_ARR_COLS=32,
      parameter SYS_ARR_ROWS=7,
      parameter DATA_BIT_LENGTH=1,
      parameter OUTPUT_BIT_LENGTH=8,
      parameter QUEUE_SIZE=33)
    (
    // Basys3 Clock Input (defined in constraints)
    input clk,
    
    // Basys3 Button Inputs (defined in constraints)
    input btnC,

    // Basys3 LEDs
    output [15:0] led
    );
        
    // Array Inputs
    wire [DATA_BIT_LENGTH-1:0] x_j_input;  // TODO: needs BRAM source for x_j
    wire [DATA_BIT_LENGTH-1:0] a_ij_input [SYS_ARR_ROWS-1:0];  // TODO: needs BRAM source for a_ij
    wire [OUTPUT_BIT_LENGTH-1:0] i_input [SYS_ARR_ROWS-1:0];  // TODO: needs BRAM source for i
    
    
    // Array storage
    reg [DATA_BIT_LENGTH-1:0] x_j [QUEUE_SIZE:0];
    reg [DATA_BIT_LENGTH-1:0] a_ij [SYS_ARR_ROWS-1:0][QUEUE_SIZE-1:0];
    reg [OUTPUT_BIT_LENGTH-1:0] i [SYS_ARR_ROWS-1:0][QUEUE_SIZE-1:0];
    
    
    reg [15:0] counter;
    reg [32:0] big_counter;
    reg [15:0] total;
    
    // PE Interconnects
    wire [DATA_BIT_LENGTH-1:0] ax_xfer [SYS_ARR_COLS:0][SYS_ARR_ROWS:0]; // wires at column index 0 and column last index not used
    wire [OUTPUT_BIT_LENGTH-1:0] i_xfer [SYS_ARR_COLS:0][SYS_ARR_ROWS:0]; // wires at column index 0 and column last index not used
    wire [OUTPUT_BIT_LENGTH-1:0] accum_xfer [SYS_ARR_COLS:0][SYS_ARR_ROWS:0]; // wire at row index 0 not used
    wire [DATA_BIT_LENGTH-1:0] mult_xj_sync [SYS_ARR_ROWS:0]; // wires at index 0 and last index not used
    
    // Array Outputs
    wire [OUTPUT_BIT_LENGTH-1:0] accum_result [SYS_ARR_COLS-1:0];  // TODO: use BRAM or reg for result

    integer iter;

    // BRAM Instantiation
    // Commented out while COE file not ready for import
    // TODO: define memory structures for COE file generation
    //blk_mem_gen_0 tjds_data (.clka(clk),
    //                         .addra(bram_addr), // Bus [10 : 0] for BRAM QUEUE_SIZE 2048
	//                         .douta(bram_data_out)  // Bus [7 : 0] for BRAM width 8
	//                         ); 

    // Dynamic PE Module Instantiation
    generate
        genvar row_num, col_num;
        // Iterate through rows
        for (row_num = 0; row_num < SYS_ARR_ROWS; row_num = row_num + 1) begin
            // Iterate through columns
            for (col_num = 0; col_num < SYS_ARR_COLS; col_num = col_num + 1) begin
            
                //
                // Multiplier PE Generation Section
                //
                
                if( col_num == 0 ) begin

                    
                    // Generate front-end multiplier PE (single instance per row, first column)
                    if (row_num == 0) begin
                        smvp_pe_mult mult( .clk(clk), .reset(btnC),
                                           .a_ij(a_ij_input[row_num]), .x_j_in(x_j_input),
                                           .product_out(ax_xfer[col_num][row_num]), .x_j_out(mult_xj_sync[row_num + 1]) );
                    end
                    else begin
                        smvp_pe_mult mult( .clk(clk), .reset(btnC),
                                           .a_ij(a_ij_input[row_num]), .x_j_in(mult_xj_sync[row_num]),
                                           .product_out(ax_xfer[col_num][row_num]), .x_j_out(mult_xj_sync[row_num + 1]) );
                    end
                end
                
                //
                // Selective Adder PE Generation Section
                //
                
                if (col_num == 0 && row_num == 0) begin
                    // Generate "northwest" selective adder PE (single instance, location [0,0])
                    smvp_pe_seladd sel_add( .clk(clk), .reset(btnC),
                                            .ax_in(ax_xfer[col_num][row_num]), .ax_out(ax_xfer[col_num + 1][row_num]),
                                            .i_in(i_input[row_num]), .i_out(i_xfer[col_num + 1][row_num]),
                                            .accum_in(8'b0), .accum_out(accum_xfer[col_num][row_num + 1]) );                                    
                end
                else if (row_num == 0) begin
                    // Generate "north-edge" selective adder PEs (first row)
                    smvp_pe_seladd sel_add( .clk(clk), .reset(btnC),
                                            .ax_in(ax_xfer[col_num][row_num]), .ax_out(ax_xfer[col_num + 1][row_num]),
                                            .i_in(i_xfer[col_num][row_num]), .i_out(i_xfer[col_num + 1][row_num]),
                                            .accum_in(8'b0), .accum_out(accum_xfer[col_num][row_num + 1]) );                                    
                end
                else if (col_num == 0) begin
                    // Generate "west-edge" selective adder PEs (first column)
                    smvp_pe_seladd sel_add( .clk(clk), .reset(btnC),
                                            .ax_in(ax_xfer[col_num][row_num]), .ax_out(ax_xfer[col_num + 1][row_num]),
                                            .i_in(i_input[row_num]), .i_out(i_xfer[col_num + 1][row_num]),
                                            .accum_in(accum_xfer[col_num][row_num]), .accum_out(accum_xfer[col_num][row_num + 1]) );                                    
                end
                else begin
                    // Generate remaining selective adder PEs (all except north or west edges)
                    smvp_pe_seladd sel_add( .clk(clk), .reset(btnC),
                                            .ax_in(ax_xfer[col_num][row_num]), .ax_out(ax_xfer[col_num + 1][row_num]),
                                            .i_in(i_xfer[col_num][row_num]), .i_out(i_xfer[col_num + 1][row_num]),
                                            .accum_in(accum_xfer[col_num][row_num]), .accum_out(accum_xfer[col_num][row_num + 1]) );    
                end
              
                //
                // Column Accumulator PE Generation Section
                //
                
                if (row_num == SYS_ARR_ROWS - 1) begin
                    // Generate accumulator PEs (last/south row only)
                    smvp_pe_accum accum( .clk(clk), .reset(btnC), .accum_in(accum_xfer[col_num][row_num + 1]), .sum(accum_result[col_num]) );
                end 
    
            end
        end        
    endgenerate
    
//    reg [15:0] interim_sum [SYS_ARR_ROWS/2];
    
//    generate
//        genvar tree_size;
//        for (tree_size = 0; tree_size < SYS_ARR_ROWS; tree_size = tree_size + 2) begin
//            always @(posedge clk) begin
//                interim_sum[tree_size/2] = accum_result[tree_size] + accum_result[tree_size+1];
//             end
//        end
//    endgenerate    

    assign led[7:0] = accum_result[big_counter[32:28]];
    assign led[13:8] = big_counter[32:28];

    initial begin
        counter = 0;
        big_counter = 0;
        a_ij[0][0] = 1'b1;
        a_ij[0][1] = 1'b1;
        a_ij[0][2] = 1'b1;
        a_ij[0][3] = 1'b1;
        a_ij[0][4] = 1'b1;
        a_ij[0][5] = 1'b1;
        a_ij[0][6] = 1'b1;
        a_ij[0][7] = 1'b1;
        a_ij[0][8] = 1'b1;
        a_ij[0][9] = 1'b1;
        a_ij[0][10] = 1'b1;
        a_ij[0][11] = 1'b1;
        a_ij[0][12] = 1'b1;
        a_ij[0][13] = 1'b1;
        a_ij[0][14] = 1'b1;
        a_ij[0][15] = 1'b1;
        a_ij[0][16] = 1'b1;
        a_ij[0][17] = 1'b1;
        a_ij[0][18] = 1'b1;
        a_ij[0][19] = 1'b1;
        a_ij[0][20] = 1'b1;
        a_ij[0][21] = 1'b1;
        a_ij[0][22] = 1'b1;
        a_ij[0][23] = 1'b1;
        a_ij[0][24] = 1'b1;
        a_ij[0][25] = 1'b1;
        a_ij[0][26] = 1'b1;
        a_ij[0][27] = 1'b1;
        a_ij[0][28] = 1'b1;
        a_ij[0][29] = 1'b1;
        a_ij[0][30] = 1'b1;
        a_ij[0][31] = 1'b1;
        a_ij[0][32] = 1'b0;
        a_ij[1][0] = 1'b0;
        a_ij[1][1] = 1'b1;
        a_ij[1][2] = 1'b1;
        a_ij[1][3] = 1'b1;
        a_ij[1][4] = 1'b1;
        a_ij[1][5] = 1'b1;
        a_ij[1][6] = 1'b1;
        a_ij[1][7] = 1'b1;
        a_ij[1][8] = 1'b1;
        a_ij[1][9] = 1'b1;
        a_ij[1][10] = 1'b1;
        a_ij[1][11] = 1'b1;
        a_ij[1][12] = 1'b1;
        a_ij[1][13] = 1'b1;
        a_ij[1][14] = 1'b1;
        a_ij[1][15] = 1'b1;
        a_ij[1][16] = 1'b1;
        a_ij[1][17] = 1'b1;
        a_ij[1][18] = 1'b1;
        a_ij[1][19] = 1'b1;
        a_ij[1][20] = 1'b1;
        a_ij[1][21] = 1'b1;
        a_ij[1][22] = 1'b1;
        a_ij[1][23] = 1'b1;
        a_ij[1][24] = 1'b1;
        a_ij[1][25] = 1'b1;
        a_ij[1][26] = 1'b1;
        a_ij[1][27] = 1'b1;
        a_ij[1][28] = 1'b1;
        a_ij[1][29] = 1'b1;
        a_ij[1][30] = 1'b1;
        a_ij[1][31] = 1'b1;
        a_ij[1][32] = 1'b1;
        a_ij[2][0] = 1'b0;
        a_ij[2][1] = 1'b0;
        a_ij[2][2] = 1'b1;
        a_ij[2][3] = 1'b1;
        a_ij[2][4] = 1'b1;
        a_ij[2][5] = 1'b1;
        a_ij[2][6] = 1'b1;
        a_ij[2][7] = 1'b1;
        a_ij[2][8] = 1'b1;
        a_ij[2][9] = 1'b1;
        a_ij[2][10] = 1'b1;
        a_ij[2][11] = 1'b1;
        a_ij[2][12] = 1'b1;
        a_ij[2][13] = 1'b1;
        a_ij[2][14] = 1'b1;
        a_ij[2][15] = 1'b1;
        a_ij[2][16] = 1'b1;
        a_ij[2][17] = 1'b1;
        a_ij[2][18] = 1'b1;
        a_ij[2][19] = 1'b1;
        a_ij[2][20] = 1'b1;
        a_ij[2][21] = 1'b1;
        a_ij[2][22] = 1'b1;
        a_ij[2][23] = 1'b1;
        a_ij[2][24] = 1'b1;
        a_ij[2][25] = 1'b1;
        a_ij[2][26] = 1'b1;
        a_ij[2][27] = 1'b1;
        a_ij[2][28] = 1'b1;
        a_ij[2][29] = 1'b1;
        a_ij[2][30] = 1'b0;
        a_ij[2][31] = 1'b0;
        a_ij[2][32] = 1'b0;
        a_ij[3][0] = 1'b0;
        a_ij[3][1] = 1'b0;
        a_ij[3][2] = 1'b0;
        a_ij[3][3] = 1'b1;
        a_ij[3][4] = 1'b1;
        a_ij[3][5] = 1'b1;
        a_ij[3][6] = 1'b1;
        a_ij[3][7] = 1'b1;
        a_ij[3][8] = 1'b1;
        a_ij[3][9] = 1'b1;
        a_ij[3][10] = 1'b1;
        a_ij[3][11] = 1'b1;
        a_ij[3][12] = 1'b1;
        a_ij[3][13] = 1'b1;
        a_ij[3][14] = 1'b1;
        a_ij[3][15] = 1'b1;
        a_ij[3][16] = 1'b1;
        a_ij[3][17] = 1'b1;
        a_ij[3][18] = 1'b1;
        a_ij[3][19] = 1'b1;
        a_ij[3][20] = 1'b0;
        a_ij[3][21] = 1'b0;
        a_ij[3][22] = 1'b0;
        a_ij[3][23] = 1'b0;
        a_ij[3][24] = 1'b0;
        a_ij[3][25] = 1'b0;
        a_ij[3][26] = 1'b0;
        a_ij[3][27] = 1'b0;
        a_ij[3][28] = 1'b0;
        a_ij[3][29] = 1'b0;
        a_ij[3][30] = 1'b0;
        a_ij[3][31] = 1'b0;
        a_ij[3][32] = 1'b0;
        a_ij[4][0] = 1'b0;
        a_ij[4][1] = 1'b0;
        a_ij[4][2] = 1'b0;
        a_ij[4][3] = 1'b0;
        a_ij[4][4] = 1'b1;
        a_ij[4][5] = 1'b1;
        a_ij[4][6] = 1'b1;
        a_ij[4][7] = 1'b1;
        a_ij[4][8] = 1'b1;
        a_ij[4][9] = 1'b1;
        a_ij[4][10] = 1'b1;
        a_ij[4][11] = 1'b1;
        a_ij[4][12] = 1'b1;
        a_ij[4][13] = 1'b1;
        a_ij[4][14] = 1'b1;
        a_ij[4][15] = 1'b0;
        a_ij[4][16] = 1'b0;
        a_ij[4][17] = 1'b0;
        a_ij[4][18] = 1'b0;
        a_ij[4][19] = 1'b0;
        a_ij[4][20] = 1'b0;
        a_ij[4][21] = 1'b0;
        a_ij[4][22] = 1'b0;
        a_ij[4][23] = 1'b0;
        a_ij[4][24] = 1'b0;
        a_ij[4][25] = 1'b0;
        a_ij[4][26] = 1'b0;
        a_ij[4][27] = 1'b0;
        a_ij[4][28] = 1'b0;
        a_ij[4][29] = 1'b0;
        a_ij[4][30] = 1'b0;
        a_ij[4][31] = 1'b0;
        a_ij[4][32] = 1'b0;
        a_ij[5][0] = 1'b0;
        a_ij[5][1] = 1'b0;
        a_ij[5][2] = 1'b0;
        a_ij[5][3] = 1'b0;
        a_ij[5][4] = 1'b0;
        a_ij[5][5] = 1'b1;
        a_ij[5][6] = 1'b1;
        a_ij[5][7] = 1'b1;
        a_ij[5][8] = 1'b1;
        a_ij[5][9] = 1'b0;
        a_ij[5][10] = 1'b0;
        a_ij[5][11] = 1'b0;
        a_ij[5][12] = 1'b0;
        a_ij[5][13] = 1'b0;
        a_ij[5][14] = 1'b0;
        a_ij[5][15] = 1'b0;
        a_ij[5][16] = 1'b0;
        a_ij[5][17] = 1'b0;
        a_ij[5][18] = 1'b0;
        a_ij[5][19] = 1'b0;
        a_ij[5][20] = 1'b0;
        a_ij[5][21] = 1'b0;
        a_ij[5][22] = 1'b0;
        a_ij[5][23] = 1'b0;
        a_ij[5][24] = 1'b0;
        a_ij[5][25] = 1'b0;
        a_ij[5][26] = 1'b0;
        a_ij[5][27] = 1'b0;
        a_ij[5][28] = 1'b0;
        a_ij[5][29] = 1'b0;
        a_ij[5][30] = 1'b0;
        a_ij[5][31] = 1'b0;
        a_ij[5][32] = 1'b0;
        a_ij[6][0] = 1'b0;
        a_ij[6][1] = 1'b0;
        a_ij[6][2] = 1'b0;
        a_ij[6][3] = 1'b0;
        a_ij[6][4] = 1'b0;
        a_ij[6][5] = 1'b0;
        a_ij[6][6] = 1'b1;
        a_ij[6][7] = 1'b1;
        a_ij[6][8] = 1'b0;
        a_ij[6][9] = 1'b0;
        a_ij[6][10] = 1'b0;
        a_ij[6][11] = 1'b0;
        a_ij[6][12] = 1'b0;
        a_ij[6][13] = 1'b0;
        a_ij[6][14] = 1'b0;
        a_ij[6][15] = 1'b0;
        a_ij[6][16] = 1'b0;
        a_ij[6][17] = 1'b0;
        a_ij[6][18] = 1'b0;
        a_ij[6][19] = 1'b0;
        a_ij[6][20] = 1'b0;
        a_ij[6][21] = 1'b0;
        a_ij[6][22] = 1'b0;
        a_ij[6][23] = 1'b0;
        a_ij[6][24] = 1'b0;
        a_ij[6][25] = 1'b0;
        a_ij[6][26] = 1'b0;
        a_ij[6][27] = 1'b0;
        a_ij[6][28] = 1'b0;
        a_ij[6][29] = 1'b0;
        a_ij[6][30] = 1'b0;
        a_ij[6][31] = 1'b0;
        a_ij[6][32] = 1'b0;
        i[0][0] = 6;
        i[0][1] = 0;
        i[0][2] = 0;
        i[0][3] = 1;
        i[0][4] = 0;
        i[0][5] = 2;
        i[0][6] = 0;
        i[0][7] = 1;
        i[0][8] = 5;
        i[0][9] = 5;
        i[0][10] = 2;
        i[0][11] = 2;
        i[0][12] = 2;
        i[0][13] = 1;
        i[0][14] = 12;
        i[0][15] = 4;
        i[0][16] = 11;
        i[0][17] = 0;
        i[0][18] = 5;
        i[0][19] = 1;
        i[0][20] = 3;
        i[0][21] = 3;
        i[0][22] = 0;
        i[0][23] = 7;
        i[0][24] = 2;
        i[0][25] = 11;
        i[0][26] = 12;
        i[0][27] = 23;
        i[0][28] = 10;
        i[0][29] = 2;
        i[0][30] = 10;
        i[0][31] = 8;
        i[0][32] = 1'b0;
        i[1][0] = 1'b0;
        i[1][1] = 8;
        i[1][2] = 9;
        i[1][3] = 1;
        i[1][4] = 2;
        i[1][5] = 1;
        i[1][6] = 6;
        i[1][7] = 7;
        i[1][8] = 10;
        i[1][9] = 9;
        i[1][10] = 14;
        i[1][11] = 4;
        i[1][12] = 3;
        i[1][13] = 4;
        i[1][14] = 16;
        i[1][15] = 17;
        i[1][16] = 23;
        i[1][17] = 16;
        i[1][18] = 5;
        i[1][19] = 11;
        i[1][20] = 14;
        i[1][21] = 15;
        i[1][22] = 15;
        i[1][23] = 18;
        i[1][24] = 15;
        i[1][25] = 20;
        i[1][26] = 23;
        i[1][27] = 13;
        i[1][28] = 27;
        i[1][29] = 12;
        i[1][30] = 13;
        i[1][31] = 21;
        i[1][32] = 27;
        i[2][0] = 1'b0;
        i[2][1] = 1'b0;
        i[2][2] = 9;
        i[2][3] = 10;
        i[2][4] = 2;
        i[2][5] = 5;
        i[2][6] = 8;
        i[2][7] = 13;
        i[2][8] = 11;
        i[2][9] = 14;
        i[2][10] = 17;
        i[2][11] = 17;
        i[2][12] = 26;
        i[2][13] = 4;
        i[2][14] = 22;
        i[2][15] = 20;
        i[2][16] = 21;
        i[2][17] = 25;
        i[2][18] = 22;
        i[2][19] = 15;
        i[2][20] = 23;
        i[2][21] = 19;
        i[2][22] = 21;
        i[2][23] = 16;
        i[2][24] = 25;
        i[2][25] = 19;
        i[2][26] = 31;
        i[2][27] = 25;
        i[2][28] = 30;
        i[2][29] = 31;
        i[2][30] = 1'b0;
        i[2][31] = 1'b0;
        i[2][32] = 1'b0;
        i[3][0] = 1'b0;
        i[3][1] = 1'b0;
        i[3][2] = 1'b0;
        i[3][3] = 12;
        i[3][4] = 20;
        i[3][5] = 3;
        i[3][6] = 7;
        i[3][7] = 20;
        i[3][8] = 20;
        i[3][9] = 16;
        i[3][10] = 17;
        i[3][11] = 19;
        i[3][12] = 23;
        i[3][13] = 28;
        i[3][14] = 11;
        i[3][15] = 26;
        i[3][16] = 22;
        i[3][17] = 25;
        i[3][18] = 26;
        i[3][19] = 29;
        i[3][20] = 1'b0;
        i[3][21] = 1'b0;
        i[3][22] = 1'b0;
        i[3][23] = 1'b0;
        i[3][24] = 1'b0;
        i[3][25] = 1'b0;
        i[3][26] = 1'b0;
        i[3][27] = 1'b0;
        i[3][28] = 1'b0;
        i[3][29] = 1'b0;
        i[3][30] = 1'b0;
        i[3][31] = 1'b0;
        i[3][32] = 1'b0;
        i[4][0] = 1'b0;
        i[4][1] = 1'b0;
        i[4][2] = 1'b0;
        i[4][3] = 1'b0;
        i[4][4] = 18;
        i[4][5] = 22;
        i[4][6] = 6;
        i[4][7] = 8;
        i[4][8] = 27;
        i[4][9] = 30;
        i[4][10] = 26;
        i[4][11] = 28;
        i[4][12] = 29;
        i[4][13] = 24;
        i[4][14] = 31;
        i[4][15] = 1'b0;
        i[4][16] = 1'b0;
        i[4][17] = 1'b0;
        i[4][18] = 1'b0;
        i[4][19] = 1'b0;
        i[4][20] = 1'b0;
        i[4][21] = 1'b0;
        i[4][22] = 1'b0;
        i[4][23] = 1'b0;
        i[4][24] = 1'b0;
        i[4][25] = 1'b0;
        i[4][26] = 1'b0;
        i[4][27] = 1'b0;
        i[4][28] = 1'b0;
        i[4][29] = 1'b0;
        i[4][30] = 1'b0;
        i[4][31] = 1'b0;
        i[4][32] = 1'b0;
        i[5][0] = 1'b0;
        i[5][1] = 1'b0;
        i[5][2] = 1'b0;
        i[5][3] = 1'b0;
        i[5][4] = 1'b0;
        i[5][5] = 22;
        i[5][6] = 24;
        i[5][7] = 25;
        i[5][8] = 28;
        i[5][9] = 1'b0;
        i[5][10] = 1'b0;
        i[5][11] = 1'b0;
        i[5][12] = 1'b0;
        i[5][13] = 1'b0;
        i[5][14] = 1'b0;
        i[5][15] = 1'b0;
        i[5][16] = 1'b0;
        i[5][17] = 1'b0;
        i[5][18] = 1'b0;
        i[5][19] = 1'b0;
        i[5][20] = 1'b0;
        i[5][21] = 1'b0;
        i[5][22] = 1'b0;
        i[5][23] = 1'b0;
        i[5][24] = 1'b0;
        i[5][25] = 1'b0;
        i[5][26] = 1'b0;
        i[5][27] = 1'b0;
        i[5][28] = 1'b0;
        i[5][29] = 1'b0;
        i[5][30] = 1'b0;
        i[5][31] = 1'b0;
        i[5][32] = 1'b0;
        i[6][0] = 1'b0;
        i[6][1] = 1'b0;
        i[6][2] = 1'b0;
        i[6][3] = 1'b0;
        i[6][4] = 1'b0;
        i[6][5] = 1'b0;
        i[6][6] = 26;
        i[6][7] = 26;
        i[6][8] = 1'b0;
        i[6][9] = 1'b0;
        i[6][10] = 1'b0;
        i[6][11] = 1'b0;
        i[6][12] = 1'b0;
        i[6][13] = 1'b0;
        i[6][14] = 1'b0;
        i[6][15] = 1'b0;
        i[6][16] = 1'b0;
        i[6][17] = 1'b0;
        i[6][18] = 1'b0;
        i[6][19] = 1'b0;
        i[6][20] = 1'b0;
        i[6][21] = 1'b0;
        i[6][22] = 1'b0;
        i[6][23] = 1'b0;
        i[6][24] = 1'b0;
        i[6][25] = 1'b0;
        i[6][26] = 1'b0;
        i[6][27] = 1'b0;
        i[6][28] = 1'b0;
        i[6][29] = 1'b0;
        i[6][30] = 1'b0;
        i[6][31] = 1'b0;
        i[6][32] = 1'b0;     
    end

    always @(posedge clk) begin
        counter <= counter + 1;
        big_counter <= big_counter + 1;
    end

    assign x_j_input = 1'b1;
    
    generate
        // Iterate through rows
        for (row_num = 0; row_num < SYS_ARR_ROWS; row_num = row_num + 1) begin
            // Iterate through columns
            for (col_num = 0; col_num < SYS_ARR_COLS; col_num = col_num + 1) begin
                    
                assign a_ij_input[row_num] = a_ij[row_num][counter];
                assign i_input[row_num] = i[row_num][counter];
                    
            end
        end
    endgenerate
    
endmodule


// Module: SMVP Processing Element - Multiplier
module smvp_pe_mult     
    #(parameter SYS_ARR_COLS=33,
      parameter SYS_ARR_ROWS=7,
      parameter DATA_BIT_LENGTH=1,
      parameter OUTPUT_BIT_LENGTH=8,
      parameter QUEUE_SIZE=33
    )
    (input clk, reset,input [DATA_BIT_LENGTH-1:0] a_ij, input [DATA_BIT_LENGTH-1:0] x_j_in, output reg [DATA_BIT_LENGTH-1:0] product_out, output reg [DATA_BIT_LENGTH-1:0] x_j_out);
    always @(posedge clk) begin
//        if (reset) begin
//            product_out <= 0;
//            x_j_out <= 0;
//        end
//        else product_out <= a_ij * x_j_in;
        product_out = a_ij & x_j_in;
        x_j_out = x_j_in;
    end
    
//    always @(posedge clk) begin
//        x_j_out = x_j_in; // blocking assignment because all multiplier PEs should receive the same value simultaneously
//    end

endmodule

// Module: SMVP Processing Element - Selective Adder
module smvp_pe_seladd      
    #(parameter SYS_ARR_COLS=33,
      parameter SYS_ARR_ROWS=7,
      parameter DATA_BIT_LENGTH=1,
      parameter OUTPUT_BIT_LENGTH=8,
      parameter QUEUE_SIZE=33
    )
    (input clk, reset, input [DATA_BIT_LENGTH-1:0] ax_in, input [OUTPUT_BIT_LENGTH-1:0] i_in, input [OUTPUT_BIT_LENGTH-1:0] accum_in, output reg ax_out, output reg [OUTPUT_BIT_LENGTH-1:0] i_out, output reg [OUTPUT_BIT_LENGTH-1:0] accum_out);
    always @(posedge clk) begin
        if (reset) begin
                ax_out <= 0;
                i_out <= 0;
                accum_out <= 0;
        end
        else begin
            case (i_in)
                0: begin
                    ax_out <= 0;
                    i_out <= 0;
                    accum_out <= ax_in + accum_in;
                end
                default: begin
                    ax_out <= ax_in;
                    i_out <= i_in - 1;
                    accum_out <= 0;
                end
            endcase
        end
//        case (i_in)
//            0: begin
//                ax_out <= 0;
//                i_out <= 0;
//                accum_out <= ax_in + accum_in;
//            end
//            default: begin
//                ax_out <= ax_in;
//                i_out <= i_in - 1;
//                accum_out <= 0;
//            end
//        endcase
    end
endmodule

// Module: SMVP Processing Element - Accumulator
module smvp_pe_accum      
    #(parameter SYS_ARR_COLS=33,
      parameter SYS_ARR_ROWS=7,
      parameter DATA_BIT_LENGTH=1,
      parameter OUTPUT_BIT_LENGTH=8,
      parameter QUEUE_SIZE=33
    )
    (input clk, reset, input [OUTPUT_BIT_LENGTH-1:0] accum_in, output reg [OUTPUT_BIT_LENGTH-1:0] sum);
    always @(posedge clk) begin
        if (reset) sum <= 0;
        else sum <= sum + accum_in;
//        sum <= sum + accum_in;
    end
endmodule
