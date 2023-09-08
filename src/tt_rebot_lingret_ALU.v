module tt_um_rebot449_lingret_ALU
(input wire clk,
 input wire ena,
 input wire rst_n,
input [7:0] i_instruction, // ALU Instruction
input [7:0] i_data_0, // Data input A
input [7:0] i_data_1, // Data input B
output [7:0] o_result); // ALU Data Output

reg [7:0] r_output;
always @(i_instruction)
begin
    case(i_instruction)
        8'bxxxxx000 :
            r_output = i_data_1 | i_data_2;
        8'bxxxxx001 :
            r_output = ~(i_data_1 & i_data_2);
        8'bxxxxx010 :
            r_output = ~(i_data_1 | i_data_2);
        8'bxxxxx011 :
            r_output = (i_data_1 & i_data_2);
        8'bxxxxx100 :
            r_output = i_data_1 + i_data_2;
        8'bxxxxx101 :
            r_output = i_data_2 - i_data_1;
        default:
            r_output = 8'b00000000;
    endcase
end

assign o_result = r_output;

endmodule
