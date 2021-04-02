`timescale 1ns / 1ps
//------------------------------------------  
//              | |                         |Project name: srl_5
//==============+=+==============           |Developer: KeisN13
//              | |            ||           |   
//    |***|    |***|           ||           |Description:   
//====|***|    |***|           \\ |***|     |Simple parameterized delay line for N clocks  
//====|***|    |***|             =|***|==== |N stage shift register  with attribute 
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

module srl_5_verilog_attr(
    input id,
    input iclk,
    output oq
    );
    parameter SRL_LENGTH = 128;
    
	 (* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION ON" *)reg [SRL_LENGTH-1:0] dff;
    
	 integer i;
    
    always @(posedge iclk) begin
    	dff[0] <= id;
    	for (i = 0; i < SRL_LENGTH-1; i = i+1) begin
    		dff[i + 1] <= dff[i];
    	end
    end
    
    assign oq = dff[SRL_LENGTH-1];
    
endmodule
