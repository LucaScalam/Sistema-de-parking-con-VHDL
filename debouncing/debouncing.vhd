library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity debouncing is
	port(
		clk,reset,a,b: in std_logic;
		a_o,b_o: out std_logic
	);
end debouncing;

architecture Behavioral of debouncing is

begin
	deb1: entity work.db_fsm(arch)
		port map(clk=>clk,reset=>reset,sw=>a,db=>a_o);
	deb2: entity work.db_fsm(arch)
		port map(clk=>clk,reset=>reset,sw=>b,db=>b_o);

end Behavioral;

