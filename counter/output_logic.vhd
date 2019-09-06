library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity output_logic is
	generic(N: integer := 16);
	port(
		state_reg: in std_logic_vector( N-1 downto 0);
		q: out std_logic_vector(N-1 downto 0);
		max_tick: out std_logic;
		min_tick: out std_logic
		);
end output_logic;

architecture Behavioral of output_logic is

begin
	with state_reg select
		max_tick <= '1'  when ("1111111111111111"),
				 '0' when others;
	with state_reg select
		min_tick <= '1'  when ("0000000000000000"),
				 '0' when others;
	q <= state_reg;
end Behavioral;

