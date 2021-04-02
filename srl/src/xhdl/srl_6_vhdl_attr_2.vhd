--------------------------------------------  
--              | |                         |Project name: srl_6
--==============+=+==============           |Developer: KeisN13
--              | |            ||           |   
--    |***|    |***|           ||           |Description:   
--====|***|    |***|           \\ |***|     |Simple parameterized delay line for N clocks  
--====|***|    |***|             =|***|==== |N stage shift register with two synth attributes   
--====|***|====|***|    |**\                |   
--====|***|    |***|====|***\     |***|     |   
--    |***|    |***|    |****|====|***|==== |Quartus HDL attributes         
--             |***|    |****|    FPGA      |https://www.intel.com/content/www/us/en/programmable/quartushelp/17.0/hdl/vlog/vlog_file_dir.htm   
--fpga-systems |***| ru |****| developers   |      
--             |***|    |****|  community   |Vivado attributes UG901      
--    |***|    |***|    |****|====|***|==== |https://www.xilinx.com/support/documentation/sw_manuals/xilinx2020_2/ug901-vivado-synthesis.pdf    
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


entity srl_6_vhdl_attr_2 is
	generic (
		SRL_LENGTH : natural := 32
	);
    port ( 
    	id 		: in std_logic;
        iclk 	: in std_logic;
        oq 		: out std_logic);
end srl_6_vhdl_attr_2;

architecture rtl of srl_6_vhdl_attr_2 is

	signal dff : std_logic_vector( SRL_LENGTH - 1 downto 0 ) := (others => '0');
	
	attribute shreg_extract : string;
	attribute shreg_extract of dff : signal is "yes";
	
	attribute srl_style : string;
	attribute srl_style of dff : signal is "srl";
	
begin
	
	srl_6 : process (iclk) begin
		if rising_edge(iclk) then
			dff(0) <= id;
			for i in 0 to SRL_LENGTH - 2 loop
				dff(i + 1) <= dff(i);
			end loop;			
		end if;
	end process srl_6;
	
	oq <= dff(SRL_LENGTH - 1);
	
end rtl;
