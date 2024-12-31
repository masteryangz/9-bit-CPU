// combinational -- no clock
// sample -- change as desired
module alu(
  input[2:0] ALUOp,    // ALU instructions
  input[7:0] inA, inB,	 // 8-bit wide data path
  input      carry_in,       //add carry
  output logic[7:0] rslt,
  //output logic sc_o,     // shift_carry out
  // reduction XOR (output)
  output logic carry_out,
	output logic taken     // NOR (output)
);
//logic[inB-1:0] shift;
always_comb begin 
  //rslt = 'b0;            
  //sc_o = 'b0;    
  //taken = 'b0;
  case(ALUOp)
/*
    3'b001: begin//lsf
		  shift = inA[inB-1:0];
		  rslt = {shift, inA[7:inB]};
	  end
*/
    3'b000: begin//ld
      rslt = inB;
      carry_out = 1'b0;
      taken = 1'b0;
    end
    3'b001: begin
      rslt = inA >>> 1;
      carry_out = 1'b0;
      taken = 1'b0;
    end
    3'b010: begin
      {carry_out, rslt} = inA + inB + carry_in;
      taken = 1'b0;
    end
	  3'b011: begin//pos
      rslt = 8'b0000_0000;
	    if(inA[7]==1) taken = 1'b1;
      else taken = 1'b0;
      carry_out = 1'b0;
    end
      /*begin
		rslt[7:1] = ina[6:0];
		rslt[0]   = sc_i;
		sc_o      = ina[7];
      end*/
    3'b100: begin// bitwise XOR
      {carry_out, rslt} = inA ^ inB + carry_in;
      taken = 1'b0;
    end
	  3'b101: begin//beq
      rslt = 8'b0000_0000;
	    if(inA==0) taken = 1'b1;
      else taken = 1'b0;
      carry_out = 1'b0;
    end
    3'b110: begin//lw
      rslt = inB;
      taken = 1'b0;
      carry_out = 1'b0;
    end
    3'b111: begin//sw
      rslt = inB;
      taken = 1'b0;
      carry_out = 1'b0;
    end
    default: begin
      rslt = 8'b0000_0000;
      taken = 1'b0;
      carry_out = 1'b0;
    end
  endcase
end
   
endmodule