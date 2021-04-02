`timescale 1ns / 1ps
//------------------------------------------  
//              | |                         |Project name: srl_3
//==============+=+==============           |Developer: KeisN13
//              | |            ||           |   
//    |***|    |***|           ||           |Description:   
//====|***|    |***|           \\ |***|     |Simple non-parameterized delay line for 5 clocks  
//====|***|    |***|             =|***|==== |5 stage shift register   
//====|***|====|***|    |**\                |   
//====|***|    |***|====|***\     |***|     |   
//    |***|    |***|    |****|====|***|==== |    
//             |***|    |****|    FPGA      |   
//fpga-systems |***| ru |****| developers   |   
//             |***|    |****|  community   |   
//    |***|    |***|    |****|====|***|==== |   
//====|***|    |***|====|***/     |***|     |   
//====|***|====|***|    |**/                |   
//====|***|    |***|             =|***|==== |   
//====|***|    |***|           // |***|     |   
//    |***|    |***|           ||           |   
//              | |            ||           |web      - https://fpga-systems.ru  
//==============+=+==============           |telegram - https://t.me/fpgasystems   
//              | |                         |Youtube  - https://www.youtube.com/c/fpgasystems   
//------------------------------------------

module srl_3_verilog(
    input id,
    input iclk,
    output oq
    );
    
    reg [4:0] dff = 5'b00000;
    integer i;
    
    always @(posedge iclk) begin
    	dff[0] <= id;
    	for (i = 0; i < 4; i = i+1) begin
    		dff[i + 1] <= dff[i];
    	end
    end
    
    assign oq = dff[4];
    
endmodule
