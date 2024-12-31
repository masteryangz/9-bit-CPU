module PC_LUT #(parameter D=12)(
  input[2:0]          how_high,	   // target 4 values
  output logic[D-1:0] target);

  always_comb case(how_high)
    0: target = 2;  
    1: target = 15;//6;
	2: target = 50;//k loop
	3: target = -41;//-26back to k loop
	4: target = 354;//184j loop
	5: target = -358;//-173back to j loop
	6: target = 398;//216i loop
	7: target = -408;//-209back to i loop
	default: target = 'b0;  // hold PC  
  endcase

endmodule

/*

	   pc = 4    0000_0000_0100	  4
	             1111_1111_1111	 -1

                 0000_0000_0011   3

				 (a+b)%(2**12)


   	  1111_1111_1011      -5
      0000_0001_0100     +20
	  1111_1111_1111      -1
	  0000_0000_0000     + 0


  */
