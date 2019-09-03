library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity Timing is
	generic(N: integer := 19);
	port(
		clk, reset: in std_logic;
		M: in unsigned(N-1 downto 0);
		tick : out std_logic
	);
end Timing;

architecture Behavioral of Timing is
	signal next_state,actual_state: unsigned(N-1 downto 0);
	signal tick_2: std_logic;
begin
	process(clk,reset)
	begin
		if (reset='1') then
			actual_state<=(others=>'0');
		elsif (clk'event and clk='1') then
			actual_state <= next_state;
		end if;
	end process;
	
	next_state <= actual_state + 1 when (tick_2 = '0') else
						(others=>'0');
	tick_2 <= '1' when actual_state = M else
					'0';
	tick <= tick_2;
	
end Behavioral;