`timescale 1ns/100ps

module instruction_memory(
	clock,
	read,
    address,
    readdata,
	busywait
);

`define MEM_READ_DELAY #40

input				clock;
input				read;
input[27:0]			address;  // 28 bit memory blocks
output reg [127:0]	readdata; // 128 bit block size
output	reg			busywait;

reg readaccess;

//Declare memory array 1024x8-bits 
reg [7:0] memory_array [1023:0];

// #################################### TODO ####################################
// //Initialize instruction memory 
// initial begin
// 	busywait = 0;
// 	readaccess = 0;
	
//     // Sample program given below. You may hardcode your software program here, or load it from a file:
//     {memory_array[10'd3],  memory_array[10'd2],  memory_array[10'd1],  memory_array[10'd0]}  = 32'b00000000_00000100_00000000_00011001; // loadi 4 #25
//     {memory_array[10'd7],  memory_array[10'd6],  memory_array[10'd5],  memory_array[10'd4]}  = 32'b00000000_00000101_00000000_00100011; // loadi 5 #35
//     {memory_array[10'd11], memory_array[10'd10], memory_array[10'd9],  memory_array[10'd8]}  = 32'b00000010_00000110_00000100_00000101; // add 6 4 5
//     {memory_array[10'd15], memory_array[10'd14], memory_array[10'd13], memory_array[10'd12]} = 32'b00000000_00000001_00000000_01011010; // loadi 1 #90
//     {memory_array[10'd19], memory_array[10'd18], memory_array[10'd17], memory_array[10'd16]} = 32'b00000011_00000001_00000001_00000100; // sub 1 1 4
// 	{memory_array[10'd23], memory_array[10'd22], memory_array[10'd21], memory_array[10'd20]} = 32'b00000010_00000001_00000101_00000110; // add 1 5 6
// end
// ################################################################################

//Detecting an incoming memory access
always @(read)
begin
    busywait = (read)? 1 : 0;
    readaccess = (read)? 1 : 0;
end

//Reading
always @(posedge clock)
begin
	if(readaccess)
	begin
		readdata[7:0]     = `MEM_READ_DELAY memory_array[{address,4'b0000}];
		readdata[15:8]    = `MEM_READ_DELAY memory_array[{address,4'b0001}];
		readdata[23:16]   = `MEM_READ_DELAY memory_array[{address,4'b0010}];
		readdata[31:24]   = `MEM_READ_DELAY memory_array[{address,4'b0011}];
		readdata[39:32]   = `MEM_READ_DELAY memory_array[{address,4'b0100}];
		readdata[47:40]   = `MEM_READ_DELAY memory_array[{address,4'b0101}];
		readdata[55:48]   = `MEM_READ_DELAY memory_array[{address,4'b0110}];
		readdata[63:56]   = `MEM_READ_DELAY memory_array[{address,4'b0111}];
		readdata[71:64]   = `MEM_READ_DELAY memory_array[{address,4'b1000}];
		readdata[79:72]   = `MEM_READ_DELAY memory_array[{address,4'b1001}];
		readdata[87:80]   = `MEM_READ_DELAY memory_array[{address,4'b1010}];
		readdata[95:88]   = `MEM_READ_DELAY memory_array[{address,4'b1011}];
		readdata[103:96]  = `MEM_READ_DELAY memory_array[{address,4'b1100}];
		readdata[111:104] = `MEM_READ_DELAY memory_array[{address,4'b1101}];
		readdata[119:112] = `MEM_READ_DELAY memory_array[{address,4'b1110}];
		readdata[127:120] = `MEM_READ_DELAY memory_array[{address,4'b1111}];
		busywait = 0;
		readaccess = 0;
	end
end
 
endmodule