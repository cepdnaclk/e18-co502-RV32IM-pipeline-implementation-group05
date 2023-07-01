module cache_controller #(parameter CACHE_ASSOCIATIVITY = 2, parameter BLOCK_SIZE = 8)
                      (input clk,
                       input rst,
                       input [31:0] addr,
                       input [31:0] data_in,
                       input valid_in,
                       output [31:0] data_out,
                       output valid_out);

  // Define cache parameters based on the input parameters
  parameter CACHE_SIZE = 512;  // Example value, can be customized
  parameter CACHE_SETS = CACHE_SIZE / (BLOCK_SIZE * CACHE_ASSOCIATIVITY);

  // Define cache signals
  reg [CACHE_ASSOCIATIVITY-1:0] cache_tag [CACHE_SETS-1:0];
  reg [BLOCK_SIZE-1:0] cache_data [CACHE_SETS-1:0][CACHE_ASSOCIATIVITY-1:0];
  reg [CACHE_SETS-1:0] cache_valid;

  // Cache read operation
  always @(posedge clk) begin
    if (rst) begin
      cache_valid <= 0;
    end else begin
      if (valid_in) begin
        cache_valid[cache_index] <= 1;
        cache_data[cache_index][cache_way] <= data_in;
      end
    end
  end

  // Cache write operation
  always @(posedge clk) begin
    if (rst) begin
      cache_valid <= 0;
    end else begin
      if (~valid_in) begin
        cache_valid[cache_index] <= 0;
      end
    end
  end

  // Cache access
  always @(posedge clk) begin
    if (rst) begin
      data_out <= 0;
      valid_out <= 0;
    end else begin
      if (valid_in) begin
        data_out <= cache_data[cache_index][cache_way];
        valid_out <= cache_valid[cache_index];
      end else begin
        data_out <= 0;
        valid_out <= 0;
      end
    end
  end

  // Calculate cache index and way
  reg [CACHE_SETS-1:0] cache_index;
  reg [CACHE_ASSOCIATIVITY-1:0] cache_way;

  always @(addr) begin
    cache_index <= addr[CACHE_SETS-1:BLOCK_SIZE];
    cache_way <= addr[BLOCK_SIZE-1:0];
  end

endmodule
