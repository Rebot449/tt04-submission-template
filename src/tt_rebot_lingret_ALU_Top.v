module tt_um_rebot449_lingret_ALU_Top(
    input  wire [7:0] ui_in,    // Dedicated inputs - connected to the input switches
    output wire [7:0] uo_out,   // Dedicated outputs - connected to the 7 segment display
    input  wire [7:0] uio_in,   // IOs: Bidirectional Input path
    output wire [7:0] uio_out,  // IOs: Bidirectional Output path
    output wire [7:0] uio_oe,   // IOs: Bidirectional Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

// use bidirectionals as inputs
    assign uio_oe = 8'b00000000;
	
tt_rebot449_simple_ALU inst
(.i_instruction(ui_in),
 .i_data(uio_in),
 .o_result(uo_out));
	
endmodule

module tt_rebot449_simple_ALU
(input [7:0] i_instruction, // ALU Instruction
input [7:0] i_data, // Data input
output [7:0] o_result); // ALU Data Output

reg [7:0] r_output;
always @(i_instruction)
begin
    case(i_instruction)
        8'bxxxxx000 :
            r_output = i_data[7:4] | i_data[3:0];
        8'bxxxxx001 :
            r_output = ~(i_data[7:4] & i_data[3:0]);
        8'bxxxxx010 :
            r_output = ~(i_data[7:4] | i_data[3:0]);
        8'bxxxxx011 :
            r_output = (i_data[7:4] & i_data[3:0]);
        8'bxxxxx100 :
            r_output = i_data[7:4] + i_data[3:0];
        8'bxxxxx101 :
            r_output = i_data[3:0] - i_data[7:4];
        default:
            r_output = 8'b00000000;
    endcase
end

assign o_result = r_output;

endmodule
