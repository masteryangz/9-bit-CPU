// cache memory/register file
// default address pointer width = 4, for 16 registers
module reg_file #(parameter pw=3)(
  input[7:0] dat_in,
  input      clk,
  input      wr_en,           // write enable
  input[pw-1:0] wr_addr,		  // write address pointer
              rd_addrA,		  // read address pointers
			  rd_addrB,
  output logic[7:0] datA, // read data
                    datB);
  //output logic carry);

  logic[7:0] core[2**pw];    // 2-dim array  8 wide  16 deep
  //logic carry_reg;
  initial core[0] = 8'b0000_0000;
  initial core[1] = 8'b0000_0000;
  initial core[2] = 8'b0000_0000;
  initial core[3] = 8'b0000_0000;
  initial core[4] = 8'b0000_0000;
  initial core[5] = 8'b1111_1111;
  initial core[6] = 8'b0000_0001;
  initial core[7] = 64;
  //initial carry_reg = !taken;

// reads are combinational
  assign datA = core[rd_addrA];
  assign datB = core[rd_addrB];
  //assign carry = carry_reg;

// writes are sequential (clocked)
  always_ff @(posedge clk)
    if(wr_en) core[wr_addr] <= dat_in; 

endmodule