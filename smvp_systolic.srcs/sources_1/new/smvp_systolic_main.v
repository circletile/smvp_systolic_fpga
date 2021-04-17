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
    #(parameter SYS_ARR_COLS=16,
      parameter SYS_ARR_ROWS=4,
      parameter DATA_BIT_LENGTH=1)
    (
    // Basys3 Clock Input (defined in constraints)
    input clk,
    
    // Basys3 Button Inputs (defined in constraints)
    input btnC,
    
    // Basys3 7-Segment LED Outputs (defined in constraints)
    output [6:0] seg,
    output [3:0] an, 
    output dp,
    
    // LED Array (1x16)
    output [15:0] led   
    );
    
    // Seven Segment Display Signal (INCOMPLETE)
    reg [15:0] segseven_disp; //input to seg7 to define segment pattern
    
    // Array Inputs
    wire [DATA_BIT_LENGTH-1:0] x_j_input;  // TODO: needs BRAM source for x_j
    wire [DATA_BIT_LENGTH-1:0] a_ij_input [SYS_ARR_ROWS:0];  // TODO: needs BRAM source for a_ij
    wire [DATA_BIT_LENGTH-1:0] i_input [SYS_ARR_ROWS:0];  // TODO: needs BRAM source for i
    
    // PE Interconnects
    wire [DATA_BIT_LENGTH-1:0] ax_xfer [SYS_ARR_COLS:0][SYS_ARR_ROWS:0]; // wires at column index 0 and column last index not used
    wire [DATA_BIT_LENGTH-1:0] i_xfer [SYS_ARR_COLS:0][SYS_ARR_ROWS:0]; // wires at column index 0 and column last index not used
    wire [DATA_BIT_LENGTH-1:0] accum_xfer [SYS_ARR_COLS:0][SYS_ARR_ROWS:0]; // wire at row index 0 not used
    wire [DATA_BIT_LENGTH-1:0] mult_xj_sync [SYS_ARR_ROWS:0]; // wires at index 0 and last index not used
    
    // Array Outputs
    wire [DATA_BIT_LENGTH-1:0] accum_result [SYS_ARR_COLS:0];  // TODO: use BRAM or reg for result

    // BRAM I/O
    reg [7:0] bram_data_out;
    reg [10:0] bram_addr;

    // BRAM Instantiation
    // Commented out while COE file not ready for import
    // TODO: define memory structures for COE file generation
    //blk_mem_gen_0 tjds_data (.clka(clk),
    //                         .addra(bram_addr), // Bus [10 : 0] for BRAM depth 2048
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
                                            .accum_in(0), .accum_out(accum_xfer[col_num][row_num + 1]) );                                    
                end
                else if (row_num == 0) begin
                    // Generate "north-edge" selective adder PEs (first row)
                    smvp_pe_seladd sel_add( .clk(clk), .reset(btnC),
                                            .ax_in(ax_xfer[col_num][row_num]), .ax_out(ax_xfer[col_num + 1][row_num]),
                                            .i_in(i_xfer[col_num][row_num]), .i_out(i_xfer[col_num + 1][row_num]),
                                            .accum_in(0), .accum_out(accum_xfer[col_num][row_num + 1]) );                                    
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
    
    assign led[0] = |(accum_result[0]);
    assign led[1] = |(accum_result[1]);
    assign led[2] = |(accum_result[2]);
    assign led[3] = |(accum_result[3]);
    assign led[4] = |(accum_result[4]);
    assign led[5] = |(accum_result[5]);
    assign led[6] = |(accum_result[6]);
    assign led[7] = |(accum_result[7]);
    assign led[8] = |(accum_result[8]);
    assign led[9] = |(accum_result[9]);
    assign led[10] = |(accum_result[10]);
    assign led[11] = |(accum_result[11]);
    assign led[12] = |(accum_result[12]);
    assign led[13] = |(accum_result[13]);
    assign led[14] = |(accum_result[14]);
    assign led[15] = |(accum_result[15]);
    
endmodule

// Module: Switch Debounce
// Use your system clock for the clock input to produce a synchronous, debounced output
// DELAY = .01 sec with a 100Mhz clock
// ref: http://web.mit.edu/6.111/www/f2016/handouts/L04.pdf
module debounce #(parameter DELAY=1000000-1) (input reset, clk, btn_unstable, output reg btn_stable);
    reg [18:0] count;
    reg old;
    always @(posedge clk) begin
        if (reset) begin // return to known state
            count <= 0;
            old <= 0;
            btn_stable <= 0;
        end
        else if (btn_unstable != old) begin// input changed
            old <= btn_unstable;
            count <= 0;
        end
        else if (count == DELAY) // stable!
            btn_stable <= old;
        else // waiting…
            count <= count + 1;
    end
endmodule

// Module: SMVP Processing Element - Multiplier
module smvp_pe_mult (input clk, reset, a_ij, x_j_in, output reg product_out, x_j_out);
    always @(posedge clk) begin
        if (reset) begin
            product_out <= 0;
            x_j_out <= 0;
        end
        else product_out <= a_ij * x_j_in;      
    end
    
    always @(*) begin
        x_j_out = x_j_in; // blocking assignment because all multiplier PEs should receive the same value simultaneously
    end

endmodule

// Module: SMVP Processing Element - Selective Adder
module smvp_pe_seladd (input clk, reset, ax_in, i_in, accum_in, output reg ax_out, i_out, accum_out);
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
    end
endmodule

// Module: SMVP Processing Element - Accumulator
module smvp_pe_accum (input clk, reset, accum_in, output reg sum);
    always @(posedge clk) begin
        if (reset) sum <= 0;
        else sum <= sum + accum_in;
    end
endmodule
