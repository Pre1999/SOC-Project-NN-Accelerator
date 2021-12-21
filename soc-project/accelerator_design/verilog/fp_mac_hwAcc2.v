/**************************************************/
/*     Floating Point MAC Hardware Accelerator    */
/**************************************************/
module fp_mac_dma(
				input clk,                      // clock coming in from the Avalon bus
				input reset,                    // reset from the Avalon bus
				input chipselect,
				input [2:0] address,            // 3-bit address coming from the Avalon bus    
				input [31:0] writedata,         // 32-bit write data line
				input write,                    // write request from the Avalon bus
				input read,      
				output waitrequest,               // read request from the Avalon bus
				output reg [31:0] readdata      // 32-bit data line read by the Avalon bus
            );

// Operands for getting inputs
reg [31:0] input_a; 
reg [31:0] input_b; 

// Signal for State Machine
reg [2:0] state;

// Multiplier related signals
reg O_sign_m;
reg [22:0] O_mantissa_m;
reg [7:0] O_exponent_m;
// Multiplier Block I/O Signals
reg [31:0] multiplier_in_A;
reg [31:0] multiplier_in_B;
reg multiplier_out_s;
reg [7:0] multiplier_out_e;
reg [22:0] multiplier_out_m;
// Multiplier Block Internal Signals
reg A_sign_m;
reg [7:0] A_exponent_m;
reg [23:0] A_mantissa_m;
reg B_sign_m;
reg [7:0] B_exponent_m;
reg [23:0] B_mantissa_m;
reg [8:0] intermediate_exponent;
reg [8:0] A_plus_B_exponent_m;
reg [47:0] intermediate_product;		
reg [47:0] final_mantissa;		
reg [31:0] result_m;

// Adder related signals
reg O_sign;
reg [7:0] O_exponent;
reg [22:0] O_mantissa;
//Adder Block I/O Signals
reg [31:0] adder_in_A;
reg [31:0] adder_in_B;
reg adder_out_s;
reg [7:0] adder_out_e;
reg [24:0] adder_out_m;
//Adder Block Internal Signals
reg A_sign;
reg [7:0] A_exponent;
reg [23:0] A_mantissa;
reg B_sign;
reg [7:0] B_exponent;
reg [23:0] B_mantissa;
reg [7:0] exponent_diff;			    //Diff between A_exponent and B_exponent. For shifting purposes. 
reg [23:0] intermediate_mantissa;	    //To hold shifted/aligned mantissa.
//Adder Normalizer I/O Signals
reg [7:0] normalizer_in_e;
reg [24:0] normalizer_in_m;		        //normalizer_in_m[47] is a hidden bit. 
reg [7:0] normalizer_out_e;
reg [24:0] normalizer_out_m;    		//normalizer_out_m[47] is a hidden bit. 



//buffera buffer signals		(buffera addresses: 8'h01 - 8'h60)
wire buffera_write_enable, buffera_read_enable, buffera_empty, buffera_full;
wire buffera_read_en_reg;
reg [31:0] buffera_write_data;
	
//bufferb buffer signals 		(bufferb addresses: 8'h61 - 8'hC0)
wire bufferb_write_enable, bufferb_read_enable, bufferb_empty, bufferb_full;
wire bufferb_read_en_reg;
reg [31:0] bufferb_write_data;


wire [31:0] bufferb_read_data, buffera_read_data;


/*************** Start Of State Machine ***************/

data_buffer BUFFERA(
		.clk(clk), 
		.reset(reset), 
		
		.write_enable(buffera_write_enable), 
		.read_enable(buffera_read_enable), 
		.write_data(buffera_write_data), 
		.read_data(buffera_read_data), 
		
		.buffer_empty(buffera_empty), 
		.buffer_full(buffera_full)
		);
		
		
data_buffer BUFFERB(
		.clk(clk), 
		.reset(reset), 
		
		.write_enable(bufferb_write_enable), 
		.read_enable(bufferb_read_enable), 
		.write_data(bufferb_write_data), 
		.read_data(bufferb_read_data), 
		
		.buffer_empty(bufferb_empty), 
		.buffer_full(bufferb_full))
		;


/*************** Start Of State Machine ***************/
always @(posedge clk)
begin
    if (reset == 1'b1)
    // Reset State
    begin
        input_a = 32'd0;
        input_b = 32'd0;
        readdata = 32'd0;
        state <= 3'b000;
    end 

    else if((state == 3'b000) && (write == 1'b1) && (address == 3'b000))
    // Getting Input Operand A
    begin
        input_a <= writedata;
        state <= 3'b001;
    end

    else if((state == 3'b001) && (write == 1'b1) && (address == 3'b001))
    // Getting Input Operand B and Starting Multiplication
    begin
        input_b = writedata;

        multiplier_in_A = input_a;
        multiplier_in_B = input_b;
		A_sign_m = multiplier_in_A[31];
		A_exponent_m = (multiplier_in_A[30:23] == 8'h0)? 8'h1 : multiplier_in_A[30:23];
		A_mantissa_m = (multiplier_in_A[30:23] == 8'h0)? {1'b0, multiplier_in_A[22:0]} : {1'b1, multiplier_in_A[22:0]};

		B_sign_m = multiplier_in_B[31];
		B_exponent_m = (multiplier_in_B[30:23] == 8'h0)? 8'h1 : multiplier_in_B[30:23];
		B_mantissa_m = (multiplier_in_B[30:23] == 8'h0)? {1'b0, multiplier_in_B[22:0]} : {1'b1, multiplier_in_B[22:0]};

		intermediate_product = A_mantissa_m * B_mantissa_m;										//Simply multiply the mantissas. (Implementation up to the compiler)
		final_mantissa = intermediate_product[47]? intermediate_product : intermediate_product << 1;
		A_plus_B_exponent_m = A_exponent_m + B_exponent_m;
		intermediate_exponent = (A_plus_B_exponent_m - 127 + intermediate_product[47]);		//Biasing the final exponent.

		multiplier_out_s = A_sign_m ^ B_sign_m;													//XORing the input sign bits.
		multiplier_out_e = intermediate_exponent[7:0];
		multiplier_out_m = final_mantissa[46:24] + (final_mantissa[23] & final_mantissa[22] | (| final_mantissa[21:0]));

	    //Exponent Overflow/Underflow Checks
		if(intermediate_exponent >= 255) 
        begin 	//Overflow detected? Most likely because the result_m needed 9-bits instead of 8-bits.
			if(A_plus_B_exponent_m <= 127) 
            begin //Underflow detected? Maybe since (A_exp + Bias + B_exp + Bias <= Bias -> A_exp + B_exp <= -Bias)
				multiplier_out_e = 0;
				multiplier_out_m = 0;
			end  // not needed, no underflow when overflow
		    else	
            begin //Overflow detected? Most likely because the result_m needed 9-bits instead of 8-bits.
				multiplier_out_e = 8'hFF;
				multiplier_out_m = 0;
			end 
		end
		else if(A_plus_B_exponent_m <= 127) begin //Underflow detected? Maybe since (A_exp + Bias + B_exp + Bias <= Bias -> A_exp + B_exp <= -Bias)
			multiplier_out_e = 0;
			multiplier_out_m = 0;
		end  
	
	    //Corner Case Block (Block where the corner cases are taken care of before actual multiplication takes place)
		if(input_a[30:23] == 8'hFF && input_a[22:0] != 0) begin		//A is NaN, output a NaN {A_sign_m, A_exp, A_mant} = {x, '1, x}.
			O_sign_m = input_a[31];
			O_exponent_m = input_a[30:23];
			O_mantissa_m = input_a[22:0];
		end 
		else if(input_b[30:23] == 8'hFF && input_b[22:0] != 0) begin 	//B is NaN, output a NaN {B_sign_m, B_exp, B_mant} = {x, '1, x}.
			O_sign_m = input_b[31];
			O_exponent_m = input_b[30:23];
			O_mantissa_m = input_b[22:0];
		end 
		else if((input_a[30:0] == 31'h7F800000)|| (input_b[30:0] == 31'h7F800000)) begin	//A is inf, output an inf {A_sign_m, A_exp, A_mant} = {x, '1, '0}.
			O_sign_m = input_a[31];
			O_exponent_m = 8'hFF;
			O_mantissa_m = 0;
		end
		else if(input_b[30:0] == 31'h7F800000) begin	//B is inf, output an inf {B_sign_m, B_exp, B_mant} = {x, '1, '0}.
			O_sign_m = input_b[31];
			O_exponent_m = 8'hFF;
			O_mantissa_m = 23'h0;
		end
		else if(input_a[30:0] == 0 || input_b[30:0] == 0) begin		//A or B is zero, output a zero.
			O_sign_m = input_a[31] ^ input_b[31];
			O_exponent_m = 0;
			O_mantissa_m = 0;
		end 
		else begin			//Passed all the corner cases. Pass the inputs to the multiplier block.
			O_sign_m = multiplier_out_s;
			O_exponent_m = multiplier_out_e;
			O_mantissa_m = multiplier_out_m;
		end 
        result_m <= {O_sign_m, O_exponent_m, O_mantissa_m};
        state <= 3'b010;
        // End of Multiplication
    end

    else if((state == 3'b010) && (write == 1'b1) && (address == 3'b010)) 
    begin
    // Getting Input Operand C and Starting Addition
        adder_in_A = writedata;
        adder_in_B = result_m;
        A_sign = adder_in_A[31];
		A_exponent = (adder_in_A[30:23] == 8'h0)? 8'h1 : adder_in_A[30:23];
		A_mantissa = (adder_in_A[30:23] == 8'h0)? {1'b0, adder_in_A[22:0]} : {1'b1, adder_in_A[22:0]};

		B_sign = adder_in_B[31];
		B_exponent = (adder_in_B[30:23] == 8'h0)? 8'h1 : adder_in_B[30:23];
		B_mantissa = (adder_in_B[30:23] == 8'h0)? {1'b0, adder_in_B[22:0]} : {1'b1, adder_in_B[22:0]};

		if(A_exponent == B_exponent) begin 				//Exponents are equal. Just add/subtract mantissas and align.
			adder_out_e = A_exponent;
			if(A_sign == B_sign) begin 					//Signs are the same. Just add mantissas and align.
				adder_out_m = A_mantissa + B_mantissa;
				adder_out_s = A_sign;
				adder_out_m[24] = 1'b1;					//Used later to decide how to align result. 
			end 
			else begin 									//Signs are opposite. Need to find which is greater. Subtract mantissas and align. 
				if(A_mantissa > B_mantissa) begin 		//A > B => A - B is easier to do.
					adder_out_m = A_mantissa - B_mantissa;
					adder_out_s = A_sign;
				end 
				else begin 								//A < B => B - A is easier to do. 
					adder_out_m = B_mantissa - A_mantissa;
					adder_out_s = B_sign;
				end 
			end 
		end
		else begin 										//Exponents not equal. Need to find which is greater. Subtract mantissas and align.
			if(A_exponent > B_exponent) begin 			//A > B => A - B is easier to do.
				adder_out_e = A_exponent;
				adder_out_s = A_sign;
				exponent_diff = A_exponent - B_exponent;
				intermediate_mantissa = B_mantissa >> exponent_diff;
				adder_out_m = (A_sign == B_sign)? (A_mantissa + intermediate_mantissa) : (A_mantissa - intermediate_mantissa);
			end 
			else begin 									//A < B => B - A is easier to do. 
				adder_out_e = B_exponent;
				adder_out_s = B_sign;
				exponent_diff = B_exponent - A_exponent;
				intermediate_mantissa = A_mantissa >> exponent_diff;
				adder_out_m = (A_sign == B_sign)? (B_mantissa + intermediate_mantissa) : (B_mantissa - intermediate_mantissa);
			end 
		end 
	//end 
	//Setting the inputs for the normalizer (In case needed)
		normalizer_in_m = adder_out_m;
		normalizer_in_e = adder_out_e;

	//Adder Normalizer block (This normalizer is for the case where the hidden bit is a 0 (And bit 24 is also a 0))
	//always @ (adder_in_A, adder_in_B) begin 
		if(normalizer_in_m[23:3] == 21'h1) begin
			normalizer_out_e = normalizer_in_e - 20;
			normalizer_out_m = normalizer_in_m << 20;
		end 
		else if(normalizer_in_m[23:4] == 20'h1) begin
			normalizer_out_e = normalizer_in_e - 19;
			normalizer_out_m = normalizer_in_m << 19;
		end 
		else if(normalizer_in_m[23:5] == 19'h1) begin
			normalizer_out_e = normalizer_in_e - 18;
			normalizer_out_m = normalizer_in_m << 18;
		end 
		else if(normalizer_in_m[23:6] == 18'h1) begin
			normalizer_out_e = normalizer_in_e - 17;
			normalizer_out_m = normalizer_in_m << 17;
		end 
		else if(normalizer_in_m[23:7] == 17'h1) begin
			normalizer_out_e = normalizer_in_e - 16;
			normalizer_out_m = normalizer_in_m << 16;
		end 
		else if(normalizer_in_m[23:8] == 16'h1) begin
			normalizer_out_e = normalizer_in_e - 15;
			normalizer_out_m = normalizer_in_m << 15;
		end 
		else if(normalizer_in_m[23:9] == 15'h1) begin
			normalizer_out_e = normalizer_in_e - 14;
			normalizer_out_m = normalizer_in_m << 14;
		end 
		else if(normalizer_in_m[23:10] == 14'h1) begin
			normalizer_out_e = normalizer_in_e - 13;
			normalizer_out_m = normalizer_in_m << 13;
		end 
		else if(normalizer_in_m[23:11] == 13'h1) begin
			normalizer_out_e = normalizer_in_e - 12;
			normalizer_out_m = normalizer_in_m << 12;
		end 
		else if(normalizer_in_m[23:12] == 12'h1) begin
			normalizer_out_e = normalizer_in_e - 11;
			normalizer_out_m = normalizer_in_m << 11;
		end 
		else if(normalizer_in_m[23:13] == 11'h1) begin
			normalizer_out_e = normalizer_in_e - 10;
			normalizer_out_m = normalizer_in_m << 10;
		end 
		else if(normalizer_in_m[23:14] == 10'h1) begin
			normalizer_out_e = normalizer_in_e - 9;
			normalizer_out_m = normalizer_in_m << 9;
		end 
		else if(normalizer_in_m[23:15] == 9'h1) begin
			normalizer_out_e = normalizer_in_e - 8;
			normalizer_out_m = normalizer_in_m << 8;
		end 
		else if(normalizer_in_m[23:16] == 8'h1) begin
			normalizer_out_e = normalizer_in_e - 7;
			normalizer_out_m = normalizer_in_m << 7;
		end 
		else if(normalizer_in_m[23:17] == 7'h1) begin
			normalizer_out_e = normalizer_in_e - 6;
			normalizer_out_m = normalizer_in_m << 6;
		end 
		else if(normalizer_in_m[23:18] == 6'h1) begin
			normalizer_out_e = normalizer_in_e - 5;
			normalizer_out_m = normalizer_in_m << 5;
		end 
		else if(normalizer_in_m[23:19] == 5'h1) begin
			normalizer_out_e = normalizer_in_e - 4;
			normalizer_out_m = normalizer_in_m << 4;
		end 
		else if(normalizer_in_m[23:20] == 4'h1) begin
			normalizer_out_e = normalizer_in_e - 3;
			normalizer_out_m = normalizer_in_m << 3;
		end 
		else if(normalizer_in_m[23:21] == 3'h1) begin
			normalizer_out_e = normalizer_in_e - 2;
			normalizer_out_m = normalizer_in_m << 2;
		end 
		else if(normalizer_in_m[23:22] == 2'h1) begin
			normalizer_out_e = normalizer_in_e - 1;
			normalizer_out_m = normalizer_in_m << 1;
		end
	//end

	//Shifting/Alignment logic
		if(adder_out_m[24]) begin 								//Just need to align the bits by 1.
			adder_out_m = adder_out_m >> 1;
			adder_out_e = adder_out_e + 1;
		end 
		else if(!adder_out_m[23] && adder_out_e != 8'h0) begin 	//Use the normalizer block.
			adder_out_m = normalizer_out_m;
			adder_out_e = normalizer_out_e;
		end 

	//Corner Case Block (Block where the corner cases are taken care of before actual addition takes place)
	//always @ (adder_in_A, adder_in_B) begin 
		if((adder_in_A[30:23] == 8'hFF && adder_in_A[22:0] != 23'h0) || (adder_in_B[30:0] == 31'h0)) begin	//A + B = A if A = NaN or B = 0.
			O_sign = adder_in_A[31];
			O_exponent = adder_in_A[30:23];
			O_mantissa = adder_in_A[22:0];
		end
		else if((adder_in_B[30:23] == 8'hFF && adder_in_B[22:0] != 23'h0) || (adder_in_A[30:0] == 31'h0)) begin	//A + B = B if A = 0 or B = NaN.
			O_sign = adder_in_B[31];
			O_exponent = adder_in_B[30:23];
			O_mantissa = adder_in_B[22:0];
		end
		else if((adder_in_A[30:23] == 8'hFF && adder_in_A[22:0] == 23'h0) || (adder_in_B[30:23] == 8'hFF && adder_in_B[22:0] == 23'h0)) begin 	//A + B = inf if A = inf or B = inf.
			O_sign = adder_in_A[31] ^ adder_in_B[31];
			O_exponent = 8'hFF;
			O_mantissa = 23'h0;
		end 
		else begin 		//Passed all the corner cases. Pass the inputs to the adder block.
			O_sign = adder_out_s;
			O_exponent = adder_out_e;
			O_mantissa = adder_out_m[22:0];
		end
    end
    if (read == 1'b1)
    begin
    	readdata = {O_sign, O_exponent, O_mantissa};
        state <= 3'b000;  
    end
    else
    	readdata <= readdata;
end

endmodule

