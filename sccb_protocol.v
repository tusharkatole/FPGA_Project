`timescale 1ns/1ns
module control_flow_FSM(
input wire clk,
input wire reset,
input wire locked,
input wire ov7670_setup_done,
input wire testmode,
output wire start_capture,
output wire start_ov7670_hw_setup,
output wire [5:0] control_state,
output wire ready_display
);

localparam FSM_START = 0;
localparam FSM_START_SET = 1;
localparam FSM_SETUP_OV7670 = 2;
localparam FSM_VGA_DISPLAY = 3;
localparam FSM_TIMER = 4;

reg ready_display_reg = 0;
reg [2:0] CONTROL_FSM_state = 0;
reg [31:0] timer = 0;
reg [2:0] FSM_return_state = 0;
reg start_capture_reg = 0;
reg start_ov7670_hw_setup_reg = 0;
reg [5:0] control_state_reg = 3'b000_000;

assign ready_display = ready_display_reg;
assign start_capture = start_capture_reg;
assign control_state = control_state_reg;
assign start_ov7670_hw_setup = start_ov7670_hw_setup_reg;

always @(posedge clk or negedge reset) begin
    if (!reset) begin
        CONTROL_FSM_state <= #1 FSM_START;
    end
    else begin
    case (CONTROL_FSM_state)

        FSM_START: begin
            ready_display_reg <= #1 1'b0;
            if (testmode) begin
                CONTROL_FSM_state <= #1 FSM_VGA_DISPLAY;                
                end
            else begin
                CONTROL_FSM_state <= #1 FSM_TIMER;
                timer <= #1 50;
                FSM_return_state <= #1 FSM_START_SET;
            end               
            control_state_reg <= #1 6'b000_001;                        
        end

        FSM_START_SET: begin
            CONTROL_FSM_state <= #1 FSM_TIMER;
            timer <= #1 1;
            FSM_return_state <= #1 FSM_SETUP_OV7670;
            start_ov7670_hw_setup_reg <= #1 1'b1;
            control_state_reg <= #1 6'b000_011;   
        end

        FSM_SETUP_OV7670: begin                
            start_ov7670_hw_setup_reg <= #1 1'b0;
            if (ov7670_setup_done || testmode) begin
                CONTROL_FSM_state <= #1 FSM_TIMER;
                FSM_return_state <= #1 FSM_VGA_DISPLAY;                    
                timer <= #1 7500000;
            end
            else begin
                CONTROL_FSM_state <= #1 FSM_SETUP_OV7670;
            end
            control_state_reg <= #1 6'b001_111;
        end

        FSM_VGA_DISPLAY: begin                
            ready_display_reg <= #1 1'b1;
            start_capture_reg <= #1 1'b1;              
            control_state_reg <= #1 6'b111_111;
        end

        FSM_TIMER: begin                
            CONTROL_FSM_state <= #1 (timer == 0) ? FSM_return_state : FSM_TIMER;
            timer <= #1 (timer == 0) ? 0 : timer - 1;
            control_state_reg <= #1 6'b101_010;
        end

        default: begin
            CONTROL_FSM_state <= #1 FSM_START;    
        end
    endcase
    end
end

endmodule
