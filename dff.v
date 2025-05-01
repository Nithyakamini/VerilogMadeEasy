module dff (
    input d, clock, reset,
    output reg q
);
    always @(posedge clock) begin
        if (reset)
            q <= 1'b0; // Reset q to 0
        else
            q <= d; // Store D input on clock edge
    end
endmodule
