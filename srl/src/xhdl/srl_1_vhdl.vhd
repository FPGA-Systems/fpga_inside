--------------------------------------------  
--              | |                         |Project name: srl_1
--==============+=+==============           |Developer: KeisN13
--              | |            ||           |   
--    |***|    |***|           ||           |Description:   
--====|***|    |***|           \\ |***|     |Simple non-parameterized delay line for 5 clocks  
--====|***|    |***|             =|***|==== |5 stage shift register   
--====|***|====|***|    |**\                |   
--====|***|    |***|====|***\     |***|     |   
--    |***|    |***|    |****|====|***|==== |    
--             |***|    |****|    FPGA      |   
--fpga-systems |***| ru |****| developers   |   
--             |***|    |****|  community   |   
--    |***|    |***|    |****|====|***|==== |   
--====|***|    |***|====|***/     |***|     |   
--====|***|====|***|    |**/                |   
--====|***|    |***|             =|***|==== |   
--====|***|    |***|           // |***|     |   
--    |***|    |***|           ||           |   
--              | |            ||           |web      - https://fpga-systems.ru  
--==============+=+==============           |telegram - https://t.me/fpgasystems   
--              | |                         |Youtube  - https://www.youtube.com/c/fpgasystems   
--------------------------------------------

library ieee;
use ieee.std_logic_1164.all;


entity srl_1_vhdl is
    port ( 
    	id 		: in std_logic;
        iclk 	: in std_logic;
        oq 		: out std_logic);
end srl_1_vhdl;

architecture rtl of srl_1_vhdl is

	signal dff0, dff1, dff2, dff3, dff4 : std_logic := '0';

begin
	
	srl_1 : process (iclk) begin
		if rising_edge(iclk) then
			dff0 <= id;
			dff1 <= dff0;
			dff2 <= dff1;
			dff3 <= dff2;
			dff4 <= dff3;
		end if;
	end process srl_1;
	
	oq <= dff4;
	
end rtl;
