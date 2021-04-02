`timescale 1ns / 1ps
//------------------------------------------  
//              | |                         |Project name: srl_1
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

module srl_1_verilog(
    input id,
    input iclk,
    output oq
    );
    
    reg dff0, dff1, dff2, dff3, dff4 = 1'b0;
    
    always @(posedge iclk) begin
    	dff0 <= id;
		dff1 <= dff0;
		dff2 <= dff1;
		dff3 <= dff2;
		dff4 <= dff3;
    end
    
    assign oq = dff4;
    
endmodule
