module test(
    input wire sel,
    input wire data_out,
    inout wire data_bus,
    output wire data_in
);

assign data_in = data_bus;
assign data_bus = (sel == 1'b1)?data_out:1'bz;
endmodule