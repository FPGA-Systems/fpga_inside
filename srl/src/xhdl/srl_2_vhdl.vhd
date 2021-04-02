--------------------------------------------  
--              | |                         |Project name: srl_2
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


entity srl_2_vhdl is
    port ( 
    	id 		: in std_logic;
        iclk 	: in std_logic;
        oq 		: out std_logic);
end srl_2_vhdl;

architecture rtl of srl_2_vhdl is

	signal dff : std_logic_vector( 4 downto 0 ) := (others => '0');

begin
	
	srl_2 : process (iclk) begin
		if rising_edge(iclk) then
			dff <= dff(3 downto 0) & id;
		end if;
	end process srl_2;
	
	oq <= dff(4);
	
end rtl;
