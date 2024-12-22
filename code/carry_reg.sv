module carry_reg(
    input clk,
    input carry_out,
    input branch,
    output logic carry_in
);

always_ff @(posedge clk) begin
    carry_in <= branch?1'b0:carry_out;
end
endmodule