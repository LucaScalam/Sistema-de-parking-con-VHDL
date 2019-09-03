library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity FLIPFLOP1 is
	generic(N: integer := 4);
	port(
		clk, reset: in std_logic;
		en: in std_logic;
		d: in std_logic_vector(N-1 downto 0);
		q: out std_logic_vector(N-1 downto 0)
		);
end FLIPFLOP1;

architecture Behavioral of FLIPFLOP1 is

begin
	process(clk,reset)
	begin
		if (reset='1') then
			q<=(others=>'0');
		elsif (clk'event and clk='1') then
			if (en='1') then
				q <= d;
			end if;
		end if;
	end process;

end Behavioral;


