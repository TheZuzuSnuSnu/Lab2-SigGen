module sigdelay # (
    parameter ADDRESS_WIDTH = 9,
                DATA_WIDTH = 8
)(
    input logic     rst,
    input logic     clk,
    input logic     en,
    input logic     wr,
    input logic     rd,
    input logic [ADDRESS_WIDTH-1:0] offset,
    input logic [DATA_WIDTH-1:0] mic_signal,
    output logic [DATA_WIDTH-1:0] delayed_signal
);

logic [ADDRESS_WIDTH-1:0] count;

counter#(9) myCounter(
    .clk(clk),
    .rst(rst),
    .en(en),
    .count(count)
);

ram #(9,8) myram(
    .clk(clk),
    .wr_en(wr),
    .rd_en(rd),  
    .wr_addr(count + offset),
    .rd_addr(count),
    .din(mic_signal),
    .dout(delayed_signal)
);

endmodule
