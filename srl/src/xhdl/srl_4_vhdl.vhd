--------------------------------------------  
--              | |                         |Project name: srl_4
--==============+=+==============           |Developer: KeisN13
--              | |            ||           |   
--    |***|    |***|           ||           |Description:   
--====|***|    |***|           \\ |***|     |Simple parameterized delay line for N clocks  
--====|***|    |***|             =|***|==== |N stage shift register   
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


entity srl_4_vhdl is
	generic (
		SRL_LENGTH : natural := 32
	);
    port ( 
    	id 		: in std_logic;
        iclk 	: in std_logic;
        oq 		: out std_logic);
end srl_4_vhdl;

architecture rtl of srl_4_vhdl is

	signal dff : std_logic_vector( SRL_LENGTH - 1 downto 0 ) := (others => '0');

begin
	
	srl_4 : process (iclk) begin
		if rising_edge(iclk) then
			dff(0) <= id;
			for i in 0 to SRL_LENGTH - 2 loop
				dff(i + 1) <= dff(i);
			end loop;			
		end if;
	end process srl_4;
	
	oq <= dff(SRL_LENGTH - 1);
	
end rtl;
