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
				input read, 			 // read request from the Avalon bus
				output waitrequest,                   
				output reg [31:0] readdata      // 32-bit data line read by the Avalon bus
            );

// Operands for getting inputs
reg [31:0] input_a; 
reg [31:0] input_b; 

// Signal for State Machine
reg [2:0] state;

// Multiplier related signals
reg [31:0] result_m;

//Floating point adder signals
reg [31:0] adder_input_a, adder_input_b; 

wire [31:0] adder_output, multiplier_output;
	
//Floating point multiplier signals
reg [31:0] multiplier_input_a, multiplier_input_b;

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


fp_adder FLOATING_POINT_ADDER(
		.dataa(adder_input_a), 
		.datab(adder_input_b), 
		.result(adder_output)
		);
		

fp_multiplier FLOATING_POINT_MULTIPLIER(
		.dataa(multiplier_input_a), 
		.datab(multiplier_input_b), 
		.result(multiplier_output)
		);

always @(posedge clk)
begin
    if (reset == 1'b1)
    // Reset State
    begin
        input_a <= 32'd0;
        input_b <= 32'd0;
        readdata <= 32'd0;
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
        multiplier_input_b <= writedata;
	multiplier_input_a <= input_a;

        result_m <= multiplier_output;
        state <= 3'b010;
        // End of Multiplication
    end

    else if((state == 3'b010) && (write == 1'b1) && (address == 3'b010)) 
    begin
    // Getting Input Operand C and Starting Addition
        adder_input_a <= writedata;
        adder_input_b <= result_m;
    end
    if (read == 1'b1)
    begin
    	readdata <= adder_output;
        state <= 3'b000;  
    end
    else
    	readdata <= readdata;
end

endmodule

