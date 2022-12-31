module b_cntr
// #(parameter N = 8)
(
    input logic clk, rst, en,
    output logic [7:0] Q
);

    logic [7:0] D;
    logic [7:0] buff;

    always_ff @(posedge clk, posedge rst)
        if (rst)
            buff <= 8'd0;
        else
            buff <= D;

    always_comb begin
        if (en)
            D = buff + 1;
        else
            D = buff; 
    end

    assign Q = buff;
    
endmodule