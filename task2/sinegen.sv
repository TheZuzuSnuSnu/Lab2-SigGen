module sinegen # (
    parameter ADDRESS_WIDTH = 8,
            DATA_WIDTH = 8
)(
    input logic     rst,
    input logic     en,
    input logic     clk,
    input logic     [ADDRESS_WIDTH-1:0] offset,
    input logic     [ADDRESS_WIDTH-1:0] incr,
    output logic    [DATA_WIDTH-1:0] dout1,
    output logic    [DATA_WIDTH-1:0] dout2
);

logic [ADDRESS_WIDTH-1:0] count;

counter myCounter(
    .rst(rst),
    .en(en),
    .clk(clk),
    .incr(incr),
    .count(count)
);

rom myRom(
    .clk(clk),
    .addr1(count),
    .addr2(count + offset),
    .dout1(dout1),
    .dout2(dout2)
);

endmodule
