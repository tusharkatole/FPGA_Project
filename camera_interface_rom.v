`timescale 1ns/1ns

module camera_interface_rom (    
    input wire clk,    
    input wire [7:0] rom_select,
    output wire [15:0] rom_out
);

    reg [15:0] dout;
    assign rom_out = dout;

    always @(posedge clk) begin
        case(rom_select) 
            0:  dout <= 16'h12_80;
            1:  dout <= 16'hFF_F0;
            2:  dout <= 16'hFF_F0;
            3:  dout <= 16'h12_14;
            4:  dout <= 16'h11_80;
            5:  dout <= 16'h0C_00;
            6:  dout <= 16'h3E_00;
            7:  dout <= 16'h04_00;
            8:  dout <= 16'h40_d0;
            9:  dout <= 16'h3a_04;
            10: dout <= 16'h14_18;
            11: dout <= 16'h4F_B3;
            12: dout <= 16'h50_B3;
            13: dout <= 16'h51_00;
            14: dout <= 16'h52_3d;
            15: dout <= 16'h53_A7;
            16: dout <= 16'h54_E4;
            17: dout <= 16'h58_9E;
            18: dout <= 16'h3D_C0;
            19: dout <= 16'h17_14;
            20: dout <= 16'h18_02;
            21: dout <= 16'h32_80;
            22: dout <= 16'h19_03;
            23: dout <= 16'h1A_7B;
            24: dout <= 16'h03_0A;
            25: dout <= 16'h0F_41;
            26: dout <= 16'h1E_00;
            27: dout <= 16'h33_0B;
            28: dout <= 16'h3C_78;
            29: dout <= 16'h69_00;
            30: dout <= 16'h74_00;
            31: dout <= 16'hB0_84;
            32: dout <= 16'hB1_0c;
            33: dout <= 16'hB2_0e;
            34: dout <= 16'hB3_80;
            35: dout <= 16'h70_3a;
            36: dout <= 16'h71_35;
            37: dout <= 16'h72_11;
            38: dout <= 16'h73_f0;
            39: dout <= 16'ha2_02;
            40: dout <= 16'h7a_20;
            41: dout <= 16'h7b_10;
            42: dout <= 16'h7c_1e;
            43: dout <= 16'h7d_35;
            44: dout <= 16'h7e_5a;
            45: dout <= 16'h7f_69;
            46: dout <= 16'h80_76;
            47: dout <= 16'h81_80;
            48: dout <= 16'h82_88;
            49: dout <= 16'h83_8f;
            50: dout <= 16'h84_96;
            51: dout <= 16'h85_a3;
            52: dout <= 16'h86_af;
            53: dout <= 16'h87_c4;
            54: dout <= 16'h88_d7;
            55: dout <= 16'h89_e8;
            56: dout <= 16'h13_e0;
            57: dout <= 16'h00_00;
            58: dout <= 16'h10_00;
            59: dout <= 16'h0d_40;
            60: dout <= 16'h14_18;
            61: dout <= 16'ha5_05;
            62: dout <= 16'hab_07;
            63: dout <= 16'h24_95;
            64: dout <= 16'h25_33;
            65: dout <= 16'h26_e3;
            66: dout <= 16'h9f_78;
            67: dout <= 16'ha0_68;
            68: dout <= 16'ha1_03;
            69: dout <= 16'ha6_d8;
            70: dout <= 16'ha7_d8;
            71: dout <= 16'ha8_f0;
            72: dout <= 16'ha9_90;
            73: dout <= 16'haa_94;
            74: dout <= 16'h13_e5;
            default: dout <= 16'hFF_FF;
        endcase
    end
endmodule
