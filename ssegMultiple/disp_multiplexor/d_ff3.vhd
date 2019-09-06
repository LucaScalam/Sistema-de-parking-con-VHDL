library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity d_ff3 is
	generic(N: integer := 2);
	port(
		clk, reset: in std_logic;
		d: in unsigned(N-1 downto 0);
		q: out unsigned(N-1 downto 0)
		);
end d_ff3;

architecture Behavioral of d_ff3 is

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

