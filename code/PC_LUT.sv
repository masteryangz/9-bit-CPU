module PC_LUT #(parameter D=12)(
  input[2:0]          how_high,	   // target 4 values
  output logic[D-1:0] target);

  always_comb case(how_high)
    0: target = 2;  
    1: target = 15;//
	2: target = 50;//k loop
	3: target = -41;//back to k loop
	4: target = 371;//j loop
	5: target = -375;//back to j loop
	6: target = 415;//i loop
	7: target = -425;//back to i loop
	default: target = 'b0;  // hold PC  
  endcase

endmodule