library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;


entity num_generator is
	port(
		clk, reset: in std_logic;
		tick: in std_logic;
		ng: out std_logic_vector(1 downto 0)
	);
end num_generator;

architecture Behavioral of num_generator is
	signal ng_ext: unsigned(1 downto 0) ;
	signal ng_ext2: unsigned(1 downto 0);
begin
	
	ff: entity work.d_ff3
		port map( clk=>clk, reset=>reset, d=>ng_ext, q=>ng_ext2);

	ng_ext <= 	ng_ext2 + 1 when tick = '1' else
					ng_ext2;
	ng <= std_logic_vector(ng_ext2);

end Behavioral; 

 