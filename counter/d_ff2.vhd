library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity d_ff2 is
	generic(N: integer := 16);
	port(
		clk, reset: in std_logic;
		--en: in std_logic;
		d: in std_logic_vector(N-1 downto 0);
		q: out std_logic_vector(N-1 downto 0)
		);
end d_ff2;

architecture Behavioral of d_ff2 is

begin
	process(clk,reset)
	begin
		if (reset='1') then
			q<=(others=>'0');
		elsif (clk'event and clk='1') then
			q <= d;
		end if;
	end process;
end Behavioral;

