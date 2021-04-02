`timescale 1ns / 1ps
//------------------------------------------  
//              | |                         |Project name: srl_2
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

module srl_2_verilog(
    input id,
    input iclk,
    output oq
    );
     
	 reg [4:0] dff = 5'b00000;
    always @(posedge iclk) begin
    	dff <= {dff[3:0], id};
    end
    
    assign oq = dff[4];
    
endmodule
