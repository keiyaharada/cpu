module regfile(src0, src1, dst, we, data, clk, rst_n, data0, data1);
	input clk, rst_n;
	input [4:0] src0, src1;
	input [4:0] dst;
	input we;
	input [43:0] data;
	output [43:0] data0, data1;

	reg [43:0] regis [31:0];
	wire [43:0] MOVEMENT1, MOVEMENT2, MOVEMENT3, MOVEMENT4, MOVEMENT5, MOVEMENT6, MOVEMENT7, MOVEMENT8, MOVEMENT9, MOVEMENT10, MOVEMENT11, MOVEMENT12, MOVEMENT13, MOVEMENT14, TEMP, DEPTHS, BEGINNINGS, BEGINNING_TMP;

	parameter [43:0]BEGINNING = 44'h0_0_1_4_2_0_5_7_3_6_8,
					GOAL = 44'h0_0_0_1_2_3_4_5_6_7_8,
					DEPTH =44'b0000_0000_0000_00_00_00_00_00_00_00_00_00_00_00_00_00_00_00_00,
					CHECK_SPACE = 44'b0000_0000_1000_1000_1000_1000_1000_1000_1000_1000_1000,
					CHECK_DEPTH1 = 44'b0000_0000_0000_0001_0010_0011_0100_0101_0110_0111_1000,
					CHECK_DEPTH2 = 44'b0000_0000_1001_1010_1011_1100_1101_1110_1111_0000_0000,
					CHECK_MOVEMENT = 44'b0000_0000_0000_00_00_00_00_00_00_00_00_00_00_00_00_11_10_01_00
					//STATE_MOVEMENT = 36'b0000_0000_0000_0000_0000_0000_0000_0000_0000
					/*Check_depth3 = 36'b0010_0000_0000_0000_0000_0000_0000_0000_0000,
					Check_depth4 = 36'b0011_0000_0000_0000_0000_0000_0000_0000_0000,
					Check_depth5 = 36'b0100_0000_0000_0000_0000_0000_0000_0000_0000,
					Check_depth6 = 36'b0101_0000_0000_0000_0000_0000_0000_0000_0000,
					Check_depth7 = 36'b0110_0000_0000_0000_0000_0000_0000_0000_0000,
					Check_depth8 = 36'b0111_0000_0000_0000_0000_0000_0000_0000_0000,
					Check_depth9 = 36'b1000_0000_0000_0000_0000_0000_0000_0000_0000,
					Check_depth10 = 36'b1001_0000_0000_0000_0000_0000_0000_0000_0000,
					Check_depth11 = 36'b1010_0000_0000_0000_0000_0000_0000_0000_0000,
					Check_depth12 = 36'b1011_0000_0000_0000_0000_0000_0000_0000_0000,
					Check_depth13 = 36'b1100_0000_0000_0000_0000_0000_0000_0000_0000,
					Check_depth14 = 36'b1101_0000_0000_0000_0000_0000_0000_0000_0000,
					Check_depth15 = 36'b1110_0000_0000_0000_0000_0000_0000_0000_0000,
					Check_depth16 = 36'b1111_0000_0000_0000_0000_0000_0000_0000_0000,
					Check_movement = 36'b00_01_10_11_0000_0000_0000_0000_0000_0000_0000*/;
	
	always @(posedge clk) begin
		if (!rst_n) begin
			//init statement
			regis[0] <= BEGINNING;
			regis[1] <= GOAL;
			regis[2] <= DEPTH;
			regis[3] <= CHECK_SPACE;
			regis[4] <= CHECK_DEPTH1;
			regis[5] <= CHECK_DEPTH2;
			//depth statement
			regis[6] <= 0;//MOVEMENT1
			regis[7] <= 0;//MOVEMENT2
			regis[8] <= 0;//MOVEMENT3
			regis[9] <= 0;//MOVEMENT4
			regis[10] <= 0;//MOVEMENT5
			regis[11] <= 0;//MOVEMENT6
			regis[12] <= 0;//MOVEMENT7
			regis[13] <= 0;//MOVEMENT8
			regis[14] <= 0;//MOVEMENT9
			regis[15] <= 0;//MOVEMENT10
			regis[16] <= 0;//MOVEMENT11
			regis[17] <= 0;//MOVEMENT12
			regis[18] <= 0;//MOVEMENT13
			regis[19] <= 0;//MOVEMENT14
			regis[20] <= 0;//MOVEMENT15
			regis[21] <= 0;//MOVEMENT16
			regis[22] <= 0;//MOVEMENT17
			regis[23] <= 0;//MOVEMENT18
			regis[24] <= 0;//MOVEMENT19
			//OTHERS
			regis[25] <= 0;// STATE_MOVEMENT
			regis[26] <= 44'b0000_0000_0001_0000_0000_0000_0000_0000_0000_0000_0000;
			regis[27] <= 44'b0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0001;
			regis[28] <= 44'b0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000;
			regis[29] <= 44'b0;//BEGINNING_TEMP
			regis[30] <= 0;
			regis[31] <= 0;
		end else begin
			if(we)begin
				regis[dst] <= data;
			end else begin
				regis[dst] <= regis[dst];
			end
		end
	end

	assign data0 = regis[src0];
	assign data1 = regis[src1];
	assign MOVEMENT1 = regis[6];
	assign MOVEMENT2 = regis[7];
	assign MOVEMENT3 = regis[8];
	assign MOVEMENT4 = regis[9];
	assign MOVEMENT5 = regis[10];
	assign MOVEMENT6 = regis[11];
	assign MOVEMENT7 = regis[12];
	assign MOVEMENT8 = regis[13];
	assign MOVEMENT9 = regis[14];
	assign MOVEMENT10 = regis[15];
	assign MOVEMENT11 = regis[16];
	assign MOVEMENT12 = regis[17];
	assign MOVEMENT13 = regis[18];
	assign MOVEMENT14 = regis[19];
	assign TEMP = regis[25];
	assign DEPTHS = regis[2];
	assign BEGINNINGS = regis[0];
	assign BEGINNING_TEMP = regis[29];
endmodule
