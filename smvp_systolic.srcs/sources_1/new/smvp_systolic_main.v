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
    #(parameter NODE_COUNT=8)
    (
    // Basys3 Clock Input (defined in constraints)
    input clk,
    
    // Basys3 Button Inputs (defined in constraints)
    input btnC,
    
    // Basys3 7-Segment LED Outputs (defined in constraints)
    output [6:0] seg,
    output [3:0] an, 
    output dp
    );
    
    // Seven Segment Display Signal (INCOMPLETE)
    reg [15:0] segseven_disp; //input to seg7 to define segment pattern
    
    // PE Interconnects
    wire [NODE_COUNT:0] val_xfer;
    wire [NODE_COUNT:0] i_xfer;
    wire [NODE_COUNT:0] accum_xfer;
    wire [NODE_COUNT:0] vector_xfer;
    
    // Dynamic Module Instantiation
    generate
        genvar i; 
        for (i = 0; i < NODE_COUNT; i = i + 1) begin
            // Generate lead multiplier PE (single instance)
            if( i == 0 ) begin
                svmp_pe_mult mult( .clk(clk), .reset(btnC), .a_ij(0), .x_j(0), .val(val_xfer[i]) ); // TODO: needs BRAM source for a_ij/x_j (currently set to zero)
            end
        
            // Generate interconnected selective adder PEs
            svmp_pe_seladd sel_add( .clk(clk), .reset(btnC),
                                    .val_in(val_xfer[i]), .val_out(val_xfer[i+1]),
                                    .i_in(i_xfer[i]), .i_out(i_xfer[i+1]),
                                    .vector_in(vector_xfer[i]), .accum_out(accum_xfer[i]) );
                                    
            // Generate and connect accumulator PEs
            smvp_pe_accum accum( .clk(clk), .reset(btnC), .val(accum_xfer[i]), .sum(0) ); // TODO: needs BRAM dest for sum (currently set to zero)
        end
    endgenerate 
    
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
            old <= btn_unstable;
            btn_stable <= btn_unstable;
        end
        else if (btn_unstable != old) begin// input changed
            old <= btn_unstable;
            count <= 0;
        end
        else if (count == DELAY) // stable!
            btn_stable <= old;
        else // waiting…
            count <= count+1;
    end
endmodule

// Module: SMVP Processing Element - Multiplier
module svmp_pe_mult (input clk, reset, a_ij, x_j, output reg val);
    always @(posedge clk) begin
        if (reset) begin
            val <= 0;
        end
        else
            val <= a_ij * x_j;
    end
endmodule

// Module: SMVP Processing Element - Selective Adder
module svmp_pe_seladd (input clk, reset, val_in, i_in, vector_in, output reg val_out, i_out, accum_out);
    always @(posedge clk) begin
        if (reset) begin
                val_out <= 0;
                i_out <= 0;
        end
        else begin
                i_out <= i_in - 1;
                case (i_in)
                    0: begin
                        accum_out <= val_in + vector_in;
                        i_out <= 0;
                    end
                    default: val_out <= 0;
                endcase
        end
    end
endmodule

// Module: SMVP Processing Element - Accumulator
module svmp_pe_accum (input clk, reset, val, output reg sum);
    always @(posedge clk) begin
        if (reset) begin
            sum <= 0;
        end
        else begin
            sum <= sum + val;
        end
    end
endmodule
